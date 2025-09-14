class FoodSpot {
  final String id;
  final String title;
  final String location;
  final String videoUrl;
  final String thumbnailUrl;
  final double latitude;
  final double longitude;
  double distanceInKm;

  FoodSpot({
    required this.id,
    required this.title,
    required this.location,
    required this.videoUrl,
    required this.thumbnailUrl,
    required this.latitude,
    required this.longitude,
    this.distanceInKm = 0.0,
  });
}
