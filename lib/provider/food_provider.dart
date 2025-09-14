import 'package:flutter/material.dart';
import 'package:food_reels/models/food_spot_model.dart';
import 'package:food_reels/service/food_data_service.dart';
import 'package:geolocator/geolocator.dart';


class FoodProvider with ChangeNotifier {
  final FoodDataService _foodDataService = FoodDataService();
  List<FoodSpot> _spots = [];
  final Set<String> _likedSpotIds = {};

  List<FoodSpot> get spots => _spots;
  Set<String> get likedSpotIds => _likedSpotIds;

  void fetchFoodSpots() {
    _spots = _foodDataService.getDummyFoodSpots();
    notifyListeners();
  }

  void toggleLike(String spotId) {
    if (_likedSpotIds.contains(spotId)) {
      _likedSpotIds.remove(spotId);
    } else {
      _likedSpotIds.add(spotId);
    }
    notifyListeners();
  }

  bool isLiked(String spotId) {
    return _likedSpotIds.contains(spotId);
  }

  List<FoodSpot> getNearbySpots(Position? userLocation) {
    if (userLocation == null) {
      return [];
    }

    List<FoodSpot> nearbyList = List.of(_spots);

    // Calculate distance for each spot and filter.
    for (var spot in nearbyList) {
      spot.distanceInKm = Geolocator.distanceBetween(
            userLocation.latitude,
            userLocation.longitude,
            spot.latitude,
            spot.longitude,
          ) /
          1000;
    }

    // Filter by 10 km radius and sort by distance
    return nearbyList.where((spot) => spot.distanceInKm <= 10).toList()
      ..sort((a, b) => a.distanceInKm.compareTo(b.distanceInKm));
  }
}
