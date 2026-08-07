import 'package:flutter/material.dart';
import 'package:pos_mobile/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,

      // height: 288,
      padding: const EdgeInsets.only(top: 20, bottom: 16, left: 16, right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 110,
            width: double.infinity,
            child: Center(
              child: Image.asset(
                product.image,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            product.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            product.description,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                  
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.add_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                  // style: IconButton.styleFrom(
                  //   backgroundColor: Colors.green,

                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(12),
                  //   ),
                  // ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
