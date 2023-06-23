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
  final PageController _pageController = PageController(initialPage: 0);

  final List<Widget> _screens = const [
    Home(),
    Carrinho(),
    InfoUsuario(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    });
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _screens,
      ),
      bottomNavigationBar: GNav(
        backgroundColor: const Color(0xffffb3b3),
        color: const Color.fromARGB(176, 108, 72, 72),
        activeColor: const Color(0xff6c4848),
        padding: const EdgeInsets.all(18),
        gap: 12,
        selectedIndex: _currentIndex,
        onTabChange: _onTapped,
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.shopping_cart,
            text: 'Carrinho',
          ),
          GButton(
            icon: Icons.account_circle,
            text: 'Minha Conta',
          ),
        ],
      ),
    );
  }
}
