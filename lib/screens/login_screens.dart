import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF18151C),
      body: Column(
          children: [
            // Top image/banner
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.32,
              child: Image.network(
                'https://images.unsplash.com/photo-1464983953574-0892a716854b?auto=format&fit=crop&w=800&q=80',
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 24),
                      // const SizedBox(height: 12),
                      const Text(
                        'Welcome to Zentra',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      // Email field
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFF23202A),
                          hintText: 'Email',
                          hintStyle: const TextStyle(color: Colors.white54, fontFamily: 'Montserrat'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
                        ),
                        style: const TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 18),
                      // Phone field
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFF23202A),
                          hintText: 'Phone Number',
                          hintStyle: const TextStyle(color: Colors.white54, fontFamily: 'Montserrat'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
                        ),
                        style: const TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 28),
                      // Continue with Email
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFD6C7F7),
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                            elevation: 0,
                          ),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (_) => const HomeScreen()),
                            );
                          },
                          child: const Text(
                            'Continue with Email',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      // Continue with Phone
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF23202A),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                            elevation: 0,
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Continue with Phone',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      // Continue with SearchEngineCo
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF23202A),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                            elevation: 0,
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Continue with SearchEngineCo',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 28),
                      // Terms and privacy
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'By continuing, you agree to our Terms of Service and Privacy Policy.',
                          style: TextStyle(
                            color: Colors.white54,
                            fontFamily: 'Montserrat',
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 18),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}
