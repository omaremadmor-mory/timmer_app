import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timmer_test/bloc/counter_bloc.dart';
import 'package:timmer_test/bloc/counter_event.dart';
import 'package:timmer_test/bloc/counter_state.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: _mapStateToActionButtons(BlocProvider.of<CounterBloc>(context)),
    );
  }

  List<Widget> _mapStateToActionButtons(CounterBloc countebloc) {
    final CounterState state = countebloc.state;
    if (state is Ready) {
      return [
        FloatingActionButton(
          onPressed: () {
            countebloc.add(Start(duration: state.duration));
          },
          child: Icon(Icons.play_arrow),
        ),
      ];
    }
    if (state is Running) {
      return [
        FloatingActionButton(
          onPressed: () {
            countebloc.add(Pause());
          },
          child: Icon(Icons.pause),
        ),
        FloatingActionButton(
          onPressed: () {
            countebloc.add(Reset());
          },
          child: Icon(Icons.replay),
        ),
      ];
    }
    if (state is Paused) {
      return [
        FloatingActionButton(
          onPressed: () {
            countebloc.add(Resume());
          },
          child: Icon(Icons.play_arrow),
        ),
        FloatingActionButton(
          onPressed: () {
            countebloc.add(Reset());
          },
          child: Icon(Icons.replay),
        ),
      ];
    }
    if (state is Finished) {
      return [
        FloatingActionButton(
          onPressed: () {
            countebloc.add(Reset());
          },
          child: Icon(Icons.replay),
        ),
      ];
    }

    return [];
  }
}
