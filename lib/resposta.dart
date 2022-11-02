import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String _texto;
  final void Function() quandoSelecionado;

  Resposta(this._texto, this.quandoSelecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(32, 8, 32, 8),
      child: ElevatedButton(
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(
            Colors.blue,
          ),
          foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
        ),
        onPressed: quandoSelecionado,
        child: Text(_texto),
      ),
    );
  }
}
