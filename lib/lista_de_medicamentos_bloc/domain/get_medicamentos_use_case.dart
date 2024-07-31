mixin GetMedicamentosUseCase {
  List<String> getMedicamentos();
}

class GetMedicamentosUseCaseLive with GetMedicamentosUseCase {
  @override
  List<String> getMedicamentos() {
    return [
      "Engov",
      "Alka-Seltzer",
      "Eparema",
      "Hidralyte",
      "Tylenol",
      "Complexo B"
    ];
  }
}

class GetMedicamentosUseCaseMock with GetMedicamentosUseCase {
  final List<String> medicamentos;

  GetMedicamentosUseCaseMock({required this.medicamentos});

  @override
  List<String> getMedicamentos() {
    return medicamentos;
  }
}
