import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override

  String op = '0';
  String op1 = '0';
  double n2 = 0.0;
  double n3 = 0.0;
  String oprd = '';
  String _op = '';

  Widget pressed(dynamic n)
  {
    if( n == '0000'){
      op1 = '0';
      n2 = 0.0;
      n3 = 0.0;
      oprd = '';
      _op = '';
    }
    else if( n == '000'){
      if (op1.length > 1){
        op1 = op1.substring(0,op1.length-1);
      }
      else{
        print('nothing to clear');
      }
    }
    else if(n == '+' || n == '-' || n == 'x' || n == '/'){
      if(op1.contains('%')){
        n2 = double.parse(op);
        n2 = n2/100;
      }
      else {
        n2 = double.parse(op);
      }
      oprd = n;
      _op = op1+oprd;
      op1 = '0';
    }
    else if(n == '.'){
      if(op1.contains('.')){
        print('Syntax Error');
      }
      else{
        op1 = op1 + n;
      }
    }
    else if (n == '=')
    {
      _op = '';
      n3 = double.parse(op);
      if ( oprd == '+')
        op1 = (n2 + n3).toString();
      if ( oprd == '-')
        op1 = (n2 - n3).toString();
      if ( oprd == 'x')
        op1 = (n2 * n3).toString();
      if ( oprd == '/')
        op1 = (n2 / n3).toString();
      n2 = 0.0;
      n3 = 0.0;
      oprd = '';
    }
    else{
      op1 = op1 + n;
    }
    setState( () {
      op = double.parse(op1).toStringAsFixed(2);
    });

  }

  Widget button(dynamic n)
  {
    return new Expanded(
      flex: 2,
      child: FlatButton(
        padding: EdgeInsets.all(25.0),
        color: Colors.grey[900],
        onPressed: () => pressed(n),
        child: Text(
          n,
          style: TextStyle(
              color: Colors.white,
              fontSize: 25.0
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Calculator',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22.0,
              letterSpacing: 1.8
          ),
        ),
        backgroundColor: Colors.grey[900],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: new Text(_op,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  letterSpacing: 2.0
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: new Text(op,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50.0,
                  letterSpacing: 2.0
              ),
            ),
          ),
          Row(          //0th row
            children: <Widget>[
              Expanded(
                flex: 2,
                child: RaisedButton(
                  padding: EdgeInsets.all(25.0),
                  color: Colors.grey[900],
                  onPressed: () {
                    dynamic n4 = '0000';
                    pressed(n4);
                  },
                  child: Text(
                    'AC',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0
                    ),
                  ),

                ),
              ),
              Expanded(
                flex: 2,
                child: RaisedButton(
                    padding: EdgeInsets.all(25),
                    color: Colors.grey[900],
                    onPressed: () {
                      dynamic n4 = '%';
                      pressed(n4);
                    },
                    child: Text('%',
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                        )
                    )
                ),
              ),
              Expanded(
                flex: 2,
                child: RaisedButton(
                    padding: EdgeInsets.all(27.6),
                    color: Colors.grey[900],
                    onPressed: () {
                      dynamic n4 = '000';
                      pressed(n4);
                    },
                    child: Icon(Icons.backspace,
                      color: Colors.white,)
                ),
              ),
              Expanded(
                flex: 2,
                child: RaisedButton(
                    padding: EdgeInsets.all(25),
                    color: Colors.grey[900],
                    onPressed: () {
                      dynamic n4 = '/';
                      pressed(n4);
                    },
                    child: Text('/',
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                        )
                    )
                ),
              )
            ],
          ),//end of 0th row
          Row(                    //1st row
            children: <Widget>[
              button('1'),
              button('2'),
              button('3'),
              button('x')
            ],
          ),  //end of 1st row
          Row(           //2nd row
            children: <Widget>[
              button('4'),
              button('5'),
              button('6'),
              button('-')
            ],
          ),//end of 2nd row
          Row(          //3rd row
            children: <Widget>[
              button('7'),
              button('8'),
              button('9'),
              button('+')
            ],
          ),//end of 3rd row
          Row(          //4th row
            children: <Widget>[
              button('0'),
              button('.'),
              button('00'),
              button('=')
            ],
          )//end of 4th row
        ],
      ),
    );
  }
}
