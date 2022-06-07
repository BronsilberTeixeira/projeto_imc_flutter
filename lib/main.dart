import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home:  Home(),
  ));
}
class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
TextEditingController pesoController = TextEditingController();
TextEditingController alturaController = TextEditingController();

String textoInformativo = "Informe seus dados de Peso e Altura";

void resetarCampos(){
  pesoController.text = '';
  alturaController.text = '';
  setState(() {
  textoInformativo = "Informe seus dados de Peso e Altura";
  });
}

void calcularIMC(){
  setState(() {
    double peso = double.parse(pesoController.text);
    double altura = double.parse(alturaController.text) / 100;
    double imc = peso / (altura * altura);
    if(imc < 18.6){
      textoInformativo = "Abaixo do peso (${imc.toStringAsPrecision(4)})";
    } else if(imc >= 18.6 && imc < 24.9){
      textoInformativo = "Peso ideal (${imc.toStringAsPrecision(4)})";
    }else if(imc >= 24.9 && imc < 29.9){
      textoInformativo = "Levemente acima do peso (${imc.toStringAsPrecision(4)})";
    }else if(imc >= 29.9 && imc < 34.9){
      textoInformativo = "Obesidade grau I (${imc.toStringAsPrecision(4)})";
    } else if( imc >= 34.9 && imc < 39){
      textoInformativo = "Obesidade grau II (${imc.toStringAsPrecision(4)})";
    }else{
      textoInformativo = "Obesidade grau III (${imc.toStringAsPrecision(4)})";
    }
  });

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[300],
        actions: [
          IconButton(icon: Icon(Icons.refresh_rounded), onPressed: resetarCampos)
        ],
      ),
      backgroundColor: Colors.blueGrey[900],
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(Icons.person_outline, size: 120.0, color: Colors.deepPurple),
              TextField(keyboardType: TextInputType.number, 
                decoration: InputDecoration(
                  labelText: 'Peso em KG',
                  labelStyle: TextStyle(color: Colors.deepPurple[300])
                  ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.deepPurple[300], fontSize: 20.0),
              controller: pesoController,
              ),
                TextField(keyboardType: TextInputType.number, 
                decoration: InputDecoration(
                  labelText: 'Altura em cm',
                  labelStyle: TextStyle(color: Colors.deepPurple[300])
                  ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.deepPurple[300], fontSize: 20.0),
              controller: alturaController,
              ),
          Padding( 
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Container(
              height: 50.0,
              child:  RaisedButton(onPressed: calcularIMC,
                child: Text('Calcular', 
                  style: TextStyle(color: Colors.white, fontSize: 15.0)
                ),
                color: Colors.deepPurple[300],
              ),
            ),
          ),
          Text(textoInformativo,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.deepPurple[300], fontSize: 30.0),
          )
          ],
        ),
      )
    );
  }
}