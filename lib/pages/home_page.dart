import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  String info = 'Informe os dados';

  String? errorWeight;
  String? errorHeight;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Calculadora de IMC',
          ),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: [
            IconButton(
              onPressed: reset,
              icon: Icon(Icons.refresh),
              color: Colors.white,
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 8.0,
            children: [
              Icon(
                Icons.person_outline,
                size: 120.0,
                color: Colors.green,
              ),
              TextField(
                cursorColor: Colors.green,
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  errorText: errorWeight,
                  labelText: 'Peso (kg)',
                  suffixText: 'kg',
                  labelStyle: TextStyle(
                    color: Colors.green,
                    fontSize: 25,
                  ),
                  suffixStyle: TextStyle(
                    color: Colors.green,
                    fontSize: 25,
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 2.1,
                    ),
                  ),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 25.0,
                ),
              ),
              TextField(
                cursorColor: Colors.green,
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  errorText: errorHeight,
                  labelText: 'Altura (cm)',
                  suffixText: 'cm',
                  labelStyle: TextStyle(
                    color: Colors.green,
                    fontSize: 25,
                  ),
                  suffixStyle: TextStyle(
                    color: Colors.green,
                    fontSize: 25,
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 2.1,
                    ),
                  ),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 25.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    fixedSize: Size(50, 50),
                  ),
                  onPressed: calculate,
                  child: Text(
                    'Calcular',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Text(
                info,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 25.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void reset() {
    weightController.clear();
    heightController.clear();
    setState(() {
      info = 'Informe os dados';
      errorHeight = null;
      errorWeight = null;
    });
  }

  void calculate() {
    setState(() {
      errorHeight = null;
      errorWeight = null;

      if (weightController.text == '') {
        errorWeight = 'Informe o seu peso';
        return;
      }

      if (heightController.text == '') {
        errorHeight = 'Informe a sua altura';
        return;
      }

      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;

      weightController.clear();
      heightController.clear();

      double imc = weight / (height * height);

      if (imc < 18.5) {
        info = 'Abaixo do peso (imc: ${imc.toStringAsPrecision(3)})';
        return;
      }

      if (imc < 24.9) {
        info = 'Peso ideal (imc: ${imc.toStringAsPrecision(3)})';
        return;
      }

      if (imc < 29.9) {
        info = 'Sobrepeso (imc: ${imc.toStringAsPrecision(3)})';
        return;
      }

      if (imc < 34.9) {
        info = 'Obesidade grau I (imc: ${imc.toStringAsPrecision(3)})';
        return;
      }

      if (imc < 39.9) {
        info = 'Obesidade grau II (imc: ${imc.toStringAsPrecision(3)})';
        return;
      }

      if (imc > 40) {
        info = 'Obesidade mórbida (imc: ${imc.toStringAsPrecision(3)})';
        return;
      }
    });
  }
}
