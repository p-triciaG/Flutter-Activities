import 'package:activity/models/UserModel.dart';
import 'package:flutter/material.dart';

class AccountForms extends StatelessWidget {
  final dynamic _formKey;
  final String screenTitle;
  final Function _submit;
  final bool showLogin;
  UserModel? user;
  String senha = '';

  AccountForms(this.screenTitle, this._formKey, this._submit, { this.showLogin = true, this.user, Key? key}) : super(key: key){
    user ??= UserModel.sign();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Text(
                  screenTitle,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Colors.lightGreen),
                ),
              ),
            ),
          ),
          Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: TextFormField(
                    initialValue: (user!.getNome.isNotEmpty) ? user!.getNome : null,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nome',
                        hintText: 'Insira seu nome completo'),
                    validator: (value) {
                      if (value!.isEmpty){
                        return "Adicione um nome válido";
                      }
                      return null;
                    },
                    onSaved: ((newValue) {
                      user!.nome = newValue!;
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    initialValue: (user!.getEmail.isNotEmpty) ? user!.getEmail : null,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Insira Seu melhor email'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Adicione um email válido";
                      }
                      return null;
                    },
                    onSaved: ((newValue) {
                      user!.email = newValue!;
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 20),
                  child: TextFormField(
                    initialValue: (user!.getSenha.isNotEmpty) ? user!.getSenha : null,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Senha',
                        hintText: 'Insira uma senha segura'),
                    validator: ((value) {
                      if (value!.isEmpty){
                        return "Senha não pode ser vazia";
                      }
                      else if (value.length < 6){
                        return "Mínimo 6 caracteres";
                      }
                      return null;
                    }),
                    onChanged: (value) => senha = value,
                    onSaved: (newValue) => user!.senha = newValue!,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    initialValue: (user!.getSenha.isNotEmpty) ? user!.getSenha : null,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confirmar senha',
                        hintText: 'As senhas devem ser identicas'),
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return "Confirme sua senha";
                      } else if(value != senha) {
                        return "Senhas estão diferentes";
                      }
                      return null;
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 20),
                  child: TextFormField(
                    initialValue: (user!.getTelefone.isNotEmpty) ? user!.getTelefone : null,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Telefone',
                        hintText: '(00)00000-0000'),
                    validator: (value) {
                      if (value!.isEmpty){
                        return "Digite um telefone";
                      }
                      return null;
                    },
                    onSaved: (newValue) => user!.telefone = newValue!,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 60),
                  child: Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(20)),
                    child: ElevatedButton(
                      onPressed: () => _submit(user),
                      child: Text(
                        (showLogin)?'Cadastrar': 'Confirmar',
                        style: const TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ),
                if(showLogin) Padding(
                  padding: const EdgeInsets.only(bottom: 80),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Já possui uma conta?'),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Entrar",
                            style: TextStyle(color: Colors.lightGreen),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}