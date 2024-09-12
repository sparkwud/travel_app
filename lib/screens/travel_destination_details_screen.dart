import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/utils/context_extensions.dart';
import 'package:travel_app/widgets/random_profile_images.dart';

import '../utils/app_palette.dart';

class TravelDestinationDetailsPage extends StatefulWidget {
  final String destinationName;
  const TravelDestinationDetailsPage({
    required this.destinationName,
    super.key,
  });

  @override
  State<TravelDestinationDetailsPage> createState() =>
      _TravelDestinationDetailsPageState();
}

class _TravelDestinationDetailsPageState
    extends State<TravelDestinationDetailsPage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.offWhite,
      body: Stack(
        children: [
          Positioned.fill(
            child: ListView(
              controller: _scrollController,
              padding: const EdgeInsets.only(top: 0, bottom: 120),
              children: [
                SizedBox(
                  height: context.height * .65,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Hero(
                          tag: widget.destinationName,
                          child: Image.asset(
                            'assets/destination/${widget.destinationName}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 300,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black,
                                Colors.black.withOpacity(0.67),
                                Colors.black.withOpacity(0.0),
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 100,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Expanded(
                                    child: Text(
                                      'Lighthouse Cabo da Roca',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        height: 1.1,
                                        letterSpacing: -1,
                                      ),
                                    ),
                                  ),
                                  16.spacing,
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          const Icon(
                                            CupertinoIcons.star_fill,
                                            color: AppPalette.yellow,
                                            size: 24,
                                          ),
                                          6.spacing,
                                          Text(
                                            '4.5',
                                            style: TextStyle(
                                              fontSize: 21,
                                              color:
                                                  Colors.white.withOpacity(.8),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                      8.spacing,
                                      Text(
                                        '123 reviews',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white.withOpacity(.8),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              16.spacing,
                              const RandomProfileImages(),
                            ],
                          ),
                        ),
                      ),
                      const Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: ListViewHeader(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DestinationStatsWidget(
                            title: 'Location',
                            value: 'Portugal',
                            iconData: CupertinoIcons.location_solid,
                          ),
                          DestinationStatsWidget(
                            title: 'Price',
                            value: '80\u20AC',
                            iconData: CupertinoIcons.money_euro_circle,
                          ),
                        ],
                      ),
                      16.spacing,
                      const Text(
                        'Cabo da Roca or Cape Roca is a cape which forms the westernmost '
                        'point of the Sintra Mountain Range, of mainland Portugal, of '
                        'continental Europe, and of the Eurasian land mass. '
                        'It is situated in the municipality of Sintra, near Azóia, '
                        'in the southwest of the district of Lisbon, forming the westernmost '
                        'extent of the Serra de Sintra. The cape is in the westernmost point of '
                        'the European continent, located within the Sintra-Cascais '
                        'Natural Park, and is a popular tourist attraction that '
                        'marks the most westerly point of mainland Europe.',
                        maxLines: 11,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 45,
            left: 25,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              behavior: HitTestBehavior.translucent,
              child: TweenAnimationBuilder(
                tween: Tween<double>(
                  begin: _scrollPosition >= 120 ? 1 : 0,
                  end: _scrollPosition >= 120 ? 0 : 1,
                ),
                duration: const Duration(milliseconds: 500),
                curve:
                    _scrollPosition >= 120 ? Curves.easeOut : Curves.bounceOut,
                builder: (context, double value, child) {
                  return Container(
                    height: 40 * value,
                    width: 40 * value,
                    decoration: BoxDecoration(
                      color: AppPalette.darkGrey,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                      size: 20 * value,
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 140,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppPalette.offWhite,
                    AppPalette.offWhite.withOpacity(0.67),
                    AppPalette.offWhite.withOpacity(0.0),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 25,
            left: 20,
            right: 20,
            child: Container(
              height: 68,
              decoration: BoxDecoration(
                color: AppPalette.orange,
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Book Now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DestinationStatsWidget extends StatelessWidget {
  final String title;
  final String value;
  final IconData iconData;
  const DestinationStatsWidget({
    required this.title,
    required this.value,
    required this.iconData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: AppPalette.lightGrey,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(iconData),
          ),
          16.spacing,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppPalette.lightBrown,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ListViewHeader extends StatefulWidget {
  const ListViewHeader({super.key});

  @override
  State<ListViewHeader> createState() => _ListViewHeaderState();
}

class _ListViewHeaderState extends State<ListViewHeader> {
  int _selectedIndex = 0;
  final List<String> _tabs = [
    'Overview',
    'Reviews',
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 80,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppPalette.offWhite,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(45),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (int i = 0; i < _tabs.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = i;
                          });
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              _tabs[i],
                              style: TextStyle(
                                fontSize: 18,
                                color: i == _selectedIndex
                                    ? AppPalette.orange
                                    : AppPalette.lightBrown,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              height: i == _selectedIndex ? 9 : 0,
                              width: i == _selectedIndex ? 9 : 0,
                              decoration: BoxDecoration(
                                color: i == _selectedIndex
                                    ? AppPalette.orange
                                    : AppPalette.lightBrown,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 35,
            top: 10,
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(90),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: const Icon(
                Icons.bookmark_rounded,
                color: AppPalette.orange,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
