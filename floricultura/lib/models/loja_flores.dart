import '../models/flor.dart';

class LojaFlores {
  // catalogo de flores
  final List<Flor> _catalogo = [
    Flor(
      nome: 'Cravo',
      preco: 'R\$50,00',
      imagem: 'images/cravo.png',
    ),
    Flor(
      nome: 'Margarida',
      preco: 'R\$40,00',
      imagem: 'images/margarida.png',
    ),
    Flor(
      nome: 'Orquídia',
      preco: 'R\$45,00',
      imagem: 'images/orquidia.jpg',
    ),
    Flor(
      nome: 'Rosa',
      preco: 'R\$60,00',
      imagem: 'images/rosa.png',
    ),
    Flor(
      nome: 'Tulipa',
      preco: 'R\$55,00',
      imagem: 'images/tulipa.png',
    ),
  ];

  // Carrinho do usuário
  final List<Flor> _carrinho = [];

  //get catalogo
  List<Flor> get catalogoFlores => _catalogo;

  //get carrinho
  List<Flor> get carrinho => _carrinho;

}