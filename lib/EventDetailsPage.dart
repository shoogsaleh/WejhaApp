import 'package:flutter/material.dart';

class EventDetailsPage extends StatelessWidget {
  final Map<String, String> event;

  const EventDetailsPage({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F0FB),
      body: SafeArea(
        child: Column(
          children: [
            // صورة الحدث
            ClipRRect(
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
              child: Image.network(
                event['imageUrl'] ??
                    'https://images.ctfassets.net/vy53kjqs34an/744comOZgzZR956FHHezkj/1b2327913f0cfb682e4d5ff5aec5e0d7/KV-Webook-Sizes_1920x1280.jpg?fm=webp&w=1920&h=1280',
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    height: 250,
                    width: double.infinity,
                    color: Colors.grey.shade300,
                    child: const Center(child: CircularProgressIndicator()),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 250,
                    width: double.infinity,
                    color: Colors.grey.shade300,
                    child: const Icon(Icons.broken_image, size: 64, color: Colors.grey),
                  );
                },
              ),
            ),

            // تفاصيل الحدث
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event['title'] ?? 'No Title',
                    style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                  ),
                  const SizedBox(height: 8),

                  // أزرار تفاعلية
                  Row(
                    children: [
                      _buildOutlinedButton("Add to Favourites"),
                      const SizedBox(width: 10),
                      _buildOutlinedButton("12 mins from hotel"),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // وصف الحدث
                  Text(
                    event['description'] ??
                        "Enjoy a night of cultural experiences at Boulevard World, featuring global cuisines, live performances, and immersive attractions.",
                    style: const TextStyle(fontSize: 14, height: 1.4),
                  ),
                  const SizedBox(height: 20),

                  // الموقع والتاريخ والوقت
                  _buildDetailRow(Icons.location_on_outlined, event['location'] ?? 'Unknown location'),
                  _buildDetailRow(Icons.calendar_month_outlined, event['date'] ?? 'No date'),
                  _buildDetailRow(Icons.access_time_filled_rounded, event['time'] ?? 'No time'),
                ],
              ),
            ),

            const Spacer(),

            // زر الحجز
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 12),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/ticket_booking');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple.shade300,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text("Book Now", style: TextStyle(fontSize: 16)),
                ),
              ),
            ),
          ],
        ),
      ),

      // شريط التنقل السفلي
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.deepPurple,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.confirmation_num), label: "Tickets"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Favourites"),
        ],
      ),
    );
  }

  // عنصر صف التفاصيل (مثل الوقت والموقع)
  Widget _buildDetailRow(IconData icon, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.deepPurple),
        const SizedBox(width: 8),
        Expanded(child: Text(value)),
      ],
    );
  }

  // زر جانبي بسيط
  Widget _buildOutlinedButton(String label) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(label, style: const TextStyle(fontSize: 13)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
