// lib/models/health_content.dart
class HealthContent {
  final String id;
  final String title;
  final String description;
  final String category;
  final String videoUrl;
  final String audioUrl;
  final List<String> keyPoints;
  final List<String> tips;
  final bool isOfflineAvailable;

  HealthContent({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.videoUrl,
    required this.audioUrl,
    required this.keyPoints,
    required this.tips,
    this.isOfflineAvailable = false,
  });

  factory HealthContent.fromJson(Map<String, dynamic> json) {
    return HealthContent(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      videoUrl: json['videoUrl'],
      audioUrl: json['audioUrl'],
      keyPoints: List<String>.from(json['keyPoints']),
      tips: List<String>.from(json['tips']),
      isOfflineAvailable: json['isOfflineAvailable'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'videoUrl': videoUrl,
      'audioUrl': audioUrl,
      'keyPoints': keyPoints,
      'tips': tips,
      'isOfflineAvailable': isOfflineAvailable,
    };
  }
}