import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';
import './resultado.dart';
import './questionario.dart';

main() {
  runApp(new PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
    print(_pontuacaoTotal);
    print('pergunta respondida' + _perguntaSelecionada.toString());
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  final _perguntas = [
    {
      'texto': 'Qual sua cor favorita?',
      'respostas': [
        {'text': 'Preto', 'pontuacao': 10},
        {'text': 'Vermelho', 'pontuacao': 5},
        {'text': 'Verde', 'pontuacao': 3},
        {'text': 'Branco', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'text': 'Coelho', 'pontuacao': 10},
        {'text': 'Cobra', 'pontuacao': 5},
        {'text': 'Elefante', 'pontuacao': 3},
        {'text': 'Cachorro', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Pergunta Genérica?',
      'respostas': [
        {'text': 'Resposta 1', 'pontuacao': 10},
        {'text': 'Resposta 2', 'pontuacao': 5},
        {'text': 'Resposta 3', 'pontuacao': 3},
        {'text': 'Respsota 4', 'pontuacao': 1},
      ]
    }
  ];

  Widget build(BuildContext context) {
    // for (var textoResp in respostas) {
    //   widgets.add(Resposta(textoResp, _responder));
    // }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder,
              )
            : Resultado('Parabens', _pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
