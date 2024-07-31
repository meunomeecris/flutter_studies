part of 'score_magenta_summary_card_bloc.dart';

sealed class ScoreMagentaSummaryCardEvent extends Equatable {
  const ScoreMagentaSummaryCardEvent();

  @override
  List<Object> get props => [];
}

final class OnAppearView extends ScoreMagentaSummaryCardEvent {}
