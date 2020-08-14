import 'package:VinieSantanaLoterias/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      home: Login(),
      debugShowCheckedModeBanner: false,
      title: "Loterias Caixa",
      theme: ThemeData(primaryColor: Colors.blue),
    ));

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Home(
                                        nameController.text,
                                        cityController.text),
                                  ));
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
