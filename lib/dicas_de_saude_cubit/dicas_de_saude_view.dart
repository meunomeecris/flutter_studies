
import 'package:flutter/material.dart';
import 'package:flutter_studies/dicas_de_saude_cubit/dicas_de_saude_cubit.dart';
import 'package:flutter_studies/dicas_de_saude_setstate/dicas-de-saude-state.dart';
import 'package:flutter_studies/dicas_de_saude_setstate/dicas-de-saude-view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitDicasDeSaudeView extends StatelessWidget {
  CubitDicasDeSaudeView({super.key});

  final DicasCubit cubit = DicasCubit();

  @override
  Widget build(BuildContext context) {
     return BlocBuilder<DicasCubit, DicasDeSaudeState>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
        body: Center(child:
          getContent()
        ),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          cubit.toggleCardButton();
        },
        backgroundColor: const Color.fromRGBO(128, 16, 148, 1), 
        child: const Icon(Icons.shuffle, color: Colors.white,)
      ),
      );
      },
    );
  }

  Widget getContent() {
      final currentStatus = cubit.state;
        switch (currentStatus) {
          case DicasDeSaudeStateLoading():
          return CustomCard(colorCard: currentStatus.colorCard, textCard: currentStatus.textCard);
          case DicasDeSaudeStateLoaded():
          return CustomCard(colorCard: currentStatus.colorCard, textCard: currentStatus.textCard);
        } 
    }
}

