class User {
  String nome;
  String email;
  String senha;
  String telefone;
  String localidade;

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

  User(this.nome, this.email, this.senha, this.telefone, this.localidade);

  @override
  String toString() {
    return 'Usuario{nome: $nome, local: $localidade}';
  }
}
