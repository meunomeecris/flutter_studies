import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_studies/lista_de_medicamentos_bloc/domain/get_medicamentos_use_case.dart';

import 'lista_de_medicamentos_event.dart';
import 'lista_de_medicamentos_state.dart';

class ListaDeMedicamentosBloc
    extends Bloc<ListaDeMedicamentosEvent, ListaDeMedicamentosState> {
  final GetMedicamentosUseCase getMedicamentosUseCase;

  ListaDeMedicamentosBloc(this.getMedicamentosUseCase)
      : super(ListaDeMedicamentosLoading()) {
    on<ButtonTapped>((event, emit) => _buttonTapped(event, emit));
    // on<ButtonTapped>(_buttonTapped);
  }

  void _buttonTapped(
      ButtonTapped event, Emitter<ListaDeMedicamentosState> emit) {
    try {
      final medicamentos =
          getMedicamentosUseCase.getMedicamentos(); //requisição async
      emit(ListaDeMedicamentosLoaded(medicamentos: medicamentos));
    } catch (e) {
      emit(ListaDeMedicamentosError());
    }
  }
}
