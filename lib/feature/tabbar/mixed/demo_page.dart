import 'package:examplaapplication2024/feature/tabbar/mixed/model/mixed_models.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final Products product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            product.image,
            height: 40,
            width: 500,
            alignment: Alignment.center,
          ),
          Flexible(
            child: Text(
              product.title,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),
          ),
          Flexible(
            child: Text(
              '\$${product.price}',
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
