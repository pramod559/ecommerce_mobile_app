import 'package:ecommerce_mobile_app/constants.dart';
import 'package:ecommerce_mobile_app/models/product.dart';
import 'package:flutter/material.dart';

class ItemsDetails extends StatelessWidget {
  const ItemsDetails({
    super.key,
    required this.product,
  });

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 25,
          ),
        ),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "\$${product.price}",
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 10),
            //for rating
            Row(
              children: [
                Container(
                  width: 55,
                  height: 25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kprimaryColor),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 15,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        product.rate.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  product.review,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                )
              ],
            )
          ],
        ),
        const Spacer(),
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(
                text: "Seller: ",
                style: const TextStyle(fontSize: 16),
              ),
              TextSpan(
                text: product.seller,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
