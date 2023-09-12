import 'package:desafio_caixa_eletronico/model/notasModel.dart';

class CaixaEletronicoService {
  NotasModel quantidadeDeNotas(NotasModel notasCaixa, int valor) {
    NotasModel notas = notasCaixa;
    NotasModel notasRetorno = NotasModel();
    var total = calcularTotal(notas);
    if (valor <= total) {
      while (valor != 0) {
        if (valor >= 200 && notas.nota200 > 0) {
          valor -= 200;
          notas.nota200--;
          notasRetorno.nota200++;
        } else if (valor >= 100 && notas.nota100 > 0) {
          valor -= 100;
          notas.nota100--;
          notasRetorno.nota100++;
        } else if (valor >= 50 && notas.nota50 > 0) {
          valor -= 50;
          notas.nota50--;
          notasRetorno.nota50++;
        } else if (valor >= 20 && notas.nota20 > 0) {
          valor -= 20;
          notas.nota20--;
          notasRetorno.nota20++;
        } else if (valor >= 10 && notas.nota10 > 0) {
          valor -= 10;
          notas.nota10--;
          notasRetorno.nota10++;
        } else if (valor == 8 && notas.nota2 >= 4) {
          valor -= 8;
          notas.nota2 -= 4;
          notasRetorno.nota2 += 4;
        } else if (valor == 6 && notas.nota2 >= 3) {
          valor -= 6;
          notas.nota2 -= 3;
          notasRetorno.nota2 += 3;
        } else if (valor >= 5 && notas.nota5 > 0) {
          valor -= 5;
          notas.nota5--;
          notasRetorno.nota5++;
        } else if (valor >= 2 && notas.nota2 > 0) {
          valor -= 2;
          notas.nota2--;
          notasRetorno.nota2++;
        } else if (valor == 1) {
          valor -= 1;
          notasRetorno.resto = 1;
        } else {
          notasRetorno.resto = valor;
          valor = 0;
        }
      }
    } else {
      notasRetorno.resto = valor;
    }

    if (notasRetorno.resto == 0) {
      notasCaixa = notas;
    }
    return notasRetorno;
  }

  int calcularTotal(NotasModel notas) {
    var soma = ((notas.nota2 * 2) +
        (notas.nota5 * 5) +
        (notas.nota10 * 10) +
        (notas.nota20 * 20) +
        (notas.nota50 * 50) +
        (notas.nota100 * 100) +
        (notas.nota200 * 200));
    return soma;
  }
}
