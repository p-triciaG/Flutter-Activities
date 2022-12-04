class UserModel {
  late String nome;
  late String email;
  late String senha;
  late String telefone;
  late String localidade;

  get getNome => this.nome;

  set setNome(nome) => this.nome = nome;

  get getEmail => this.email;

  set setEmail(email) => this.email = email;

  get getSenha => this.senha;

  set setSenha(senha) => this.senha = senha;

  get getTelefone => this.telefone;

  set setTelefone(telefone) => this.telefone = telefone;

  get getLocal => this.localidade;

  set setLocal(local) => this.localidade = local;

  UserModel(this.nome, this.email, this.senha, this.telefone, this.localidade);

  UserModel.sign(){
    nome = "";
    email = "";
    senha = "";
    telefone = "";
    localidade = "";
  }

  UserModel.fromMap(map){
    nome = map["name"];
    email = map["email"];
    senha = map["password"];
    telefone = map["phone"];
    localidade = "";
  }

  toMap(){
    var map = <String, dynamic>{};
    map["name"] = nome;
    map["email"] = email;
    map["password"] = senha;
    map["phone"] = telefone;
    return map;
  }

  @override
  String toString() {
    return 'Usuario{nome: $nome, local: $localidade}';
  }
}
