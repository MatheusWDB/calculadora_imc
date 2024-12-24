import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              onPressed: () {},
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
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
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
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 25.0,
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Altura (cm)',
                  suffixText: 'cm',
                  labelStyle: TextStyle(
                    color: Colors.green,
                    fontSize: 25,
                  ),
                  suffixStyle: TextStyle(color: Colors.green, fontSize: 25),
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
                  onPressed: () {},
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
                'Info',
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
}
