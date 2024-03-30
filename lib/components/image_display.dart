import 'package:flutter/material.dart';

class ImageDisplay extends StatelessWidget {
  final String? imageUrl;
  final bool isFetching;
  const ImageDisplay(
      {super.key, this.imageUrl, required this.isFetching});

  @override
  Widget build(BuildContext context) {
    if (isFetching) {
      return const CircularProgressIndicator(
        color: Colors.white,
      );
    }
    if (imageUrl == null) {
      return const SizedBox();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _Image(imageUrl: imageUrl!),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class _Image extends StatelessWidget {
  final String imageUrl;
  const _Image({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        imageUrl,
        width: double.maxFinite,
        fit: BoxFit.cover,
      ),
    );
  }
}


