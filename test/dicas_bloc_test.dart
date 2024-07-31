import 'package:flutter_studies/dicas_de_saude_bloc/dicas_bloc.dart';
import 'package:flutter_studies/dicas_de_saude_bloc/dicas_event.dart';
import 'package:flutter_studies/dicas_de_saude_bloc/dicas_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //Test all the states
  test("initial state is loading", () {
    final sut = DicasBloc();
    expect(sut.state, DicasStateLoading());
  });

  test("loaded state after button pressed", () {
    final sut = DicasBloc();
    expectLater(sut.stream, emits(DicasStateLoaded()));
    sut.add(OnViewAppear());
  });
}
