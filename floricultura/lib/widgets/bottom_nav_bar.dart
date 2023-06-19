import 'package:floricultura/screens/carrinho.dart';
import 'package:floricultura/screens/home.dart';
import 'package:floricultura/screens/informacoes_usuario.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int _currentIndex = 0;
  List<Widget> _screens = [
    Home(),
    Carrinho(),
    InfoUsuario(),
  ];

  void _onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: GNav(
        backgroundColor: Color(0xffffb3b3),
        color: Color.fromARGB(176, 108, 72, 72),
        activeColor: Color(0xff6c4848),
        padding: EdgeInsets.all(18),
        gap: 12,
        selectedIndex: _currentIndex,
        onTabChange: _onTapped,
        tabs: [
          GButton(icon: Icons.home, text: 'Home',),
          GButton(icon: Icons.shopping_cart, text: 'Carrinho',),
          GButton(icon: Icons.account_circle,text: 'Minha Conta',),
        ],
      ),
    );
  }
}