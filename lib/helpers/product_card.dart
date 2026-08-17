import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pos_mobile/models/product.dart';
import 'package:pos_mobile/screens/product_detail_screen.dart';


class ProductCard extends StatefulWidget {
  final Product product;
  const ProductCard({super.key, required this.product});
    @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  double _scale = 1.0;
  // late Color _cardColor;

  // @override
  // void initState() {
  //   super.initState();

  //   final colors = [
  //     Colors.red.shade100,
  //     Colors.blue.shade100,
  //     Colors.green.shade100,
  //     Colors.orange.shade100,
  //     Colors.purple.shade100,
  //     Colors.yellow.shade100,
  //     Colors.pink.shade100,
  //   ];

  //   _cardColor = colors[Random().nextInt(colors.length)];
  // }


  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
    scale: _scale,

    duration: const Duration(milliseconds: 100),
    child: InkWell(      
      borderRadius: BorderRadius.circular(20),

      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ProductDetailScreen(product: widget.product),
          ),
        );
      },

      onTapDown: (_) {
        setState(() {
          _scale = 0.95;
        });
      },

      onTapUp: (_) {
        setState(() {
          _scale = 1.0;
        });
      },

      onTapCancel: () {
        setState(() {
          _scale = 1.0;
        });
      },
        
        child: Container(
          width: 190,
          padding: const EdgeInsets.only(
            top: 20,
            bottom: 16,
            left: 16,
            right: 16,
          ),
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
                    widget.product.image,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                widget.product.name,
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
                widget.product.description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '\$${widget.product.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    // decoration: BoxDecoration(
                    //   color: Colors.green,
                    //   borderRadius: BorderRadius.circular(12),
                    // ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.add_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.green,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        // Add product to cart here
                        // print("Add ${widget.product.name} to cart");
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
