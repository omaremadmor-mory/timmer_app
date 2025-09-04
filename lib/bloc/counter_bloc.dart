import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:timmer_test/bloc/counter_event.dart';
import 'package:timmer_test/bloc/counter_state.dart';
import 'package:timmer_test/ticker.dart' as myticker;

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final int duration = 60;
  final myticker.Ticker _ticker;
  StreamSubscription<int>? _tickerSubscription;

  CounterBloc({required myticker.Ticker ticker})
    : _ticker = ticker,
      super(Ready(duration: 60)) {
    on<Start>((event, emit) {
      emit(Running(duration: event.duration));
      _tickerSubscription?.cancel();
      _tickerSubscription = _ticker.tick(event.duration).listen((duration) {
        add(Tick(duration: duration));
      });
      on<Pause>((event, emit) {
        if (state is Running) {
          _tickerSubscription?.pause();
          emit(Paused(duration: (state as Running).duration));
        }
      });
      on<Resume>((event, emit) {
        if (state is Paused) {
          _tickerSubscription?.resume();
          emit(Running(duration: (state as Paused).duration));
        }
      });
      on<Reset>((event, emit) {
        _tickerSubscription?.cancel();
        emit(Ready(duration: duration));
      });
      on<Tick>((event, emit) {
        emit(
          event.duration > 0
              ? Running(duration: event.duration)
              : Finished(duration: 0),
        );
      });
    });
  }
}
