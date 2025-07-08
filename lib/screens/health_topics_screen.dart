// lib/screens/health_topics_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/audio_provider.dart';
import '../widgets/audio_button.dart';
import '../widgets/video_player_widget.dart';

class HealthTopicsScreen extends StatelessWidget {
  final List<HealthTopic> healthTopics = [
    HealthTopic(
      title: 'Occupational Safety',
      description: 'Learn about preventing injuries while working with smocks',
      icon: Icons.construction,
      color: Color(0xFFFF5722),
      videoUrl: 'assets/videos/occupational_safety.mp4',
    ),
    HealthTopic(
      title: 'Women\'s Health',
      description: 'Important health topics for women entrepreneurs',
      icon: Icons.female,
      color: Color(0xFFE91E63),
      videoUrl: 'assets/videos/womens_health.mp4',
    ),
    HealthTopic(
      title: 'Mental Wellness',
      description: 'Managing stress and maintaining mental health',
      icon: Icons.psychology,
      color: Color(0xFF9C27B0),
      videoUrl: 'assets/videos/mental_wellness.mp4',
    ),
    HealthTopic(
      title: 'Nutrition',
      description: 'Healthy eating for busy entrepreneurs',
      icon: Icons.restaurant,
      color: Color(0xFF4CAF50),
      videoUrl: 'assets/videos/nutrition.mp4',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health Topics'),
        backgroundColor: Color(0xFFE91E63),
        foregroundColor: Colors.white,
        actions: [
          AudioButton(
            onPressed: () {
              context.read<AudioProvider>().speak(
                  "Health topics for smock entrepreneurs. Choose a topic to learn more."
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: healthTopics.length,
        itemBuilder: (context, index) {
          final topic = healthTopics[index];
          return _buildTopicCard(context, topic);
        },
      ),
    );
  }

  Widget _buildTopicCard(BuildContext context, HealthTopic topic) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          _showTopicDetails(context, topic);
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                topic.color.withOpacity(0.1),
                topic.color.withOpacity(0.05),
              ],
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: topic.color,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  topic.icon,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      topic.title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      topic.description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: topic.color,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showTopicDetails(BuildContext context, HealthTopic topic) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: topic.color,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    topic.icon,
                    color: Colors.white,
                    size: 32,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      topic.title,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  AudioButton(
                    onPressed: () {
                      context.read<AudioProvider>().speak(
                          "${topic.title}. ${topic.description}"
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      topic.description,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: VideoPlayerWidget(videoUrl: topic.videoUrl),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Key Points:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 10),
                    ...topic.keyPoints.map((point) => Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: topic.color,
                            size: 20,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              point,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HealthTopic {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final String videoUrl;
  final List<String> keyPoints;

  HealthTopic({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.videoUrl,
    this.keyPoints = const [],
  });
}