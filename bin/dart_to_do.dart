import 'dart:io';

List<String> tarefas = [];

void main() {
  while (true) {
    stdout.write("\n1-Adicionar 2-Listar 3-Remover 4-Sair: ");
    String? opcao = stdin.readLineSync();

    switch (opcao) {
      case '1':
        adicionarTarefa();
        break;
      case '2':
        listarTarefas();
        break;
      case '3':
        removerTarefa();
        break;
      case '4':
        print("Saindo...");
        return;
      default:
        print("Opção inválida, tente novamente.");
    }
  }
}

void adicionarTarefa() {
  stdout.write("Tarefa: ");
  String? tarefa = stdin.readLineSync();
  if (tarefa != null && tarefa.isNotEmpty) {
    tarefas.add(tarefa);
    print("Tarefa adicionada com sucesso!");
  } else {
    print("Tarefa inválida.");
  }
}

void listarTarefas() {
  if (tarefas.isEmpty) {
    print("Nenhuma tarefa cadastrada.");
    return;
  }
  for (var i = 0; i < tarefas.length; i++) {
    print("${i + 1}. ${tarefas[i]}");
  }
}

void removerTarefa() {
  if (tarefas.isEmpty) {
    print("Não há tarefas para remover.");
    return;
  }

  stdout.write("Número: ");
  int? i = int.tryParse(stdin.readLineSync() ?? "");
  if (i != null && i > 0 && i <= tarefas.length) {
    print("Tarefa '${tarefas[i - 1]}' removida.");
    tarefas.removeAt(i - 1);
  } else {
    print("Número inválido.");
  }
}


