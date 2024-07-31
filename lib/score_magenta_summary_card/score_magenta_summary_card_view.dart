import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_studies/score_magenta_summary_card/bloc/score_magenta_summary_card_bloc.dart';

class ScoreMagentaSummaryCardView extends StatelessWidget {
  ScoreMagentaSummaryCardView({super.key});

  final ScoreMagentaSummaryCardBloc bloc = ScoreMagentaSummaryCardBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScoreMagentaSummaryCardBloc,
        ScoreMagentaSummaryCardState>(
      bloc: bloc,
      builder: (context, state) {
        return Scaffold(
          body: Center(child: getScoreMagentaList()),
        );
      },
    );
  }

  Widget getScoreMagentaList() {
    final currentData = bloc.state;
    switch (currentData) {
      case ScoreMagentaSummaryCardInitial():
        return const CircularProgressIndicator();
      case ScoreMagentaSummaryCardUpDate():
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //food
            ScoreMagentaSlideCustom(
                score: currentData.scoreMagenta.food.toDouble(),
                icon: Icons.food_bank_sharp),
            //mental
            ScoreMagentaSlideCustom(
                score: currentData.scoreMagenta.mental.toDouble(),
                icon: Icons.headphones),
            //sleep
            ScoreMagentaSlideCustom(
                score: currentData.scoreMagenta.sleep.toDouble(),
                icon: Icons.bed),
            //alcoholAndSmoke
            ScoreMagentaSlideCustom(
                score: currentData.scoreMagenta.alcoholAndSmoke.toDouble(),
                icon: Icons.local_drink_sharp),
            //physicalActivity
            ScoreMagentaSlideCustom(
                score: currentData.scoreMagenta.physicalActivity.toDouble(),
                icon: Icons.sports_gymnastics),
            //qualityOfLife
            ScoreMagentaSlideCustom(
                score: currentData.scoreMagenta.qualityOfLife.toDouble(),
                icon: Icons.cloud),
          ],
        );
      case ScoreMagentaSummaryCardError():
        return const Text(
            "Não foi possível carregar as informações de score magenta");
    }
  }
}

class ScoreMagentaSlideCustom extends StatelessWidget {
  const ScoreMagentaSlideCustom(
      {super.key, required this.score, required this.icon});

  final double score;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 300),
        RotatedBox(
          quarterTurns: 3,
          child: Slider(
            min: 0,
            max: 1000,
            divisions: 100,
            value: score,
            allowedInteraction: SliderInteraction.slideThumb,
            activeColor: const Color.fromARGB(255, 138, 10, 123),
            onChanged: (double value) {
              // setState(() {
              //   sleepScore = value;
              // });
            },
          ),
        ),
        Icon(
          icon,
          color: Colors.black26,
        ),
      ],
    );
  }
}
