import 'package:flutter/material.dart';

class ContainerImage extends StatelessWidget {
  const ContainerImage({super.key, this.image, this.height, this.width});

  final String? image;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        image: image != null
            ? DecorationImage(
                image: AssetImage(image!),
                fit: BoxFit.fill,
              )
            : null, // No image decoration if null
        color: Colors.grey[200], // Add a background color as fallback
      ),
    );
  }
}
