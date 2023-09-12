import 'package:desafio_caixa_eletronico/components/saqueEfetuado.dart';
import 'package:desafio_caixa_eletronico/components/saqueNaoEfetuado.dart';
import 'package:desafio_caixa_eletronico/service/CaixaEletronicoService.dart';
import 'package:desafio_caixa_eletronico/service/ProviderService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quantity_input/quantity_input.dart';
import 'package:desafio_caixa_eletronico/model/notasModel.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage(
      {super.key, required this.title, required this.valorNoCaixa});

  final String title;
  final int valorNoCaixa;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NotasProvider notas = NotasProvider();
  var _valorTotalCaixa = 0;

  final TextEditingController _valorSacadoController = TextEditingController();
  NotasModel retorno = NotasModel();

  void _incrementTotalNotas() {
    setState(() {
      notas.notas.nota2;
      notas.notas.nota5;
      notas.notas.nota20;
      notas.notas.nota10;
      notas.notas.nota50;
      notas.notas.nota100;
      notas.notas.nota200;
    });
    _valorTotalCaixa = CaixaEletronicoService().calcularTotal(notas.notas);
    notas.atualizarNotas(notas.notas);
  }

  @override
  void initState() {
    _valorTotalCaixa = widget.valorNoCaixa;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    notas = Provider.of<NotasProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text(widget.title)),
      ),
      body: Consumer<NotasProvider>(
        builder: (context, cedulasProvider, child) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'INFORME A QUANTIDADE DE CADA CÉLULA',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.02,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset("assets/images/cedula-100-reais.jpeg",
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2),
                              QuantityInput(
                                readOnly: true,
                                acceptsZero: true,
                                value: cedulasProvider.notas.nota100,
                                onChanged: (value) => setState(
                                  () {
                                    cedulasProvider.notas.nota100 =
                                        int.parse(value);
                                    _incrementTotalNotas();
                                  },
                                ),
                              ),
                              Image.asset("assets/images/cedula-50-reais.jpg",
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2),
                              QuantityInput(
                                type: QuantityInputType.int,
                                readOnly: true,
                                acceptsZero: true,
                                value: cedulasProvider.notas.nota50,
                                onChanged: (value) => setState(
                                  () {
                                    notas.notas.nota50 = int.parse(value);
                                    _incrementTotalNotas();
                                  },
                                ),
                              ),
                              Image.asset("assets/images/cedula-20-reais.jpg",
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2),
                              QuantityInput(
                                type: QuantityInputType.int,
                                readOnly: true,
                                acceptsZero: true,
                                value: cedulasProvider.notas.nota20,
                                onChanged: (value) => setState(
                                  () {
                                    notas.notas.nota20 = int.parse(value);
                                    _incrementTotalNotas();
                                  },
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset("assets/images/cedula-10-reais.jpg",
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2),
                              QuantityInput(
                                type: QuantityInputType.int,
                                readOnly: true,
                                acceptsZero: true,
                                value: cedulasProvider.notas.nota10,
                                onChanged: (value) => setState(
                                  () {
                                    notas.notas.nota10 = int.parse(value);
                                    _incrementTotalNotas();
                                  },
                                ),
                              ),
                              Image.asset("assets/images/cedula-5-reais.jpg",
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2),
                              QuantityInput(
                                type: QuantityInputType.int,
                                readOnly: true,
                                acceptsZero: true,
                                value: cedulasProvider.notas.nota5,
                                onChanged: (value) => setState(
                                  () {
                                    notas.notas.nota5 = int.parse(value);
                                    _incrementTotalNotas();
                                  },
                                ),
                              ),
                              Image.asset("assets/images/cedula-2-reais.jpg",
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2),
                              QuantityInput(
                                type: QuantityInputType.int,
                                readOnly: true,
                                acceptsZero: true,
                                value: cedulasProvider.notas.nota2,
                                onChanged: (value) => setState(
                                  () {
                                    notas.notas.nota2 = int.parse(value);
                                    _incrementTotalNotas();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Image.asset("assets/images/cedula-200-reais.jpg",
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.2),
                    QuantityInput(
                      type: QuantityInputType.int,
                      readOnly: true,
                      acceptsZero: true,
                      value: cedulasProvider.notas.nota200,
                      onChanged: (value) => setState(
                        () {
                          notas.notas.nota200 = int.parse(value);
                          _incrementTotalNotas();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Text(
                        'VALOR TOTAL NO CAIXA: R\$  $_valorTotalCaixa,00',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.02,
                        ),
                      ),
                    ),
                    Text(
                      'INFORME O VALOR A SER SACADO',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.02,
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.14,
                        child: Row(
                          children: [
                            Text(
                              'R\$',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.02,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1,
                              child: TextField(
                                controller: _valorSacadoController,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                ],
                                textAlign: TextAlign.center,
                                decoration:
                                    const InputDecoration(hintText: '0,00'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        retorno = CaixaEletronicoService().quantidadeDeNotas(
                            notas.notas,
                            (_valorSacadoController.text.isEmpty)
                                ? 0
                                : int.parse(_valorSacadoController.text));
                        if (_valorSacadoController.text.isNotEmpty) {
                          if (retorno.resto == 0) {
                            SaqueEfetuado().build(context, retorno, notas.notas);
                            _incrementTotalNotas();
                          } else {
                            if (retorno.resto == 1) {
                              SaqueNaoEfetuado().build(
                                  context, "Por favor, informe outro valor", notas.notas);
                            } else if (retorno.resto ==
                                int.parse(_valorSacadoController.text)) {
                              SaqueNaoEfetuado().build(
                                  context, "Caixa não possui este valor para ser entregue", notas.notas);
                            } else {
                              SaqueNaoEfetuado().build(context,
                                  "Não possuimos cédulas para entregar este valor", notas.notas);
                            }
                          }
                        } else {
                          SaqueNaoEfetuado().build(
                              context, "Informe um valor para ser sacado", notas.notas);
                        }
                      },
                      child: const Text('SACAR'),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
