import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

sealed class DicasState extends Equatable {}

// ignore: must_be_immutable
class DicasStateLoading extends DicasState {
  @override
  List<Object?> get props => [textCard, colorCard];

  String textCard = "Loading...";
  Color colorCard = Colors.grey;
}

// ignore: must_be_immutable
class DicasStateLoaded extends DicasState {
  @override
  List<Object?> get props => [textCard, colorCard];

  String textCard = "This is a text aligned to the left, to the left...";
  Color colorCard = const Color.fromRGBO(128, 16, 148, 1);
}

// ignore: must_be_immutable
class DicasStateError extends DicasState {
  @override
  List<Object?> get props => [textCard, colorCard];

  String textCard = "Sorry...";
  Color colorCard = const Color.fromARGB(255, 186, 52, 52);
}
