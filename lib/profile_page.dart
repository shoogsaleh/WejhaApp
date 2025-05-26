import 'package:flutter/material.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color lightPurple = const Color(0xFFEDE7F6);
    final Color buttonPurple = const Color(0xFF6A1B9A);
    final Color iconPurple = const Color(0xFF7B1FA2);
    final Color avatarCircleColor = const Color(0xFFEADDFF);

    return Scaffold(
      backgroundColor: lightPurple,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: iconPurple),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Center(
                    child: Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: iconPurple,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Avatar
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: avatarCircleColor,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.person_outline,
                        size: 40,
                        color: iconPurple,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User name',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: iconPurple,
                          ),
                        ),
                        Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 14,
                            color: iconPurple,
                          ),
                        ),
                      ],
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const EditProfilePage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: avatarCircleColor,
                      foregroundColor: iconPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 8),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Edit profile',
                      style: TextStyle(
                          fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),
              profileItem(Icons.chat, 'Plan with AI', iconPurple),
              profileItem(Icons.language, 'Language', iconPurple),

              const Divider(height: 30, thickness: 1, color: Colors.grey),

              profileItem(
                  Icons.account_balance_wallet, 'Digital Wallet', iconPurple),
              profileToggleItem(
                  Icons.notifications, 'Notifications', iconPurple),
              profileToggleItem(Icons.dark_mode, 'Dark mode', iconPurple),

              const Divider(height: 30, thickness: 1, color: Colors.grey),

              profileItemImage('assets/images/log.png', 'About Us', iconPurple),
              profileItem(Icons.help, 'Support', iconPurple),
              profileItem(Icons.logout, 'Log Out', iconPurple),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileItem(IconData icon, String title, Color iconColor) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: iconColor),
      title: Text(title, style: TextStyle(fontSize: 16, color: iconColor)),
      trailing: const Icon(Icons.chevron_right),
    );
  }

  Widget profileItemImage(String imagePath, String title, Color textColor) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Image.asset(imagePath, width: 24, height: 24),
      title: Text(title, style: TextStyle(fontSize: 16, color: textColor)),
      trailing: const Icon(Icons.chevron_right),
    );
  }

  Widget profileToggleItem(IconData icon, String title, Color iconColor) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: iconColor),
      title: Text(title, style: TextStyle(fontSize: 16, color: iconColor)),
      trailing: Switch(value: true, onChanged: (_) {}),
    );
  }

  
}