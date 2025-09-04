import 'package:flutter/material.dart';
import 'package:timmer_test/bloc/counter_bloc.dart';
import 'package:timmer_test/bloc/counter_event.dart';
import 'package:timmer_test/bloc/counter_state.dart';
import 'package:timmer_test/screens/home.dart';
import 'package:timmer_test/ticker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BlocProvider(
        create: (context) => CounterBloc(ticker: Ticker()),
        child: const Home(),
      ),
    );
  }
}
