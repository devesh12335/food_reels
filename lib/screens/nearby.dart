import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:food_reels/models/food_spot_model.dart';
import 'package:food_reels/provider/food_provider.dart';
import 'package:food_reels/provider/location_provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';


class NearbyScreen extends StatefulWidget {
  const NearbyScreen({super.key});

  @override
  State<NearbyScreen> createState() => _NearbyScreenState();
}

class _NearbyScreenState extends State<NearbyScreen> {
  bool _showMap = false;

  @override
  Widget build(BuildContext context) {
    return Consumer2<LocationProvider, FoodProvider>(
      builder: (context, locationProvider, foodProvider, child) {
        final Position? userLocation = locationProvider.currentPosition;
        final List<FoodSpot> nearbySpots = foodProvider.getNearbySpots(userLocation);
          
        return Scaffold(
          appBar: AppBar(
            title: const Text('Nearby Spots'),
            backgroundColor: Colors.deepOrange,
            foregroundColor: Colors.white,
            actions: [
              IconButton(
                icon: Icon(_showMap ? Icons.view_list_rounded : Icons.map_rounded),
                onPressed: () {
                  setState(() {
                    _showMap = !_showMap;
                  });
                },
              ),
            ],
          ),
          body: userLocation == null
              ? const Center(child: CircularProgressIndicator())
              : _showMap
                  ? NearbyMap(userLocation: userLocation, nearbySpots: nearbySpots)
                  : NearbyList(nearbySpots: nearbySpots),
        );
      },
    );
  }
}

class NearbyList extends StatelessWidget {
  final List<FoodSpot> nearbySpots;

  const NearbyList({super.key, required this.nearbySpots});

  @override
  Widget build(BuildContext context) {
    if (nearbySpots.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_off_rounded, size: 64, color: Colors.black26),
            SizedBox(height: 16),
            Text(
              'No food spots found within 10 km.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: nearbySpots.length,
      itemBuilder: (context, index) {
        final spot = nearbySpots[index];
        return Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    spot.thumbnailUrl,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.image_not_supported_rounded,
                      size: 80,
                      color: Colors.black26,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        spot.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        spot.location,
                        style: const TextStyle(color: Colors.black54),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${(spot.distanceInKm).toStringAsFixed(1)} km away',
                        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                IconButton.filled(
                  icon: const Icon(Icons.chevron_right_rounded),
                  onPressed: () {
                    // TODO: Implement navigation to details or map view.
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Details for ${spot.title}')),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class NearbyMap extends StatelessWidget {
  final Position userLocation;
  final List<FoodSpot> nearbySpots;

  const NearbyMap({super.key, required this.userLocation, required this.nearbySpots});

  @override
  Widget build(BuildContext context) {
    final List<Marker> markers = nearbySpots.map((spot) {
      return Marker(
        point: LatLng(spot.latitude, spot.longitude),
        width: 80,
        height: 80,
        child:Image.network(
            spot.thumbnailUrl,
            // Optional: Add a placeholder while the image is loading
            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
            // Optional: Add an error widget if the image fails to load
            errorBuilder: (context, error, stackTrace) {
              debugPrint("Image token Exception $error");
              return const Icon(
                Icons.error,
                color: Colors.red,
                size: 60,
              );
            },
          ),
      );
    }).toList();

    markers.add(
      Marker(
        point: LatLng(userLocation.latitude, userLocation.longitude),
        width: 80,
        height: 80,
        child: const Icon(Icons.my_location_rounded, size: 40, color: Colors.blue),
      ),
    );

    return FlutterMap(
      options: MapOptions(
        initialCenter: LatLng(userLocation.latitude, userLocation.longitude),
        initialZoom: 14,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://api.maptiler.com/maps/basic-v2/256/{z}/{x}/{y}.png?key=Uqp4et707r4LXLrpt3cU',
          userAgentPackageName: 'com.example.app',
        ),
        MarkerLayer(
          markers: markers,
        ),
      ],
    );
  }
}
