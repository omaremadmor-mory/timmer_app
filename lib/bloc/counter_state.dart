import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final int duration;

  const CounterState({required this.duration});

  @override
  List<Object?> get props => [duration];
}

class Ready extends CounterState {
  const Ready({required super.duration});
}

class Running extends CounterState {
  const Running({required super.duration});
}

class Paused extends CounterState {
  const Paused({required super.duration});
}

class Finished extends CounterState {
  const Finished({required super.duration});

  @override
  List<Object?> get props => [0];
}
