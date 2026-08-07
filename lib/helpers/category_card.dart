import 'package:flutter/material.dart';
import 'package:pos_mobile/models/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final Color backgroundColor;

  const CategoryCard({
    super.key,
    required this.category,
    this.backgroundColor = const Color(0xffF7F0E7),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      constraints: const BoxConstraints(minWidth: 220, maxWidth: 260),
      decoration: BoxDecoration(
        color: backgroundColor,
        
        borderRadius: BorderRadius.circular(20),
      ),
      child: IntrinsicWidth(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              category.image,
              width: 70,
              height: 70,
            ),
            const SizedBox(width: 12),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 140),
              child: Text(
                category.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}