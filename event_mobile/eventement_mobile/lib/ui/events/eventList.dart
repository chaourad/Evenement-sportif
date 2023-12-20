import 'package:flutter/material.dart';

class Event {
  final String imageUrl;
  final String title;
  final String date;
  final int participants;

  Event({
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.participants,
  });
}

class VerticalEventListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Event> events = [
      Event(
        imageUrl: "assets/images/soccer.jpg",
        title: 'Événement 1',
        date: '2023-11-27',
        participants: 100,
      ),
      Event(
        imageUrl: "assets/images/soccer.jpg",
        title: 'Événement 2',
        date: '2023-11-28',
        participants: 75,
      ),
      // Ajoutez d'autres événements ici
    ];
    return SizedBox(
      height: 190, // Ajustez selon votre besoin
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: events.length,
        itemBuilder: (context, index) {
          return EventContainerList(event: events[index]);
        },
      ),
    );
  }
}

class EventContainerList extends StatelessWidget {
  final Event event;
  EventContainerList({required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Card(
        elevation: 0, // Supprimez l'ombre de la carte
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(10),
          leading: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(event.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            event.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Text(
                'Date: ${event.date}',
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 5),
              Text(
                'Participants: ${event.participants}',
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
          trailing: ElevatedButton(
            onPressed: () {
              // Action à effectuer lorsque le bouton est pressé
            },
            child: const Text(
              'Voir Détails',
            ),
            style: ElevatedButton.styleFrom(
              primary:
                  const Color.fromRGBO(85, 105, 254, 1.0), // Couleur du bouton
              onPrimary: Colors.white, // Couleur du texte
            ),
          ),
        ),
      ),
    );
  }
}
