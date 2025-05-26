import 'package:flutter/material.dart';

import 'profile_page.dart';
class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();

  String selectedGender = 'Male';
  String selectedCountryCode = '+966';

  final Color background = const Color(0xFFEDE7F6);
  final Color container = const Color(0xFFD1C4E9);
  final Color buttonPurple = const Color(0xFF6A1B9A);
  final Color changePasswordColor = const Color(0xFFAA9BD1);

  bool isValidEmail(String email) {
    final regex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
    return regex.hasMatch(email);
  }


  bool isValidPhone(String phone) {
    if (selectedCountryCode == '+966' || selectedCountryCode == '+971') {
      return RegExp(r'^5\d{8}$').hasMatch(phone);
    } else if (selectedCountryCode == '+965') {
      return RegExp(r'^[569]\d{6}$').hasMatch(phone);
    } else if (selectedCountryCode == '+20') {
      return RegExp(r'^1[0125]\d{8}$').hasMatch(phone);
    } else if (selectedCountryCode == '+1') {
      return RegExp(r'^\d{10}$').hasMatch(phone);
    }
    return false;


}

  void saveProfile() {
    if (_formKey.currentState!.validate() && isValidPhone(phoneController.text)) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProfilePage()),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile saved successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please correct the errors')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: buttonPurple),
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                backgroundColor: background,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                title: Text('Do you want to save changes?', style: TextStyle(color: buttonPurple)),
                actionsAlignment: MainAxisAlignment.center,
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: saveProfile,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonPurple,
                          foregroundColor: changePasswordColor,
                        ),
                        child: const Text('Save'),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const ProfilePage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: changePasswordColor,
                          foregroundColor: buttonPurple,
                        ),
                        child: const Text('Discard'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
        centerTitle: true,
        title: Text('Edit Profile', style: TextStyle(color: buttonPurple)),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            top: 60,
            child: Container(
              decoration: BoxDecoration(
                color: container,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: container,
                          ),
                          child: Center(
                            child: Icon(Icons.person_outline, size: 40, color: buttonPurple),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 4,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: buttonPurple,
                            ),
                            child: const Icon(Icons.camera_alt, size: 16, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Edit Profile',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: buttonPurple)),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        buildInputField(label: 'First name', controller: firstNameController),
                        buildInputField(label: 'Last name', controller: lastNameController),
                        buildInputField(label: 'Username', controller: usernameController),
                        buildInputField(
                          label: 'Email',
                          controller: emailController,
                          validator: (value) {
                            if (!isValidEmail(value!)) return 'Email must be @gmail.com or @hotmail.com';
                            return null;
                          },
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                  color: container,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: buttonPurple),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: selectedCountryCode,
                                    icon: const Icon(Icons.arrow_drop_down),
                                    iconEnabledColor: buttonPurple,
                                    items: ['+966', '+971', '+965', '+20', '+1']
                                        .map((code) => DropdownMenuItem(
                                      value: code,
                                      child: Text(code, style: TextStyle(color: buttonPurple)),
                                    ))
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() => selectedCountryCode = value!);
                                    },
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: buildInputField(
                                label: 'Phone number',
                                controller: phoneController,
                                validator: (value) {
                                  if (!isValidPhone(value!)) return 'Invalid phone number for selected country';
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: buildInputField(label: 'Birthday', controller: birthdayController),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                decoration: BoxDecoration(
                                  color: container,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: buttonPurple),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: selectedGender,
                                    icon: const Icon(Icons.arrow_drop_down),
                                    iconEnabledColor: buttonPurple,
                                    items: ['Male', 'Female']
                                        .map((gender) => DropdownMenuItem(
                                      value: gender,
                                      child: Text(gender, style: TextStyle(color: buttonPurple)),
                                    ))
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() => selectedGender = value!);
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.lock_outline, color: container),
                          label: const Text('Change Password', style: TextStyle(fontSize: 16)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: changePasswordColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInputField({
    required String label,
    required TextEditingController controller,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: container,
          labelStyle: TextStyle(color: buttonPurple),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: buttonPurple),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: buttonPurple),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: buttonPurple, width: 2),
          ),
        ),
      ),
    );
  }
}
