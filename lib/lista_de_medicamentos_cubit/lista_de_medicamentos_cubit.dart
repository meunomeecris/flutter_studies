import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_studies/lista_de_medicamentos_cubit/lista_de_medicamentos_state.dart';

class ListaDeMedicamentosCubit extends Cubit<ListaDeMedicamentosState> {
  ListaDeMedicamentosCubit() : super(ListaDeMedicamentosLoading());

//   void buttonTapped() => emit(ListaDeMedicamentosLoaded());
    void buttonTapped() {
      try {
        final medicamentos = getMedicamentos(); //requisição async
        emit(ListaDeMedicamentosLoaded(medicamentos: medicamentos));
      } catch (e) {
        emit(ListaDeMedicamentosError());
      }
    }

    List<String> getMedicamentos() {
      // return ["Engov","Alka-Seltzer", "Eparema", "Hidralyte", "Tylenol", "Complexo B"];
      throw 1;
    }
}