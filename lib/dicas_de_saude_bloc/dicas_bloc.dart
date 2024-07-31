import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_studies/dicas_de_saude_bloc/dicas_event.dart';
import 'package:flutter_studies/dicas_de_saude_bloc/dicas_state.dart';

class DicasBloc extends Bloc<DicasEvent, DicasState> {
  DicasBloc() : super(DicasStateLoading()) {
    on<OnViewAppear>((event, emit) => _onViewAppear(event, emit));
  }

  void _onViewAppear(OnViewAppear event, Emitter<DicasState> emit) {
    emit(DicasStateLoaded());
  }
 
}