import 'package:flutter/material.dart';
import 'EventDetailsPage.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> cities = [
    {'title': 'Riyadh', 'image': 'assets/images/riyadh.jpg'},
    {'title': 'Jeddah', 'image': 'assets/images/jeddah.jpg'},
    {'title': 'AlAula', 'image': 'assets/images/alaula.jpg'},
    {'title': 'AlDahran', 'image': 'assets/images/aldahran.jpg'},
  ];

  final List<Map<String, String>> events = [
    {
      'title': 'Boulevard World',
      'image': 'assets/images/boulevard.jpg',
      'location': 'North of Riyadh',
      'date': '25 Nov - 25 Feb',
      'time': '4:00 PM - 12:00 AM'
    },
    {
      'title': 'The Groves',
      'image': 'assets/images/groves.jpg',
      'location': 'North of Riyadh',
      'date': '1 Dec - 15 Feb',
      'time': '3:00 PM - 11:00 PM'
    },
    {
      'title': 'Comedy Night',
      'image': 'assets/images/comedy.jpg',
      'location': 'Downtown Theater',
      'date': '10 Jan',
      'time': '8:00 PM - 10:00 PM'
    },
    {
      'title': 'Angham Night',
      'image': 'assets/images/angham.jpg',
      'location': 'Music Hall - Riyadh',
      'date': '5 March',
      'time': '9:00 PM - 12:00 AM'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F0FB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline, color: Colors.deepPurple, size: 28),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: Text(
                'Welcome,\nNouf',
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // 🔹 Cities Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Cities",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/all_events');
                  },
                  child: const Text(
                    "Show All",
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 120,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: cities.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          cities[index]['image']!,
                          width: 110,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(cities[index]['title']!),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 24),

            // 🔹 Events Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Events",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/tickets');
                  },
                  child: const Text(
                    "My Tickets",
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 170,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: events.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EventDetailsPage(event: events[index]),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            events[index]['image']!,
                            width: 140,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(events[index]['title']!),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // 🔹 Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.deepPurple,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.confirmation_num), label: "Tickets"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Favourites"),
        ],
      ),
    );
  }
}
