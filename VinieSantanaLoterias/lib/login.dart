import 'package:VinieSantanaLoterias/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool errorLogin = false;
  final nameController = new TextEditingController();
  final cityController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: SingleChildScrollView(
              padding: EdgeInsets.all(30),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.grey),
                  ],
                ),
                padding: EdgeInsets.all(30),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    errorLogin == true
                        ? Column(children: [
                            Container(
                                padding: EdgeInsets.all(10),
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.red,
                                ),
                                child: Center(
                                  child: Text(
                                    "DIGITE OS DADOS NECESSARIOS PARA ENTRAR",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                )),
                            SizedBox(
                              height: 20,
                            )
                          ])
                        : Container(),
                    Image.asset(
                      "assets/logo_main.png",
                      width: size.width / 3,
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: "Insira o seu nome",
                      ),
                    ),
                    TextField(
                      controller: cityController,
                      decoration:
                          InputDecoration(labelText: "Insira a sua cidade"),
                    ),
                    SizedBox(
                        width: size.width,
                        child: RaisedButton(
                          color: Colors.deepOrange,
                          onPressed: () {
                            if (nameController.text.isNotEmpty &&
                                cityController.text.isNotEmpty) {
                              setState(() {
                                errorLogin = false;
                              });
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Home(
                                        nameController.text,
                                        cityController.text),
                                  ));
                            } else {
                              setState(() {
                                errorLogin = true;
                              });
                            }
                          },
                          child: Text(
                            "ENTRAR",
                            style: TextStyle(color: Colors.white),
                          ),
                        ))
                  ],
                )),
              )),
        ));
  }
}
