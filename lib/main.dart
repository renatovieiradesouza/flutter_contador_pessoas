import 'package:flutter/material.dart';

void main() => runApp(Home());

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _pessoas = 0;
  String _mensagem = "Pode entrar!";

  void adicionaPessoa(int delta){
    setState((){
      _pessoas += delta;
      if(_pessoas < 0){
        _mensagem = 'Somente número positivos';
        _pessoas = 0;
      } else if(_pessoas <= 5){
        _mensagem = 'Pode Entrar!';
      } else {
        _mensagem = 'Lotado!';
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador de Pessoas',
      home: Stack(
        children: <Widget>[
          Image.asset(
            'images/restaurant.jpg',
            height: 1000,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Pessoas: $_pessoas',
                style: TextStyle(fontSize: 60, color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      child: Text(
                        '+1',
                        style: TextStyle(fontSize: 60, color: Colors.white),
                      ),
                      onPressed: () {
                        adicionaPessoa(1);
                      },
                    ),
                    FlatButton(
                      child: Text('-1',
                          style: TextStyle(fontSize: 60, color: Colors.white)),
                      onPressed: () {
                        adicionaPessoa(-1);
                      },
                    ),
                  ],
                ),
              ),
              Text(
                _mensagem,
                style: TextStyle(fontSize: 30, color: Colors.white),
              )
            ],
          ),
        ],
      ),
    );
  }
}
