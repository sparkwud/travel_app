import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/utils/app_images.dart';

import '../utils/app_palette.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildIconButton(
          icon: Icons.menu_rounded,
        ),
        const Spacer(),
        _buildIconButton(
          icon: CupertinoIcons.search,
        ),
        const SizedBox(width: 5),
        _buildIconButton(
          icon: CupertinoIcons.bell,
        ),
        const SizedBox(width: 5),
        _buildProfileImage(AppImages.avi0),
      ],
    );
  }

  Container _buildIconButton({
    required IconData icon,
    String? label,
  }) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        color: AppPalette.lightGrey,
        borderRadius: BorderRadius.circular(55),
      ),
      child: Icon(
        semanticLabel: label,
        icon,
        size: 25,
      ),
    );
  }

  Widget _buildProfileImage(String profileImage) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        color: AppPalette.lightGrey,
        borderRadius: BorderRadius.circular(55),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(55),
        child: Image.asset(
          profileImage,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => const Icon(
            Icons.account_circle_rounded,
            size: 25,
          ), // Fallback if the image fails to load
        ),
      ),
    );
  }
}
