import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final String texto;
  final int pontuacao;
  final void Function() reiniciarQuestionario;

  Resultado(this.texto, this.pontuacao, this.reiniciarQuestionario);

  String get getResultado {
    if (pontuacao < 8) {
      return texto;
    } else if (pontuacao < 12) {
      return 'VC é bom';
    } else if (pontuacao < 16) {
      return 'Impressionante';
    } else {
      return 'Nivel Jedi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Text(
          getResultado,
          style: TextStyle(fontSize: 29),
        )),
        FlatButton(
          onPressed: reiniciarQuestionario,
          child: Text(
            'Reiniciar',
            style: TextStyle(fontSize: 18),
          ),
          textColor: Colors.blue,
        )
      ],
    );
  }
}
