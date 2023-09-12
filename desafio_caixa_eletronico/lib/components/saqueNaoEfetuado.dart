import 'package:desafio_caixa_eletronico/model/notasModel.dart';
import 'package:desafio_caixa_eletronico/pages/home.dart';
import 'package:desafio_caixa_eletronico/service/CaixaEletronicoService.dart';
import 'package:flutter/material.dart';

class SaqueNaoEfetuado {
  Future build(BuildContext context, String motivo, NotasModel notasEmCaixa) {
    return  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text("Saque não pode ser efetuado")),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Motivo:"),
                Text(motivo)
              ],
            ),
          ),
          actions: <Widget>[
             FloatingActionButton(
              child: const Text("Fechar"),
              onPressed: () {
               Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(
                          title: 'CAIXA ELETRÔNICO',
                          valorNoCaixa:
                              CaixaEletronicoService().calcularTotal(notasEmCaixa)),
                    ),(route) => true,);
              },
            ),
          ],
        );
      },
    );
  }
}