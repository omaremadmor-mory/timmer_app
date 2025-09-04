import 'package:equatable/equatable.dart';

class CounterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class Start extends CounterEvent {
  final int duration;
  Start({required this.duration});
}

class Pause extends CounterEvent {}

class Resume extends CounterEvent {}

class Reset extends CounterEvent {}

class Tick extends CounterEvent {
  final int duration;

  Tick({required this.duration});
}
