import 'package:flutter/material.dart';
import 'package:travel_app/utils/app_images.dart';
import 'package:travel_app/utils/context_extensions.dart';

import '../model/activity_model.dart';
import '../utils/app_palette.dart';

class ActivityTileListView extends StatelessWidget {
  const ActivityTileListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 65,
      child: _ActivityList(),
    );
  }
}

class _ActivityList extends StatefulWidget {
  const _ActivityList();

  @override
  State<_ActivityList> createState() => _ActivityListState();
}

class _ActivityListState extends State<_ActivityList> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: ActivityModel.dummyList.length,
      scrollDirection: Axis.horizontal,
      separatorBuilder: (_, __) => const SizedBox(width: 15),
      itemBuilder: (context, index) {
        final model = ActivityModel.dummyList[index];
        return _ActivityTile(
          model: model,
          isSelected: _selectedIndex == index,
          onTap: () => setState(() => _selectedIndex = index),
        );
      },
    );
  }
}

class _ActivityTile extends StatelessWidget {
  final ActivityModel model;
  final bool isSelected;
  final VoidCallback onTap;

  const _ActivityTile({
    required this.model,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        height: 60,
        decoration: BoxDecoration(
          color: AppPalette.lightGrey,
          border: isSelected
              ? Border.all(
                  color: Colors.black,
                  width: 1.3,
                )
              : null,
          borderRadius: BorderRadius.circular(50),
        ),
        padding: const EdgeInsets.all(5).copyWith(right: 20),
        child: Row(
          children: [
            _ActivityImage(assetName: model.assetName),
            16.spacing,
            Text(
              model.name,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActivityImage extends StatelessWidget {
  final String assetName;

  const _ActivityImage({required this.assetName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      height: 56,
      width: 53,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.asset(
          "${AppImages.activityPath}/$assetName",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
