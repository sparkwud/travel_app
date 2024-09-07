import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/screens/travel_destination_details_screen.dart';
import 'package:travel_app/utils/app_images.dart';
import 'package:travel_app/utils/app_palette.dart';
import 'package:travel_app/utils/context_extensions.dart';
import 'package:travel_app/widgets/random_profile_images.dart';
import 'package:travel_app/widgets/s_custom_painter.dart';

class DestinationCard extends StatelessWidget {
  final int index;

  const DestinationCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => _navigateToDetails(context),
      child: SizedBox(
        height: 380,
        child: Stack(
          children: [
            _buildMainImage(),
            _buildCustomPainters(),
            _buildRatingBadge(),
            _buildDestinationInfo(),
            _buildNavigationButton(),
          ],
        ),
      ),
    );
  }

  void _navigateToDetails(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TravelDestinationDetailsPage(
          destinationName: 'destination_${(index % 11)}.jpeg',
        ),
      ),
    );
  }

  Widget _buildMainImage() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Stack(
            children: [
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: .5),
                  child: Hero(
                    tag: 'destination_$index.jpeg',
                    child: Image.asset(
                      "${AppImages.destinationPath}/destination_${(index % 12)}.jpeg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              _buildGradientOverlay(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGradientOverlay() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 230,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0),
              Colors.black.withOpacity(0.3),
              Colors.black.withOpacity(0.5),
              Colors.black.withOpacity(0.85),
              Colors.black,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomPainters() {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          right: 99.5,
          child: CustomPaint(
            size: const Size(40, 40),
            painter: SCustomPainter(),
          ),
        ),
        Positioned(
          bottom: 98,
          right: 0,
          child: CustomPaint(
            size: const Size(40, 40),
            painter: SCustomPainter(),
          ),
        ),
      ],
    );
  }

  Widget _buildRatingBadge() {
    return Positioned(
      top: 18,
      right: 18,
      child: Container(
        // height: 35,
        // width: 70,
        padding: const EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.star,
              color: AppPalette.yellow,
              size: 20,
            ),
            4.spacing,
            Text(
              '4.${Random.secure().nextInt(8) + 1}',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDestinationInfo() {
    return Positioned(
      left: 20,
      bottom: 30,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Eira do \nSerrado',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.1,
            ),
          ),
          8.spacing,
          _buildDayAndPrice(),
          4.spacing,
          // _buildProfileImages(),
          const RandomProfileImages(),
        ],
      ),
    );
  }

  Widget _buildDayAndPrice() {
    final days = Random.secure().nextInt(4) + 1;
    return Text(
      days > 1
          ? '$days Days • GH\u00A2${days * (Random.secure().nextInt(1000) + 14)}'
          : '$days Day • GH\u00A2${days * (Random.secure().nextInt(1000) + 14)}',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _buildNavigationButton() {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              color: AppPalette.offWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(70),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: AppPalette.orange,
              borderRadius: BorderRadius.circular(40),
            ),
            child: const Icon(
              CupertinoIcons.arrow_up_right,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
