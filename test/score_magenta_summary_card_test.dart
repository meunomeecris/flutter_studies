import 'package:flutter_studies/score_magenta_summary_card/bloc/score_magenta_summary_card_bloc.dart';
import 'package:flutter_studies/score_magenta_summary_card/domain/score_magenta_domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  ScoreMagenta score = ScoreMagenta(
    general: 875,
    food: 816,
    mental: 734,
    sleep: 568,
    alcoholAndSmoke: 698,
    physicalActivity: 678,
    qualityOfLife: 743,
  );

  test("initial state is loading", () {
    final sut = ScoreMagentaSummaryCardBloc();
    expect(sut.state, ScoreMagentaSummaryCardInitial());
  });

  test("data was updated on view appear", () {
    final sut = ScoreMagentaSummaryCardBloc();
    expectLater(
        sut.stream, emits(ScoreMagentaSummaryCardUpDate(scoreMagenta: score)));
  });

  test("show throw an error", () {
    final sut = ScoreMagentaSummaryCardBloc();
    expectLater(sut.stream, emits(ScoreMagentaSummaryCardError()));
  });
}
