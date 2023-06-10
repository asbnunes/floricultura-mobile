import 'package:flutter/material.dart';

class CarrinhoItem extends StatelessWidget {
  final String nome;
  final String imagem;
  final double preco;

  const CarrinhoItem(
      {Key? key, required this.nome, required this.imagem, required this.preco})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    String precoArredondado = preco.toStringAsFixed(2);

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(image: AssetImage(imagem), width: 90, height: 90,),
            Text(
              nome,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: Color(0xff6c4848),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'R\$$precoArredondado',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff6c4848),
                  ),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    // Implemente a lógica para remover o widget
                  },
                  child: const Icon(
                    Icons.close,
                    color: Color(0xff6c4848),
                    size: 24,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
