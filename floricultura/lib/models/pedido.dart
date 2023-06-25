class Pedido{
  final List<String> itens;
  final double total;
  final String userId;
  final String id;

  Pedido({
     required this.id,
    required this.itens,
    required this.total,
    required this.userId,
  });
}
