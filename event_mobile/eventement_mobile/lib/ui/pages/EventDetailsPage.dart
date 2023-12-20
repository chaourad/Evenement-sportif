import 'package:eventement_mobile/models/Event.dart';
import 'package:flutter/material.dart';

class EventDetailsPage extends StatelessWidget {
  final Event event;

  EventDetailsPage({required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Event Name: ${event.name}'),
            const SizedBox(height: 10),
            Text('Location: ${event.lieu}'),
            const SizedBox(height: 10),
            Text('Start Date: ${event.dateDebut.toLocal()}'),
            const SizedBox(height: 10),
            Text('Max Participants: ${event.maxParticipant}'),
            const SizedBox(height: 10),
            Text('Rules: ${event.regle}'),
            const SizedBox(height: 10),
            Text('Current Participants: ${event.nombreParticipantActuel}'),
            const SizedBox(height: 10),
            Text('Organizer ID: ${event.userId}'),
            const SizedBox(height: 10),
            Text('Participants:'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: event.participants.map((participant) {
                return Text(
                  '- ${participant['name']} (${participant['status']})',
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
