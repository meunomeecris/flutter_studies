import 'package:flutter_studies/lista_de_medicamentos_bloc/domain/get_medicamentos_use_case.dart';
import 'package:flutter_studies/lista_de_medicamentos_bloc/lista_de_medicamentos_bloc.dart';
import 'package:flutter_studies/lista_de_medicamentos_bloc/lista_de_medicamentos_event.dart';
import 'package:flutter_studies/lista_de_medicamentos_bloc/lista_de_medicamentos_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const medicamentos = [
    "Engov",
    "Alka-Seltzer",
    "Eparema",
    "Hidralyte",
    "Tylenol",
    "Complexo B",
  ];

  late ListaDeMedicamentosBloc sut;

  setUp(() {
    sut = ListaDeMedicamentosBloc(
      GetMedicamentosUseCaseMock(medicamentos: medicamentos),
    );
  });

  test("initial state is loading", () {
        expect(sut.state, ListaDeMedicamentosLoading());
  });

  test("loaded state after button pressed", () {
    expectLater(
      sut.stream,
      emits(ListaDeMedicamentosLoaded(medicamentos: medicamentos)),
    );

    sut.add(ButtonTapped());
  });
}
