// lib/services/health_service.dart
import '../models/health_content.dart';

class HealthService {
  static List<HealthContent> getHealthContent() {
    return [
      HealthContent(
        id: '1',
        title: 'Preventing Back Pain',
        description: 'Learn proper posture and techniques to prevent back pain while working with smocks.',
        category: 'Occupational Safety',
        videoUrl: 'assets/videos/back_pain_prevention.mp4',
        audioUrl: 'assets/audio/back_pain_prevention.mp3',
        keyPoints: [
          'Maintain proper posture while sitting',
          'Take regular breaks to stretch',
          'Use ergonomic tools and furniture',
          'Strengthen your core muscles',
        ],
        tips: [
          'Set a timer to remind yourself to take breaks',
          'Do simple stretches every hour',
          'Keep your work surface at the right height',
        ],
        isOfflineAvailable: true,
      ),
      HealthContent(
        id: '2',
        title: 'Eye Care for Seamstresses',
        description: 'Protect your eyes while doing detailed work on smocks.',
        category: 'Occupational Safety',
        videoUrl: 'assets/videos/eye_care.mp4',
        audioUrl: 'assets/audio/eye_care.mp3',
        keyPoints: [
          'Ensure adequate lighting',
          'Follow the 20-20-20 rule',
          'Use proper glasses if needed',
          'Keep your workspace clean',
        ],
        tips: [
          'Look at something 20 feet away for 20 seconds every 20 minutes',
          'Use natural light when possible',
          'Clean your workspace regularly',
        ],
        isOfflineAvailable: true,
      ),
      HealthContent(
        id: '3',
        title: 'Reproductive Health',
        description: 'Important information about reproductive health for women entrepreneurs.',
        category: 'Women\'s Health',
        videoUrl: 'assets/videos/reproductive_health.mp4',
        audioUrl: 'assets/audio/reproductive_health.mp3',
        keyPoints: [
          'Regular health check-ups are important',
          'Maintain good hygiene practices',
          'Know the signs of health issues',
          'Seek professional help when needed',
        ],
        tips: [
          'Schedule regular visits to healthcare providers',
          'Keep track of your menstrual cycle',
          'Don\'t ignore unusual symptoms',
        ],
        isOfflineAvailable: true,
      ),
    ];
  }

  static List<HealthContent> getContentByCategory(String category) {
    return getHealthContent()
        .where((content) => content.category == category)
        .toList();
  }

  static HealthContent? getContentById(String id) {
    try {
      return getHealthContent().firstWhere((content) => content.id == id);
    } catch (e) {
      return null;
    }
  }
}