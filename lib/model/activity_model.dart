class ActivityModel {
  final String name;
  final String assetName;

  const ActivityModel({
    required this.name,
    required this.assetName,
  });

  static final List<ActivityModel> dummyList = [
    const ActivityModel(
      name: 'Hiking',
      assetName: 'activity_1.jpeg',
    ),
    const ActivityModel(
      name: 'Sky tours',
      assetName: 'activity_2.png',
    ),
    const ActivityModel(
      name: 'Boating',
      assetName: 'activity_3.jpeg',
    ),
    const ActivityModel(
      name: 'Camping',
      assetName: 'activity_4.jpeg',
    ),
    const ActivityModel(
      name: 'Paragliding',
      assetName: 'activity_5.jpeg',
    ),
    const ActivityModel(
      name: 'Sking',
      assetName: 'activity_6.jpeg',
    ),
    const ActivityModel(
      name: 'Campfire',
      assetName: 'activity_7.jpeg',
    ),
  ];
}
