import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:test_mobx/stores/email_store.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailStore = EmailStore();

    void _nextStep() {
      print("botao ativado");
    }

    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                onChanged: emailStore.changeEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    labelText: "E-mail", labelStyle: TextStyle(fontSize: 30.0)),
              ),
              Observer(
                builder: (_) => MaterialButton(
                  minWidth: double.infinity,
                  onPressed: emailStore.buttonEnabled ? _nextStep : null,
                  textColor: Colors.white,
                  color: Colors.blue,
                  disabledColor: Colors.grey,
                  child: const Text(
                    'Continuar',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
