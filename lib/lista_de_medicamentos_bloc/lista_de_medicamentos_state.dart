import 'package:equatable/equatable.dart';

sealed class ListaDeMedicamentosState extends Equatable {}

class ListaDeMedicamentosLoading extends ListaDeMedicamentosState {
  @override
  List<Object?> get props => List.empty();
}

class ListaDeMedicamentosError extends ListaDeMedicamentosState {
   @override
  List<Object?> get props => List.empty();
}

class ListaDeMedicamentosLoaded extends ListaDeMedicamentosState {
  @override
  List<Object?> get props => [medicamentos];
  @override
  String toString() {
    return "ListaDeMedicamentosLoaded: $medicamentos";
  }

  final List<String> medicamentos;

  ListaDeMedicamentosLoaded({required this.medicamentos});

}