import 'package:food_reels/models/food_spot_model.dart';

class FoodDataService {
  List<FoodSpot> getDummyFoodSpots() {
   

    // Using a location near Erandol, India, as per the current location context.
    
    const double baseLat = 20.9250;
    const double baseLon = 75.1250;

    return [
      FoodSpot(
        id: '1',
        title: 'Spicy Pani Puri',
        location: 'Erandol Chaat House',
        videoUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
        thumbnailUrl: 'https://via.assets.so/img.jpg?w=1200&h=630&shape=circle&gradientFrom=ff0000&gradientTo=ff7f00&gradientAngle=135&text=Paani+Puri&fontSize=100&fontColor=ffffff&f=png',
        latitude: 20.921826,
        longitude: 75.338687,
      ),
      FoodSpot(
        id: '2',
        title: 'Butter Chicken Masala',
        location: 'The Punjabi Rasoi',
        videoUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
        thumbnailUrl: 'https://via.assets.so/img.jpg?w=1200&h=630&shape=circle&gradientFrom=ff0000&gradientTo=ff7f00&gradientAngle=135&text=Chicken&fontSize=100&fontColor=ffffff&f=png',
        latitude: 20.9215017,
        longitude: 75.3367898,
      ),
      FoodSpot(
        id: '3',
        title: 'Mouthwatering Dosa',
        location: 'South India Cafe',
        videoUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
        thumbnailUrl: 'https://via.assets.so/img.jpg?w=1200&h=630&shape=circle&gradientFrom=ff0000&gradientTo=ff7f00&gradientAngle=135&text=Dosa&fontSize=100&fontColor=ffffff&f=png',
        latitude: 20.9194373,
        longitude: 75.3368032,
      ),
      FoodSpot(
        id: '4',
        title: 'Sizzling Samosas',
        location: 'Street Side Bites',
        videoUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
        thumbnailUrl: 'https://via.assets.so/img.jpg?w=1200&h=630&shape=circle&gradientFrom=ff0000&gradientTo=ff7f00&gradientAngle=135&text=Samosas&fontSize=100&fontColor=ffffff&f=png',
        latitude: 20.9178313,
        longitude: 75.3376186,
      ),
      // This is a spot intentionally far away to test the 10km filter
      FoodSpot(
        id: '5',
        title: 'Mumbai Vada Pav',
        location: 'Mumbai Fast Food',
        videoUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
        thumbnailUrl: 'https://via.assets.so/img.jpg?w=1200&h=630&shape=circle&gradientFrom=ff0000&gradientTo=ff7f00&gradientAngle=135&text=Vada+Paav&fontSize=100&fontColor=ffffff&f=png',
        latitude: 20.921156,
        longitude: 75.3345877,
      ),
    ];
  }
}
