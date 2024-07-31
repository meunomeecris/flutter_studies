import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_studies/dicas_de_saude_setstate/dicas-de-saude-view.dart';
import 'package:flutter_studies/lista_de_medicamentos_bloc/domain/get_medicamentos_use_case.dart';

import 'lista_de_medicamentos_bloc.dart';
import 'lista_de_medicamentos_event.dart';
import 'lista_de_medicamentos_state.dart';

// ignore: must_be_immutable
class ListaDeMedicamentosViewBloc extends StatelessWidget {
  ListaDeMedicamentosViewBloc({super.key});

  final ListaDeMedicamentosBloc bloc =
      ListaDeMedicamentosBloc(GetMedicamentosUseCaseLive());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListaDeMedicamentosBloc, ListaDeMedicamentosState>(
      bloc: bloc,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Medicamentos"),
            backgroundColor: Colors.amber,
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: getListContent(),
            ),
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                bloc.add(ButtonTapped());
              },
              backgroundColor: const Color.fromRGBO(128, 16, 148, 1),
              child: const Icon(
                Icons.shuffle,
                color: Colors.white,
              )),
        );
      },
    );
  }

  Widget getListContent() {
    final currentStatus = bloc.state;
    switch (currentStatus) {
      case ListaDeMedicamentosLoading():
        return const CircularProgressIndicator();
      case ListaDeMedicamentosLoaded():
        return Column(children: createTextList(currentStatus.medicamentos));
      case ListaDeMedicamentosError():
        return CustomCard(
            colorCard: Colors.amber,
            textCard: "Não foi possível encontrar nenhum medicamento.");
    }
  }

  List<Widget> createTextList(List<String> items) {
    return items
        .map((item) => Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Nome: $item",
                style: const TextStyle(
                  color: Color.fromARGB(255, 109, 76, 175),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ))
        .toList();
  }
}
