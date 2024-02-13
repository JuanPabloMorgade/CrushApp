import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'dart:math';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({Key? key, required this.message}) : super(key: key);
  final Message message;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5),
        _ImageBubble(message: message),
        const SizedBox(height: 15)
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final Message message;

  const _ImageBubble({Key? key, required this.message}) : super(key: key);

  static String randomImage() {
    final Random random = Random();
    if (random.nextDouble() < 0.1) {
      return 'https://i.pinimg.com/originals/d8/10/41/d81041ed3ebf5ea3510710a619200991.gif';
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final imageUrl = randomImage();

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl.isNotEmpty ? imageUrl : message.imageUrl!,
        width: size.width * 0.7,
        height: 250,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text('Mama de Guido ❤️ esta enviando una imagen'),
          );
        },
      ),
    );
  }
}
