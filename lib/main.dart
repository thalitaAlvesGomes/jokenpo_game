import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(GameApp());
}

class GameApp extends StatefulWidget {

  @override
  State<GameApp> createState() => _GameAppState();
}

class _GameAppState extends State<GameApp> {
    final estilo = TextStyle(color: Colors.white, fontSize: 32);

  String status = '';
  void play(String option) {
    List<String> opcoes = ['Pedra', 'Papel', 'Tesoura'];
    int randomOpcoes = Random().nextInt(opcoes.length);

    String computador = '';
    if(randomOpcoes == 0)
    {
      computador = 'Pedra';

    }else if (randomOpcoes == 1)
     {
      computador = 'Papel';
      
    }else if (randomOpcoes == 2) 
    {
      computador == 'Tesoura';
    }

    if (option == computador) {
      setState(() => status = '$computador: Empate');

    }else if (computador == 'Pedra' && option =='Papel') {
      setState(() => status = '$computador: Você Ganhou');

    } else if (computador == 'Pedra' && option == 'Tesoura') {
      setState(() => status = '$computador: Você Perdeu');
    
    }else if (computador == 'Papel' && option == 'Tesoura') {
      setState(() => status = '$computador: Você Ganhou');

   }else if (computador == 'Papel' && option == 'Pedra') {
      setState(() => status = '$computador: Você Perdeu');

   }else if (computador == 'Tesoura' && option == 'Pedra') {
      setState(() => status = '$computador: Você Ganhou');

   }else if (computador == 'Tesoura' && option == 'Papel') {
      setState(() => status = '$computador: Você Perdeu');    
  }
  }

  @override
  build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column  (
          children: [
            Text(status),
            Expanded(
              child: GestureDetector(
                onTap: () => play('Pedra'),
                child: Container(
                  color: Colors.green,
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Center(
                    child: Text('Pedra', style: estilo),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => play('Papel'),
                child: Container(
                  color: Colors.blue,
                  margin: EdgeInsets.all(10),
                  child: Center(
                    child: Text('Papel', style: estilo),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => play('Tesoura'),
                child: Container(
                  color: Colors.orange,
                  margin: EdgeInsets.all(10),
                  child: Center(
                    child: Text('Tesoura', style: estilo),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ); 
  }
  }
