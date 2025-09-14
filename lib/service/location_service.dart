import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationService {
  Future<Position> determinePosition() async {
    // Request location permissions if not granted
    PermissionStatus permissionStatus = await Permission.location.request();
    if (permissionStatus.isDenied) {
      return Future.error('Location permissions are denied.');
    }
    if (permissionStatus.isPermanentlyDenied) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    // Get the current position
    return await Geolocator.getCurrentPosition();
  }
}
