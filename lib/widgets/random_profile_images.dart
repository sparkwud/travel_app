import 'dart:math';

import 'package:flutter/material.dart';
import 'package:travel_app/widgets/frosted_widget.dart';

class RandomProfileImages extends StatelessWidget {
  final int maxImages;
  final int displayedImages;

  const RandomProfileImages({
    super.key,
    this.maxImages = 6,
    this.displayedImages = 3,
  });

  @override
  Widget build(BuildContext context) {
    return _buildProfileImages();
  }

  Widget _buildProfileImages() {
    final random = Random.secure();
    final allIndices = List.generate(maxImages, (index) => index);
    allIndices.shuffle(random);
    final selectedIndices = allIndices.take(displayedImages).toList();
    final others = random.nextInt(4) + 1;

    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < selectedIndices.length; i++)
              Align(
                widthFactor: 0.7,
                child: _buildProfileImage(selectedIndices[i]),
              ),
          ],
        ),
        const SizedBox(width: 5),
        SizedBox.square(
          dimension: 35,
          child: FrostedWidget(
            child: Text(
              "+$others",
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileImage(int index) {
    return Container(
      height: 40,
      width: 40,
      padding: const EdgeInsets.all(2.5),
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          'assets/avi/avi_${index + 1}.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
