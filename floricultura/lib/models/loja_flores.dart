import 'package:flutter/material.dart';

import '../models/flor.dart';

class LojaFlores extends ChangeNotifier{
  // catalogo de flores
  final List<Flor> _catalogo = [
    Flor(
      nome: 'Cravo',
      preco: 75.0,
      imagem: 'images/cravo.png',
      opcoesDeCores: ['Branco', 'Vermelho', 'Amarelo'],
      corEscolhida: 'Branco',
    ),
    Flor(
      nome: 'Margarida',
      preco: 80.0,
      imagem: 'images/margarida.png',
      opcoesDeCores: ['Branco', 'Roxo', 'Amarelo'],
      corEscolhida: 'Branco',
    ),
    Flor(
      nome: 'Orquídia',
      preco: 90.0,
      imagem: 'images/orquidia.jpg',
      opcoesDeCores: ['Branco', 'Rosa', 'Vermelho'],
      corEscolhida: 'Branco',
    ),
    Flor(
      nome: 'Rosa',
      preco: 120.0,
      imagem: 'images/rosa.png',
      opcoesDeCores: ['Branco', 'Vermelho', 'Rosa'],
      corEscolhida: 'Branco',
    ),
    Flor(
      nome: 'Tulipa',
      preco: 110.0,
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

  //adicionar ao carrinho
  void adicionarAoCarrinho(Flor flor){
    _carrinho.add(flor);
    notifyListeners();
  }

  //remover do carrinho
  void removerDoCarrinho(Flor flor){
    _carrinho.remove(flor);
    notifyListeners();
  }
}