import 'package:flutter/material.dart';
import 'dart:ffi';

class Conversao extends StatefulWidget {
  @override
  _ConversaoState createState() => _ConversaoState();
}

class _ConversaoState extends State<Conversao> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular(){

    double precoAlcool = double.tryParse( _controllerAlcool.text );
    double precoGasolina = double.tryParse( _controllerGasolina.text );

    if(precoAlcool == null || precoGasolina == null){
      setState(() {
        _textoResultado = "Número inválido, digite números maiores que 0 e utilizando (.)";
      });
    }else{
      if((precoAlcool / precoGasolina) >= 0.7){
        setState(() {
          _textoResultado = "Melhor abastecer com gasolinha";
        });
      }else{
        setState(() {
          _textoResultado = "Melhor abastecer com alcool";
        });
      }

      //_limparCampos();
    }
  }

  //Classe para limpar o campo depois do resultado

  /*void _limparCampos(){
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white30,
      body: Container(

        //SingleChildScrollView = Barra de rolagem
        child: SingleChildScrollView(

          //Paddin tem que ser dentro
          padding: EdgeInsets.all(32),

          child: Column(

            //Faz com que o botão ocupe todo o espaço
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset("image/logo.png"),
              ),

              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Saiba qual a melhor opção para abastecimento do seu carro",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),

              //Pega o valor do alcool
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Preço Alcool, ex: 1.59"
                ),
                style: TextStyle(
                    fontSize: 22
                ),
                controller: _controllerAlcool, //Pega o valor que o usuario digitar
              ),

              //Pegar o valor da Gasolina
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Preço Gasolina, ex: 3.59"
                ),
                style: TextStyle(
                    fontSize: 22
                ),
                controller: _controllerGasolina, //Pega o valor que o usuario digitar
              ),

              //Botao para calcular
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Calcular",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                    onPressed: _calcular
                ),
              ),


              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _textoResultado,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
