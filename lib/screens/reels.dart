import 'package:flutter/material.dart';
import 'package:food_reels/models/food_spot_model.dart';
import 'package:food_reels/provider/food_provider.dart';
import 'package:food_reels/widgets/video_player.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';


class ReelsScreen extends StatefulWidget {
  const ReelsScreen({super.key});

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> with TickerProviderStateMixin {
  late PageController _pageController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodProvider>(
      builder: (context, foodProvider, child) {
        if (foodProvider.spots.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          itemCount: foodProvider.spots.length,
          onPageChanged: (index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
          itemBuilder: (context, index) {
            final FoodSpot spot = foodProvider.spots[index];
            return Stack(
              children: [
                // Video Player
                VideoPlayerWidget(
                  videoUrl: spot.videoUrl,
                  isMuted: false, // You could add a mute toggle here.
                  autoPlay: index == _currentPageIndex,
                ),

                // UI Overlay
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Reel Info
                      Row(
                        children: [
                          Icon(Icons.location_on_rounded, color: Colors.white.withOpacity(0.8), size: 18),
                          const SizedBox(width: 4),
                          Text(
                            spot.location,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        spot.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              offset: Offset(1.0, 1.0),
                              blurRadius: 3.0,
                              color: Color.fromARGB(150, 0, 0, 0),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Action Buttons
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                // TODO: Implement order action
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Craving and ordering...')),
                                );
                              },
                              icon: const Icon(Icons.restaurant_menu_rounded),
                              label: const Text('Crave & Order'),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.deepOrange,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 12),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          // Bookmark/Like Button
                          IconButton.filled(
                            onPressed: () {
                              foodProvider.toggleLike(spot.id);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    foodProvider.isLiked(spot.id) ? 'Added to cravings' : 'Removed from cravings',
                                  ),
                                ),
                              );
                            },
                            icon: Icon(
                              foodProvider.isLiked(spot.id)
                                  ? Icons.favorite_rounded
                                  : Icons.favorite_border_rounded,
                              color: foodProvider.isLiked(spot.id) ? Colors.redAccent : null,
                            ),
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.white,
                              fixedSize: const Size(50, 50),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
