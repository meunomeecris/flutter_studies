import 'package:flutter/material.dart';

sealed class DicasDeSaudeState {}

class DicasDeSaudeStateLoading extends DicasDeSaudeState {
  String textCard = "Loading...";
  Color colorCard = Colors.grey;
}

class DicasDeSaudeStateLoaded extends DicasDeSaudeState {
  String textCard = "This is a text aligned to the left, to the left...";
  Color colorCard = const Color.fromRGBO(128, 16, 148, 1);
}