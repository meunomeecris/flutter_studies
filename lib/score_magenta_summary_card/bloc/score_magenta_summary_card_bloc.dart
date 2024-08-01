import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_studies/score_magenta_summary_card/domain/get_score_magenta_user_case.dart';
import 'package:flutter_studies/score_magenta_summary_card/domain/score_magenta_domain.dart';

part 'score_magenta_summary_card_event.dart';
part 'score_magenta_summary_card_state.dart';

class ScoreMagentaSummaryCardBloc
    extends Bloc<ScoreMagentaSummaryCardEvent, ScoreMagentaSummaryCardState> {
  final GetScoreMagentaUserCase getScoreMagentaUserCase;

  ScoreMagentaSummaryCardBloc(this.getScoreMagentaUserCase)
      : super(ScoreMagentaSummaryCardInitial()) {
    on<OnAppearView>(_onAppearView);
    add(OnAppearView());
  }

  void _onAppearView(
      OnAppearView event, Emitter<ScoreMagentaSummaryCardState> emit) {
    try {
      emit(ScoreMagentaSummaryCardUpDate(
          scoreMagenta: getScoreMagentaUserCase.scoreMagenta()));
    } catch (error) {
      emit(ScoreMagentaSummaryCardError());
    }
  }
}
