import 'package:desafio_caixa_eletronico/model/notasModel.dart';
import 'package:desafio_caixa_eletronico/pages/home.dart';
import 'package:desafio_caixa_eletronico/service/CaixaEletronicoService.dart';
import 'package:flutter/material.dart';

class SaqueEfetuado {
  Future build(BuildContext context, NotasModel notas, NotasModel  notasEmCaixa) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog( 
          title: const Center(child: Text("Saque Efetuado com sucesso !")),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: getQuantidadeCedulas(context, notas),
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

  List<Widget> getQuantidadeCedulas(BuildContext context, NotasModel notas) {
    List<Widget> lista = [];
    if (notas.nota2 != 0) {
      lista.add(SizedBox(
        width: MediaQuery.of(context).size.width * 0.3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '${notas.nota2.toString()} X',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            Image.asset('assets/images/cedula-2-reais.jpg',
                width: MediaQuery.of(context).size.width * 0.09,
                height: MediaQuery.of(context).size.height * 0.09)
          ],
        ),
      ));
    }
    if (notas.nota5 != 0) {
      lista.add(
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '${notas.nota5.toString()} X',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              Image.asset('assets/images/cedula-5-reais.jpg',
                  width: MediaQuery.of(context).size.width * 0.09,
                  height: MediaQuery.of(context).size.height * 0.09)
            ],
          ),
        ),
      );
    }
    if (notas.nota10 != 0) {
      lista.add(
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '${notas.nota10.toString()} X',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              Image.asset('assets/images/cedula-10-reais.jpg',
                  width: MediaQuery.of(context).size.width * 0.09,
                  height: MediaQuery.of(context).size.height * 0.09)
            ],
          ),
        ),
      );
    }
    if (notas.nota20 != 0) {
      lista.add(SizedBox(
        width: MediaQuery.of(context).size.width * 0.3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '${notas.nota20.toString()} X',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            Image.asset('assets/images/cedula-20-reais.jpg',
                width: MediaQuery.of(context).size.width * 0.09,
                height: MediaQuery.of(context).size.height * 0.09)
          ],
        ),
      ));
    }
    if (notas.nota50 != 0) {
      lista.add(SizedBox(
        width: MediaQuery.of(context).size.width * 0.3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '${notas.nota50.toString()} X',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            Image.asset('assets/images/cedula-50-reais.jpg',
                width: MediaQuery.of(context).size.width * 0.09,
                height: MediaQuery.of(context).size.height * 0.09),
          ],
        ),
      ));
    }
    if (notas.nota100 != 0) {
      lista.add(SizedBox(
        width: MediaQuery.of(context).size.width * 0.3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '${notas.nota100.toString()} X',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            Image.asset('assets/images/cedula-100-reais.jpeg',
                width: MediaQuery.of(context).size.width * 0.09,
                height: MediaQuery.of(context).size.height * 0.09)
          ],
        ),
      ));
    }
    if (notas.nota200 != 0) {
      lista.add(SizedBox(
        width: MediaQuery.of(context).size.width * 0.3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '${notas.nota200.toString()} X',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            Image.asset('assets/images/cedula-200-reais.jpg',
                width: MediaQuery.of(context).size.width * 0.09,
                height: MediaQuery.of(context).size.height * 0.09)
          ],
        ),
      ));
    }
    return lista;
  }
}
