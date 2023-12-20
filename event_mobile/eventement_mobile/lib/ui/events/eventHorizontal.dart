import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Event {
  final String imageUrl;
  final String title;
  final String creatorName;
  final String creatorImageUrl;
  final int participantCount;

  Event(this.imageUrl, this.title, this.creatorName, this.creatorImageUrl,
      this.participantCount);
}

class HorizontalEventListView extends StatelessWidget {
  Future<List<Map<String, dynamic>>> fetchData() async {
    final response = await http.get(
      Uri.parse('http://192.168.56.104:5041/api/EventContoller/All'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      print(response.body);
      return List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Failed to load data');
    }
  }

  final List<Event> events = [
    Event("assets/images/soccer.jpg", "Event 1", "Creator 1",
        "assets/images/creator1.jpg", 120),
    Event("assets/images/soccer.jpg", "Event 2", "Creator 2",
        "assets/images/creator2.jpg", 85),
    // Ajoutez plus d'événements ici
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350, // Ajustez selon votre besoin
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: events.length,
        itemBuilder: (context, index) {
          return EventContainer(event: events[index]);
        },
      ),
    );
  }
}

class EventContainer extends StatelessWidget {
  final Event event;

  EventContainer({required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      // height: 100, // Ajustez la hauteur totale ici
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              event.imageUrl,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(event.creatorImageUrl),
                      radius: 15,
                    ),
                    const SizedBox(width: 8),
                    Text(event.creatorName),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.people),
                    Text('${event.participantCount} Participants'),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        // Navigation vers la page de détails de l'événement
                      },
                      child: const Text("Voir Détails"),
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(
                            85, 105, 254, 1.0), // Couleur du bouton
                        onPrimary: Colors.white, // Couleur du texte
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
