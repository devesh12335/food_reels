import 'package:flutter/material.dart';
import 'package:food_reels/service/location_service.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider with ChangeNotifier {
  final LocationService _locationService = LocationService();
  Position? _currentPosition;
  bool _isLoading = false;

  Position? get currentPosition => _currentPosition;
  bool get hasLocation => _currentPosition != null;
  bool get isLoading => _isLoading;

  Future<void> getCurrentLocation() async {
    _isLoading = true;
    notifyListeners();

    try {
      _currentPosition = await _locationService.determinePosition();
    } catch (e) {
     
      debugPrint('Error getting location: $e');
      _currentPosition = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
