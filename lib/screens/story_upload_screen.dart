import 'package:flutter/material.dart';
import 'package:demo_check/theme/app_theme.dart';

class StoryUploadScreen extends StatefulWidget {
  const StoryUploadScreen({Key? key}) : super(key: key);

  @override
  State<StoryUploadScreen> createState() => _StoryUploadScreenState();
}

class _StoryUploadScreenState extends State<StoryUploadScreen> {
  bool _isVideo = false;
  String? _selectedMedia;
  final List<String> _dummyMedia = [
    'https://picsum.photos/400/800?random=10',
    'https://picsum.photos/400/800?random=11',
    'https://picsum.photos/400/800?random=12',
    'https://picsum.photos/400/800?random=13',
  ];

  @override
  void initState() {
    super.initState();
    _selectedMedia = _dummyMedia.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Story',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Story uploaded successfully!')),
              );
            },
            child: const Text(
              'Share',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryColor,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Media preview area
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Media preview
                _selectedMedia != null
                    ? Image.network(
                        _selectedMedia!,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        color: Colors.black,
                        child: const Center(
                          child: Text(
                            'No media selected',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),

                // Video indicator
                if (_isVideo)
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.videocam, color: Colors.white, size: 16),
                          SizedBox(width: 4),
                          Text(
                            '0:15',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),

                // Controls overlay
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text input
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Add a caption...',
                            hintStyle: const TextStyle(color: Colors.white70),
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              Icons.text_fields,
                              color: Colors.white,
                            ),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.emoji_emotions_outlined,
                                  color: Colors.white),
                              onPressed: () {},
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),

                        const SizedBox(height: 16),

                        // Media controls
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildControlButton(
                              icon: Icons.music_note,
                              label: 'Music',
                              onTap: () {},
                            ),
                            _buildControlButton(
                              icon: Icons.brush,
                              label: 'Draw',
                              onTap: () {},
                            ),
                            _buildControlButton(
                              icon: Icons.text_fields,
                              label: 'Text',
                              onTap: () {},
                            ),
                            _buildControlButton(
                              icon: Icons.filter,
                              label: 'Effects',
                              onTap: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Media selector
          Container(
            height: 100,
            color: Theme.of(context).cardColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 8),
                  child: Text(
                    'Gallery',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _dummyMedia.length + 1, // +1 for camera button
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Camera would open here')),
                              );
                            },
                            child: Container(
                              width: 70,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.camera_alt,
                                size: 32,
                              ),
                            ),
                          ),
                        );
                      }

                      final mediaUrl = _dummyMedia[index - 1];
                      final isSelected = mediaUrl == _selectedMedia;

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedMedia = mediaUrl;
                              _isVideo = index % 2 ==
                                  0; // Alternate between image and video for demo
                            });
                          },
                          child: Container(
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: isSelected
                                  ? Border.all(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      width: 3,
                                    )
                                  : null,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.network(
                                    mediaUrl,
                                    fit: BoxFit.cover,
                                  ),
                                  if (index % 2 ==
                                      0) // Show video icon on alternating items
                                    Positioned(
                                      top: 4,
                                      right: 4,
                                      child: Container(
                                        padding: const EdgeInsets.all(2),
                                        decoration: const BoxDecoration(
                                          color: Colors.black54,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(
                                          Icons.play_arrow,
                                          color: Colors.white,
                                          size: 12,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
