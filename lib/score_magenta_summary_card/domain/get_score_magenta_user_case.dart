import 'package:flutter_studies/score_magenta_summary_card/domain/score_magenta_domain.dart';

mixin GetScoreMagentaUserCase {
  ScoreMagenta scoreMagenta();
}

class GetScoreMagentaUserCaseLive with GetScoreMagentaUserCase {
  @override
  ScoreMagenta scoreMagenta() {
    return ScoreMagenta(
      general: 875,
      food: 816,
      mental: 734,
      sleep: 568,
      alcoholAndSmoke: 698,
      physicalActivity: 678,
      qualityOfLife: 743,
    );
  }
}

class GetScoreMagentaUserCaseError with GetScoreMagentaUserCase {
  @override
  ScoreMagenta scoreMagenta() {
    throw UnimplementedError();
  }
}
