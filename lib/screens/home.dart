import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import 'package:timmer_test/bloc/counter_bloc.dart';
import 'package:timmer_test/bloc/counter_state.dart';
import 'package:timmer_test/widgets/action_buttons.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stop Watch")),
      body: Stack(
        children: [
          WaveWidget(
            config: CustomConfig(
              gradients: [
                [Color(0xFF2193b0), Color(0xFF6dd5ed)],
                [Color(0xFF0f2027), Color(0xFF203a43)],
                [Color(0xFF2980b9), Color(0xFF6dd5fa)],
                [Color(0xFF56CCF2), Color(0xFF2F80ED)],
              ],
              durations: [35000, 19440, 10800, 6000],
              heightPercentages: [0.20, 0.23, 0.25, 0.30],
              blur: MaskFilter.blur(BlurStyle.solid, 10),
              gradientBegin: Alignment.bottomLeft,
              gradientEnd: Alignment.topRight,
            ),
            waveAmplitude: 0,
            backgroundImage: DecorationImage(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1600107363560-a2a891080c31?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=672&q=80',
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.3),
                BlendMode.softLight,
              ),
            ),
            size: Size(double.infinity, double.infinity),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 70)),
              Center(
                child: BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) {
                    final String minutesTimer = ((state.duration / 60) % 60)
                        .floor()
                        .toString()
                        .padLeft(2, "0");
                    final String secondTimer = (state.duration % 60)
                        .floor()
                        .toString()
                        .padLeft(2, "0");
                    return Text(
                      "$minutesTimer:$secondTimer",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
              BlocBuilder<CounterBloc, CounterState>(
                buildWhen:
                    (previous, current) =>
                        current.runtimeType != previous.runtimeType,
                builder: (context, state) {
                  return ActionButtons();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
