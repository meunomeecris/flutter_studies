//Regra de negocios
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_studies/dicas_de_saude_setstate/dicas-de-saude-state.dart';

class DicasCubit extends Cubit<DicasDeSaudeState> {
  DicasCubit() : super(DicasDeSaudeStateLoading());

  //event
  void toggleCardButton() {
    switch (state) {
      case DicasDeSaudeStateLoading(): return emit(DicasDeSaudeStateLoaded());
      case DicasDeSaudeStateLoaded(): return emit(DicasDeSaudeStateLoading());
    }
  }
}