class Event {
  final String id;
  final String name;
  final String lieu;
  final String imageUrl;
  final DateTime dateDebut;
  final int maxParticipant;
  final String regle;
  final int nombreParticipantActuel;
  final String userId;
  final List<Map<String, dynamic>> participants;
  static const String defaultImageUrl = 'assets/images/soccer.jpg';

  Event({
    required this.id,
    required this.name,
    required this.lieu,
    required this.imageUrl,
    required this.dateDebut,
    required this.maxParticipant,
    required this.regle,
    required this.nombreParticipantActuel,
    required this.userId,
    required this.participants,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      name: json['name'],
      lieu: json['lieu'],
      imageUrl: json['imageUrl'] ?? defaultImageUrl,
      dateDebut: DateTime.parse(json['dateDebut']),
      maxParticipant: json['maxParticipant'],
      regle: json['regle'],
      nombreParticipantActuel: json['nombreParticipantActuel'],
      userId: json['userId'],
      participants: List<Map<String, dynamic>>.from(json['participants']),
    );
  }
}
