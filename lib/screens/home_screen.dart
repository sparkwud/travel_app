import 'package:flutter/material.dart';
import 'package:travel_app/utils/context_extensions.dart';
import 'package:travel_app/widgets/destination_card.dart';

import '../utils/app_palette.dart';
import '../widgets/activity_tile_list_view_widget.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/home_header_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int _selectedIndex = 0;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.offWhite,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: ListView(
                padding: const EdgeInsets.all(16).copyWith(bottom: 100),
                children: [
                  const HomeHeaderWidget(),
                  16.spacing,
                  const Text(
                    'Hi, Kisa 👋',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      // letterSpacing: -1.5,
                    ),
                  ),
                  16.spacing,
                  const ActivityTileListView(),
                  16.spacing,
                  // ..._buildDestinationList(),
                  ListView.separated(
                    itemCount: 16,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => 16.spacing,
                    itemBuilder: (context, index) =>
                        DestinationCard(index: index),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: 30,
              right: 30,
              child: BottomNavigationBarWidget(
                selectedIndex: _selectedIndex,
                onItemSelected: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
