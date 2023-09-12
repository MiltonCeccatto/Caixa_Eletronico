import 'package:desafio_caixa_eletronico/model/notasModel.dart';
import 'package:flutter/material.dart';

class NotasProvider extends ChangeNotifier {
NotasModel _notas = NotasModel();

NotasModel get notas => _notas;

  void atualizarNotas(NotasModel notasAtuais) {
    _notas = notasAtuais;
    notifyListeners();
  }
}