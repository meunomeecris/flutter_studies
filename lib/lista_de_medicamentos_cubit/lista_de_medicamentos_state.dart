sealed class ListaDeMedicamentosState {}

class ListaDeMedicamentosLoading extends ListaDeMedicamentosState {}

class ListaDeMedicamentosError extends ListaDeMedicamentosState {}

class ListaDeMedicamentosLoaded extends ListaDeMedicamentosState {
  final List<String> medicamentos;

  ListaDeMedicamentosLoaded({required this.medicamentos});

}