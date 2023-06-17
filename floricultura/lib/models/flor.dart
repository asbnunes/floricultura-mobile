class Flor {
  final String nome;
  final double preco;
  final String imagem;
  final List<String> opcoesDeCores;
  String corEscolhida;

  Flor({
    required this.nome,
    required this.preco,
    required this.imagem,
    required this.opcoesDeCores,
    this.corEscolhida = '',
  });
}
