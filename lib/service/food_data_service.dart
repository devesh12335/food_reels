import 'package:food_reels/models/food_spot_model.dart';

class FoodDataService {
  List<FoodSpot> getDummyFoodSpots() {
    // This data is hardcoded for demonstration purposes.
    // In a real application, this would be fetched from a remote API.

    // Using a location near Erandol, India, as per the current location context.
    // The dummy data points are generated with small random offsets to simulate real-world locations.
    const double baseLat = 20.9250;
    const double baseLon = 75.1250;

    return [
      FoodSpot(
        id: '1',
        title: 'Spicy Pani Puri',
        location: 'Erandol Chaat House',
        videoUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
        thumbnailUrl: 'https://placehold.co/600x400/FF5722/FFFFFF?text=Pani+Puri',
        latitude: baseLat + 0.05,
        longitude: baseLon + 0.05,
      ),
      FoodSpot(
        id: '2',
        title: 'Butter Chicken Masala',
        location: 'The Punjabi Rasoi',
        videoUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
        thumbnailUrl: 'https://placehold.co/600x400/9C27B0/FFFFFF?text=Butter+Chicken',
        latitude: baseLat - 0.03,
        longitude: baseLon + 0.02,
      ),
      FoodSpot(
        id: '3',
        title: 'Mouthwatering Dosa',
        location: 'South India Cafe',
        videoUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
        thumbnailUrl: 'https://placehold.co/600x400/4CAF50/FFFFFF?text=Dosa',
        latitude: baseLat + 0.01,
        longitude: baseLon - 0.04,
      ),
      FoodSpot(
        id: '4',
        title: 'Sizzling Samosas',
        location: 'Street Side Bites',
        videoUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
        thumbnailUrl: 'https://placehold.co/600x400/2196F3/FFFFFF?text=Samosas',
        latitude: baseLat - 0.02,
        longitude: baseLon - 0.01,
      ),
      // This is a spot intentionally far away to test the 10km filter
      FoodSpot(
        id: '5',
        title: 'Mumbai Vada Pav',
        location: 'Mumbai Fast Food',
        videoUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
        thumbnailUrl: 'https://placehold.co/600x400/F44336/FFFFFF?text=Vada+Pav',
        latitude: baseLat + 0.2,
        longitude: baseLon + 0.2,
      ),
    ];
  }
}
