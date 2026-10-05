import 'package:flutter/material.dart';

void main() {
  runApp(const Calculadora());
}

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  TextEditingController numero1 = TextEditingController();
  TextEditingController numero2 = TextEditingController();

  String resultado = '0';

  void calcular(String operacao) {
    double n1 = double.parse(numero1.text);
    double n2 = double.parse(numero2.text);

    setState(() {
      if (operacao == '+') {
        resultado = (n1 + n2).toString();
      } else if (operacao == '-') {
        resultado = (n1 - n2).toString();
      } else if (operacao == '*') {
        resultado = (n1 * n2).toString();
      } else {
        resultado = (n1 / n2).toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calculadora'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: numero1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Primeiro número',
              ),
            ),
            TextField(
              controller: numero2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Segundo número',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    calcular('+');
                  },
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () {
                    calcular('-');
                  },
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () {
                    calcular('*');
                  },
                  child: const Text('×'),
                ),
                ElevatedButton(
                  onPressed: () {
                    calcular('/');
                  },
                  child: const Text('÷'),
                ),
              ],
            ),
            Text(
              'Resultado: $resultado',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}