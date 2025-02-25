import 'dart:convert';

class Dependente {
  String _nome;

  Dependente(this._nome);

  Map<String, dynamic> toJson() => {
    'nome': _nome,
  };
}

class Funcionario {
  String _nome;
  List<Dependente> _dependentes;

  Funcionario(this._nome, this._dependentes);

  Map<String, dynamic> toJson() => {
    'nome': _nome,
    'dependentes': _dependentes.map((d) => d.toJson()).toList(),
  };
}

class EquipeProjeto {
  String _nomeProjeto;
  List<Funcionario> _funcionarios;

  EquipeProjeto(this._nomeProjeto, this._funcionarios);

  Map<String, dynamic> toJson() => {
    'nomeProjeto': _nomeProjeto,
    'funcionarios': _funcionarios.map((f) => f.toJson()).toList(),
  };
}

void main() {
  // 1. Criar vários objetos Dependente
  Dependente dependente1 = Dependente("Lucas VenicioA");
  Dependente dependente2 = Dependente("Otávio lira");
  Dependente dependente3 = Dependente("José Maia");

  // 2. Criar vários objetos Funcionario
  Funcionario funcionario1 = Funcionario("Ricardo Taveira", [dependente1, dependente2]);
  Funcionario funcionario2 = Funcionario("José Roberto", [dependente3]);

  // 3. Criar uma lista de Funcionarios
  List<Funcionario> funcionarios = [funcionario1, funcionario2];

  // 4. Criar um objeto EquipeProjeto com o nome do projeto e a lista de funcionários
  EquipeProjeto equipe = EquipeProjeto("Projeto pro", funcionarios);

  // 5. Printar no formato JSON o objeto EquipeProjeto
  String equipeJson = jsonEncode(equipe.toJson());
  print(equipeJson);
}
