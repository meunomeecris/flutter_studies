import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_studies/dicas_de_saude_bloc/dicas_bloc.dart';
import 'package:flutter_studies/dicas_de_saude_bloc/dicas_event.dart';
import 'package:flutter_studies/dicas_de_saude_bloc/dicas_state.dart';
import 'package:flutter_studies/dicas_de_saude_setstate/dicas-de-saude-view.dart';

class DicasView extends StatelessWidget {
  DicasView({super.key}); 
  final DicasBloc bloc = DicasBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DicasBloc, DicasState>(
    bloc: bloc,
      builder: (context, state) {
        return Scaffold(
        body: Center(child:
          getContent()
        ),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          bloc.add(OnViewAppear());
        },
        backgroundColor: const Color.fromRGBO(128, 16, 148, 1), 
        child: const Icon(Icons.shuffle, color: Colors.white,)
      ),
      );
      },
    );
  }

  Widget getContent() {
      final currentStatus = bloc.state;
        switch (currentStatus) {
          case DicasStateLoading():
          return CustomCard(colorCard: currentStatus.colorCard, textCard: currentStatus.textCard);
          case DicasStateLoaded():
          return CustomCard(colorCard: currentStatus.colorCard, textCard: currentStatus.textCard);
          case DicasStateError():
          return CustomCard(colorCard: currentStatus.colorCard, textCard: currentStatus.textCard);
        } 
    }
}