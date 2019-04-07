import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController altura = TextEditingController();
  TextEditingController peso = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Informe seus Dados";

  void _resetField(){
    altura.text = "";
    peso.text = "";
    setState(() {
      _infoText = "Informe seus Dados";
    });
  }

  void _calculate(){

    setState(() {
      double pesoV = double.parse(peso.text);
      double alturaV = double.parse(altura.text) / 100;

      double imc = pesoV / (alturaV * alturaV );
      if(imc < 18.6) {
        _infoText = "Abaixo do peso. IMC ${imc.toStringAsPrecision(2)}";
      }else if(imc >= 18.6 && imc < 24.9) {
        _infoText = "Peso ideal. IMC ${imc.toStringAsPrecision(2)}";
      }else if(imc >= 24.9 && imc < 29.9) {
        _infoText = "Acima do peso. IMC ${imc.toStringAsPrecision(2)}";
      }else if(imc >= 29.9 && imc < 34.9) {
        _infoText = "Obesidade grau 1. IMC ${imc.toStringAsPrecision(2)}";
      }else if(imc >= 34.9 && imc < 39.9) {
        _infoText = "Obesidade grau 1. IMC ${imc.toStringAsPrecision(2)}";
        }else if(imc >= 40) {
        _infoText = "Obesidade grau 1. IMC ${imc.toStringAsPrecision(2)}";
      }

      print(_infoText);

    });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculadora IMC"),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _resetField,
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Form(
              key: _formKey,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(Icons.person_outline, size: 120.0, color: Colors.green),
                TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Peso kg",
                        labelStyle:
                        TextStyle(color: Colors.green)),
                    controller: peso,
                    validator: (value){
                      print("peso ${value} ");
                      if(value.isEmpty)
                        return "Insira seu peso";
                    },
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green, fontSize: 25.0)),
                TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Altura cm",
                        labelStyle:
                        TextStyle(color: Colors.green)),
                    controller: altura,
                    validator: (value){
                      print("altura ${value} ");
                      if(value.isEmpty)
                        return "Insira sua altura";
                    },
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green, fontSize: 25.0)),
                Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Container(
                      height: 50,
                      child: RaisedButton(
                        onPressed: (){
                          if(_formKey.currentState.validate()){
                            _calculate();
                          }
                        },
                        child: Text(
                          "Calcular",
                          style: TextStyle(color: Colors.white, fontSize: 25.0),
                        ),
                        color: Colors.green,
                      ),
                    )),
                Text(
                  "$_infoText",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green, fontSize: 25.0),
                )
              ]))
        ));
  }
}
