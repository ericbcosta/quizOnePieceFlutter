import 'dart:math';
import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  var _posicaoPergunta;
  var _contador = 0;

  void _responder(int pontuacao) {
    _posicaoPergunta = Random().nextInt(_perguntas.length);

    while (_perguntaJaSelecionada.contains(_posicaoPergunta)) {
      _posicaoPergunta = Random().nextInt(_perguntas.length);
    }

    setState(() {
      _pontuacaoTotal += pontuacao;
      _perguntaJaSelecionada.add(_posicaoPergunta);
      _contador++;
    });
    print(_posicaoPergunta);
  }

  void _reiniciarQuestionario() {
    setState(() {
      _contador = 0;
      _pontuacaoTotal = 0;
      _perguntaJaSelecionada.clear();
      _posicaoPergunta = Random().nextInt(_perguntas.length);
    });
  }

  final List<int> _perguntaJaSelecionada = [];
  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Quem foi o Rei dos Piratas?',
      'respostas': [
        {'texto': 'Gold Roger', 'pontuacao': 0},
        {'texto': 'Gol D. Roger', 'pontuacao': 10},
        {'texto': 'Rocks D. Xebec', 'pontuacao': 0},
        {'texto': 'Monkey D. Luffy', 'pontuacao': 0},
        {'texto': 'Joy Boy', 'pontuacao': 0},
      ]
    },
    {
      'texto': 'Qual o nome do tesouro deixado pelo Rei dos Piratas?',
      'respostas': [
        {'texto': 'O Sino Dourado de Shandora', 'pontuacao': 0},
        {'texto': 'Laftel', 'pontuacao': 0},
        {'texto': 'Laugh Tale', 'pontuacao': 0},
        {'texto': 'One Piece', 'pontuacao': 10},
        {'texto': 'Raftel', 'pontuacao': 0},
      ]
    },
    {
      'texto': 'Qual o nome do pai do Luffy?',
      'respostas': [
        {'texto': 'Monkey D. Garp', 'pontuacao': 0},
        {'texto': 'Monkey D. Dragon', 'pontuacao': 10},
        {'texto': 'Monkey D. Sabo', 'pontuacao': 0},
        {'texto': 'Gold Roger', 'pontuacao': 0},
        {'texto': 'Dandan', 'pontuacao': 0},
      ]
    },
    {
      'texto': 'Qual o primeiro pirata a virar muguiwara?',
      'respostas': [
        {'texto': 'Nico Robin', 'pontuacao': 10},
        {'texto': 'Ussop', 'pontuacao': 0},
        {'texto': 'Nami', 'pontuacao': 0},
        {'texto': 'Zoro', 'pontuacao': 0},
        {'texto': 'Chopper', 'pontuacao': 0},
      ]
    },
    {
      'texto': 'Em qual saga Portgas D. Ace morre?',
      'respostas': [
        {'texto': 'Impel Dawn', 'pontuacao': 0},
        {'texto': 'North Blue', 'pontuacao': 0},
        {'texto': 'Marineford', 'pontuacao': 10},
        {'texto': 'Whole Cacke', 'pontuacao': 0},
        {'texto': 'Sabaody', 'pontuacao': 0},
      ]
    },
    {
      'texto': 'Qual foi o primeiro navio do bando do luffy?',
      'respostas': [
        {'texto': 'Thousand Sunny', 'pontuacao': 0},
        {'texto': 'Bezan Black', 'pontuacao': 0},
        {'texto': 'Big Top', 'pontuacao': 0},
        {'texto': 'Coffin Boat', 'pontuacao': 0},
        {'texto': 'Going Merry', 'pontuacao': 10},
      ]
    },
    {
      'texto': 'Onde foi que luffy nasceu?',
      'respostas': [
        {'texto': 'Applenine', 'pontuacao': 0},
        {'texto': 'Asuka', 'pontuacao': 0},
        {'texto': 'Amazon Lily', 'pontuacao': 0},
        {'texto': 'Aldeia Foosha', 'pontuacao': 10},
        {'texto': 'Enies Lobby', 'pontuacao': 0},
      ]
    },
    {
      'texto': 'Quem é o criador de one piece?',
      'respostas': [
        {'texto': 'Masashi Kishimoto', 'pontuacao': 0},
        {'texto': 'Akira Toriyama', 'pontuacao': 0},
        {'texto': 'Echiro Oda', 'pontuacao': 10},
        {'texto': 'Yoshihiro Togashi', 'pontuacao': 0},
        {'texto': 'Sui Ishida', 'pontuacao': 0},
      ]
    },
    {
      'texto': 'Quem taca fogo na bandeira do governo em marine-ford?',
      'respostas': [
        {'texto': 'God Ussop', 'pontuacao': 0},
        {'texto': 'Vinsmoke Sanji', 'pontuacao': 0},
        {'texto': 'Nico Robin', 'pontuacao': 0},
        {'texto': 'Sogeking', 'pontuacao': 10},
        {'texto': 'Frank', 'pontuacao': 0},
      ]
    },
    {
      'texto':
          'No timeskip, quantos anos se passaram até o bando se reencontrar novamente?',
      'respostas': [
        {'texto': '1 Ano', 'pontuacao': 0},
        {'texto': '2 Ano', 'pontuacao': 10},
        {'texto': '3 Ano', 'pontuacao': 0},
        {'texto': '2 Ano e meio', 'pontuacao': 0},
        {'texto': '1 Ano e meio', 'pontuacao': 0},
      ]
    }
  ];

  bool get temPerguntaSelecionada {
    return _contador < 10;
  }

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('perguntas'),
          ),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _contador,
                responder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  _PerguntaAppState createState() => _PerguntaAppState();
}
