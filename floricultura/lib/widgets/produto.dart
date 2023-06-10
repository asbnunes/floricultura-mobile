import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final String name;
  final String price;
  final String image;

  const ProductWidget({required this.name, required this.price, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            minimumSize: const Size.fromHeight(125),
            textStyle: const TextStyle(fontSize: 18),
            backgroundColor: const Color(0xffffb3b3),
            foregroundColor: const Color(0xff6c4848),
          ),
          onPressed: () {
            const routeName = '/produto-page';
            Navigator.pushNamed(context, routeName);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8.0),
              Expanded(
                child: Image(image: AssetImage(image), fit: BoxFit.fill,),
              ),
              const SizedBox(height: 8.0),
              Container(
                height: 2,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFB3B3),
                  borderRadius: BorderRadius.zero,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                price,
                style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text(
                name,
                style: const TextStyle(fontSize: 14.0),
              ),
              const SizedBox(height: 8.0),
              const Text(
                "Disponível",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 9.0,
                  color: Color(0xFF4BC56D),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
