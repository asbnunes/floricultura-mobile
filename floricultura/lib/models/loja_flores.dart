import 'package:flutter/material.dart';

import '../models/flor.dart';

class LojaFlores extends ChangeNotifier{

  // Carrinho do usuário
  final List<Flor> _carrinho = [];

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

  void esvaziarCarrinho(){
    _carrinho.clear();
    notifyListeners();
  }
}