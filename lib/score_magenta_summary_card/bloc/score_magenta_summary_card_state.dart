part of 'score_magenta_summary_card_bloc.dart';

sealed class ScoreMagentaSummaryCardState extends Equatable {
  const ScoreMagentaSummaryCardState();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
final class ScoreMagentaSummaryCardInitial
    extends ScoreMagentaSummaryCardState {}

// ignore: must_be_immutable
final class ScoreMagentaSummaryCardUpDate extends ScoreMagentaSummaryCardState {
  final ScoreMagenta scoreMagenta;

  const ScoreMagentaSummaryCardUpDate({required this.scoreMagenta});
}

// ignore: must_be_immutable
final class ScoreMagentaSummaryCardError extends ScoreMagentaSummaryCardState {}
