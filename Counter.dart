import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false, title: "Angeloni", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pessoas = 0;
  String _infoText = "Pode Entrar!";
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController insterUser = TextEditingController();
  //int var = int.parse(insterUser.text);

  //int _insertText = _pessoas;
  _chagePeoples() {
    setState(() {
      String nometest = insterUser.text;
      _pessoas = int.parse('$nometest');
      insterUser.text = "";
    });
  }

  void _chagePeople(int delta) {
    setState(() {
      _formKey = GlobalKey<FormState>();

      _pessoas += delta;
      if (_pessoas < 0) {
        _pessoas = 0;
      } else if (_pessoas <= 199) {
        _infoText = "Pode Entrar!";
      } else if (_pessoas <= 200) {
        _infoText = "Alerta, Avise o Fiscal !";
      } else if (_pessoas <= 270) {
        _infoText = "Alerta !!!!! ";
      } else {
        _infoText = "Lotado!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Contagem de Clientes")),
          backgroundColor: Colors.lightBlue[600],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Stack(
              children: <Widget>[
                Container(
                  color: Colors.white54,
                ),
                Padding(
                  padding: const EdgeInsets.all(0.5),
                  child: SizedBox(
                    width: 400,
                    height: 250,
                    child: Container(
                      child: Image.asset(
                        "test/imagens/angelonilg.png",
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 210.0),
                      child: Text("Clientes : $_pessoas ",
                          style: GoogleFonts.oswald(
                            textStyle: TextStyle(
                              color: Colors.blue,
                              letterSpacing: .5,
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            ),
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: FlatButton(
                            color: Colors.lightBlue[600],
                            child: SizedBox(
                              //width: MediaQuery.of(context).size.width * 0.35,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Icon(Icons.exposure_plus_1,
                                    color: Colors.white, size: 80),
                              ),
                            ),
                            onPressed: () {
                              _chagePeople(1);
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: FlatButton(
                            color: Colors.lightBlue[600],
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                //width: MediaQuery.of(context).size.width * 0.35,
                                child: Icon(Icons.exposure_minus_1,
                                    color: Colors.white, size: 80),
                              ),
                            ),
                            onPressed: () {
                              _chagePeople(-1);
                            },
                          ),
                        ),
                      ],
                    ),
                    Text(
                      _infoText,
                      style: GoogleFonts.oswald(
                          textStyle: TextStyle(
                        color: Colors.blue,
                        letterSpacing: .5,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "Quantos Clientes tem ?",
                            hintStyle: TextStyle(color: Colors.blue)),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.blue, fontSize: 30.0),
                        controller: insterUser,

                        // ignore: missing_return
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.0, bottom: 13.0),
                      child: Container(
                        height: 50,
                        child: RaisedButton(
                          onPressed: () {
                            // insterUser.text = _pessoas.toString();
                            _chagePeoples();
                            //print(_pessoas);
                          },
                          child: Text(
                            "Inserir",
                            style:
                                TextStyle(color: Colors.white, fontSize: 25.0),
                          ),
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
