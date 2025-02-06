import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? userData = FirebaseAuth.instance.currentUser;

  void _refreshPage() {
    setState(() {
      userData = FirebaseAuth.instance.currentUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFFF3E5F5),
        ),
        title: Text(
          "Profile",
          style: TextStyle(color: Color(0xFFF3E5F5)),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 60, 11, 128),
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // Profile Section
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: const Color.fromARGB(255, 39, 198, 204),
                    child: userData == null
                        ? const Icon(Icons.person,
                            size: 40, color: Colors.white)
                        : Text(
                            userData!.email![0].toUpperCase(),
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    userData?.email != null ? "UserName" : "Guest",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
            const Divider(),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Settings",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            userData == null
                ? ListTile(
                    title: const Text("Login"),
                    leading: const Icon(Icons.login, color: Colors.blueAccent),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('login')
                          .then((_) => _refreshPage());
                    },
                  )
                : ListTile(
                    title: Text(userData!.email!),
                    leading: const Icon(Icons.email_outlined,
                        color: Colors.blueAccent),
                  ),

            userData == null
                ? ListTile(
                    title: const Text("Register"),
                    leading: const Icon(Icons.app_registration,
                        color: Colors.blueAccent),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('register')
                          .then((_) => _refreshPage());
                    },
                  )
                : ListTile(
                    title: const Text("Logout"),
                    leading: const Icon(Icons.logout, color: Colors.redAccent),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title:
                              const Text("Are you sure you want to log out?"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text("Cancel"),
                            ),
                            OutlinedButton(
                              onPressed: () async {
                                await FirebaseAuth.instance.signOut();
                                _refreshPage();
                                Navigator.of(context).pop();
                              },
                              child: const Text("Yes, Logout"),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
