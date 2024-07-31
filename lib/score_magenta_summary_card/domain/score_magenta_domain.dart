import 'package:equatable/equatable.dart';

class ScoreMagenta extends Equatable {
  int general;
  int food;
  int mental;
  int sleep;
  int alcoholAndSmoke;
  int physicalActivity;
  int qualityOfLife;

  ScoreMagenta({
    required this.general,
    required this.food,
    required this.mental,
    required this.sleep,
    required this.alcoholAndSmoke,
    required this.physicalActivity,
    required this.qualityOfLife,
  });

  @override
  List<Object?> get props => [];
}
