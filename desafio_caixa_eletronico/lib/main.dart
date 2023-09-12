import 'package:desafio_caixa_eletronico/pages/home.dart';
import 'package:desafio_caixa_eletronico/service/ProviderService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => NotasProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Caixa Eletrônico',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'CAIXA ELETRÔNICO', valorNoCaixa: 0),
    );
  }
}
