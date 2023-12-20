import 'package:eventement_mobile/ui/events/eventList.dart';
import 'package:eventement_mobile/ui/events/eventHorizontal.dart';
import 'package:eventement_mobile/ui/type/typeContainer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 150,
              width: 1000,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                  color: Color.fromRGBO(85, 105, 254, 1.0),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Hello, Emma 👋🏻",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(85, 105, 254, 1.0),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.all(12),
                            child: const Icon(
                              Icons.notifications,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      const TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                          hintStyle: TextStyle(
                              color: Colors.white), // Set hint text color
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          fillColor: Color.fromRGBO(85, 105, 254, 1.0),
                          filled: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Liste de types de sport
            const SizedBox(
              height: 70,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Types Events",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),

            TypeListView(), // Ajoutez d'autres types de sport ici

            SizedBox(
              height: 70,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Trending Events",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Action à effectuer lorsque l'utilisateur clique sur le texte "See all"
                        // Par exemple, vous pouvez naviguer vers une autre page ou effectuer une autre action.
                        // Remplacez cette ligne par le code de votre action souhaitée.
                        print(
                            "See all clicked!"); // Exemple : afficher un message dans la console
                      },
                      child: Container(
                        child: const Row(
                          children: [
                            Text(
                              "See all",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            HorizontalEventListView(),
            SizedBox(
              height: 70,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "All Events",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Action à effectuer lorsque l'utilisateur clique sur le texte "See all"
                        // Par exemple, vous pouvez naviguer vers une autre page ou effectuer une autre action.
                        // Remplacez cette ligne par le code de votre action souhaitée.

                        // AllType();
                        print(
                            "See all clicked!"); // Exemple : afficher un message dans la console
                      },
                      child: Container(
                        child: const Row(
                          children: [
                            Text(
                              "See all",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            //
            // EventContainerList()
            VerticalEventListView(),
          ],
        ),
      ),
    );
  }
}
