import 'package:flutter/material.dart';

void main() {
  runApp(MyTabApp());
}

class MyTabApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('AI6 Navigation Drawer'),
            bottom: TabBar(
              tabs: [
                Tab(text: 'AI2'),
                Tab(text: 'AI3'),
                Tab(text: 'AI4'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              AI2Botones(),
              AI3Contador(),
              AI4Calculadora(),
            ],
          ),
        ),
      ),
    );
  }
}

class ColoredButton extends StatelessWidget {
  final Color color;
  final String label;
  final VoidCallback onPressed;

  const ColoredButton({
    Key? key,
    required this.color,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: color,
        padding: EdgeInsets.all(20),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class AI2Botones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('AI2 Uso de Botones'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ColoredButton(color: Colors.red, label: 'Botón Rojo', onPressed: () {}),
              SizedBox(height: 20),
              ColoredButton(color: Colors.green, label: 'Botón Verde', onPressed: () {}),
              SizedBox(height: 20),
              ColoredButton(color: Colors.blue, label: 'Botón Azul', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

class AI3Contador extends StatefulWidget {
  @override
  _AI3ContadorState createState() => _AI3ContadorState();
}

class _AI3ContadorState extends State<AI3Contador> {
  int counter = 0;

  void increaseCounter() {
    setState(() {
      if (counter < 50) {
        counter++;
      }
    });
  }

  void decreaseCounter() {
    setState(() {
      if (counter > 0) {
        counter--;
      }
    });
  }

  void resetCounter() {
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('AI3 Contador Simple'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Contador: $counter',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              ColoredButton(
                color: Colors.red,
                label: 'Aumentar',
                onPressed: increaseCounter,
              ),
              SizedBox(height: 20),
              ColoredButton(
                color: Colors.green,
                label: 'Disminuir',
                onPressed: decreaseCounter,
              ),
              SizedBox(height: 20),
              ColoredButton(
                color: Colors.blue,
                label: 'Limpiar',
                onPressed: resetCounter,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AI4Calculadora extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('AI4 Calculadora'),
        ),
        body: Calculadora(),
      ),
    );
  }
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String display = '';
  double num1 = 0;
  double num2 = 0;
  String operand = '';
  double resultado = 0;

  void onPressButton(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        display = '';
        num1 = 0;
        num2 = 0;
        operand = '';
        resultado = 0;
      } else if (buttonText == '+' || buttonText == '-' || buttonText == '*' || buttonText == '/') {
        num1 = double.parse(display);
        operand = buttonText;
        display = '';
      } else if (buttonText == '=') {
        num2 = double.parse(display);
        switch (operand) {
          case '+':
            resultado = num1 + num2;
            break;
          case '-':
            resultado = num1 - num2;
            break;
          case '*':
            resultado = num1 * num2;
            break;
          case '/':
            resultado = num1 / num2;
            break;
        }
        display = resultado.toString();
        num1 = resultado;
        operand = '';
      } else if (buttonText == '+/-') {
        if (display != '' && display != '0') {
          display = (double.parse(display) * -1).toString();
        }
      } else if (buttonText == '%') {
        if (display != '' && display != '0') {
          double porcentaje = double.parse(display) / 100;
          display = porcentaje.toString();
        }
      } else {
        display += buttonText;
      }
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => onPressButton(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.bottomRight,
              child: Text(
                display,
                style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              buildButton('7'),
              buildButton('8'),
              buildButton('9'),
              buildButton('/'),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton('4'),
              buildButton('5'),
              buildButton('6'),
              buildButton('*'),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton('1'),
              buildButton('2'),
              buildButton('3'),
              buildButton('-'),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton('0'),
              buildButton('C'),
              buildButton('+/-'),
              buildButton('%'),
              buildButton('='),
              buildButton('+'),
            ],
          ),
        ],
      ),
    );
  }
}
