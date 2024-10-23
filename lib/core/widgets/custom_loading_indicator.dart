import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBookItem extends StatelessWidget {
  const ShimmerBookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Shimmer.fromColors(
        direction: ShimmerDirection.ltr,
        loop: 2,
        baseColor: Colors.white,
        highlightColor: Colors.grey,
        child: AspectRatio(
          aspectRatio: 2.6 / 4,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            width: 80,
            height: 130,
          ),
        ),
      ),
    );
  }
}
