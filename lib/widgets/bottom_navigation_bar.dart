import 'package:flutter/material.dart';

import '../utils/app_palette.dart';
import 'frosted_widget.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
    this.height = 70.0,
    this.itemWidth = 82.0,
    this.iconSize = 25.0,
    this.borderRadius = 60.0,
    this.backgroundColor,
    this.selectedItemColor = Colors.black,
    this.unselectedItemColor = Colors.white,
  });

  final int selectedIndex;
  final ValueChanged<int> onItemSelected;
  final double height;
  final double itemWidth;
  final double iconSize;
  final double borderRadius;
  final Color? backgroundColor;
  final Color selectedItemColor;
  final Color unselectedItemColor;

  static const List<IconData> _icons = [
    Icons.home_rounded,
    Icons.search_rounded,
    Icons.favorite_rounded,
    Icons.person_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: FrostedWidget(
          color: backgroundColor ?? AppPalette.darkBrown.withOpacity(0.6),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOutQuad,
                  left: selectedIndex * itemWidth,
                  top: 0,
                  child: Container(
                    height: height - 10,
                    width: itemWidth,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(borderRadius - 10),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    _icons.length,
                    (index) => _buildNavItem(index),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index) {
    return GestureDetector(
      onTap: () => onItemSelected(index),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: itemWidth,
        height: height - 10,
        child: Center(
          child: Icon(
            _icons[index],
            size: iconSize,
            color: selectedIndex == index
                ? selectedItemColor
                : unselectedItemColor,
          ),
        ),
      ),
    );
  }
}
