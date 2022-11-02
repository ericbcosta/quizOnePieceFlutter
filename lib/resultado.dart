import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;
  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  get fraseResultado {
    if (pontuacao < 30) {
      return 'Ta pior que o Bellamy';
    } else if (pontuacao < 60) {
      return 'Ainda tem muito pela frente, APROVEITE BEM!!!';
    } else if (pontuacao < 80) {
      return 'Ahh  quantas histórias pra contar não é mesmo!?';
    } else if (pontuacao <= 90) {
      return '海賊王に俺はなる - kaizoku ou ni ore wa naru';
    } else if (pontuacao == 100) {
      return 'ZORO SOLAAAA!!!!!!!!!!!!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              fraseResultado,
              style: TextStyle(
                fontSize: 26,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: Text(
              '${pontuacao} / 100',
              style: TextStyle(fontSize: 40),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 60, 30, 60),
            child: TextButton(
                onPressed: quandoReiniciarQuestionario,
                child: Text(
                  'Reiniciar?',
                  style: TextStyle(
                    fontSize: 26,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
