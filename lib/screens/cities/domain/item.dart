class CityItem {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final int attractionsCount;

  CityItem(
      {required this.name,
      required this.description,
      required this.imageUrl,
      required this.id,
      required this.attractionsCount});
}
