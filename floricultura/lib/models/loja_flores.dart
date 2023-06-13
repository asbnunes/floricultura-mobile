import 'package:flutter/material.dart';

import '../models/flor.dart';

class LojaFlores extends ChangeNotifier{
  // catalogo de flores
  final List<Flor> _catalogo = [
    Flor(
      nome: 'Cravo',
      preco: 'R\$50,00',
      imagem: 'images/cravo.png',
      opcoesDeCores: ['Branco', 'Vermelho', 'Amarelo'],
      corEscolhida: 'Branco',
    ),
    Flor(
      nome: 'Margarida',
      preco: 'R\$40,00',
      imagem: 'images/margarida.png',
      opcoesDeCores: ['Branco', 'Roxo', 'Amarelo'],
      corEscolhida: 'Branco',
    ),
    Flor(
      nome: 'Orquídia',
      preco: 'R\$45,00',
      imagem: 'images/orquidia.jpg',
      opcoesDeCores: ['Branco', 'Rosa', 'Vermelho'],
      corEscolhida: 'Branco',
    ),
    Flor(
      nome: 'Rosa',
      preco: 'R\$60,00',
      imagem: 'images/rosa.png',
      opcoesDeCores: ['Branco', 'Vermelho', 'Rosa'],
      corEscolhida: 'Branco',
    ),
    Flor(
      nome: 'Tulipa',
      preco: 'R\$55,00',
      imagem: 'images/tulipa.png',
      opcoesDeCores: ['Branco', 'Vermelho', 'Amarelo', 'Rosa'],
      corEscolhida: 'Branco',
    ),
  ];

  // Carrinho do usuário
  final List<Flor> _carrinho = [];

  //get catalogo
  List<Flor> get catalogoFlores => _catalogo;

  //get carrinho
  List<Flor> get carrinho => _carrinho;

}