import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Web UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'VictorMono',
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF24232A),
      body: Stack(
        children: [
          // Background pattern
          Positioned.fill(
            child: CustomPaint(
              painter: BackgroundPatternPainter(),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Container(
                width: screenSize.width < 600 ? screenSize.width * 0.9 : 420,
                margin: const EdgeInsets.symmetric(vertical: 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 30,
                      offset: Offset(0, 15),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: Stack(
                    children: [
                      // Background Image
                      Image.asset(
                        'assets/images/syam.jpg',
                        height: 550,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      // Overlay
                      Container(
                        height: 550,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              // Colors.orangeAccent.withOpacity(0.7),
                              // Colors.pinkAccent.withOpacity(0.7),
                              // Color(0xFFDF865D).withOpacity(0.7), // orange
                              // Color(0xFF9A5DD9).withOpacity(0.7), // purple
                              Color(0xFF0D324D).withOpacity(0.8), // navy gelap
                              Color(0xFF7F5A83).withOpacity(0.8), // ungu lembut
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                      ),
                      // Content
                      Padding(
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 60),
                            Text(
                              "Hi, I'm Syam\nBuilding connected digital solutions.",
                              style: TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                height: 1.2,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              '• Founder • Developer • Designer',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white70,
                                fontFamily: 'VictorMono',
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                              ),
                            ),
                            SizedBox(height: 32),
                            GestureDetector(
                              onTap: () {
                                html.window.open(
                                    'https://hexa-freedom.netlify.app',
                                    '_blank');
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(color: Colors.white),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Website',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    // Icon(Icons.email_outlined,
                                    //     color: Colors.white),
                                  ],
                                ),
                              ),
                            ),
                            // Container(
                            //   padding: EdgeInsets.symmetric(
                            //       vertical: 12, horizontal: 20),
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(30),
                            //     border: Border.all(color: Colors.white),
                            //   ),
                            //   child: Row(
                            //     mainAxisSize: MainAxisSize.min,
                            //     children: [
                            //       Text(
                            //         'Website',
                            //         style: TextStyle(
                            //           color: Colors.white,
                            //           fontSize: 16,
                            //         ),
                            //       ),
                            //       SizedBox(width: 10),
                            //       Icon(Icons.email_outlined,
                            //           color: Colors.white),
                            //     ],
                            //   ),
                            // ),
                            SizedBox(height: 10),

                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      backgroundColor: Color(0xFF2E2C36),
                                      content: Column(
                                        mainAxisSize:
                                            MainAxisSize.min, // <== KUNCI UTAMA
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '+601118872966',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'VictorMono',
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                          ),
                                          SizedBox(height: 16),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: TextButton.icon(
                                              onPressed: () {
                                                Clipboard.setData(ClipboardData(
                                                    text: '+601118872966'));
                                                Navigator.of(context).pop();
                                              },
                                              icon: Icon(Icons.copy,
                                                  color: Colors.white),
                                              label: Text('Copy',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(color: Colors.white),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Phone Numnber',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    // Icon(Icons.email_outlined,
                                    //     color: Colors.white),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            GestureDetector(
                              onTap: () {
                                // Gantikan dengan nombor kamu
                                const phoneNumber =
                                    '60123456789'; // contoh: 60 = Malaysia, 123456789 = nombor
                                final url = 'https://wa.me/$phoneNumber';
                                html.window.open(url, '_blank');
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(color: Colors.white),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Whatsapp Me',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    // FaIcon(
                                    //   FontAwesomeIcons.whatsapp,
                                    //   color: Colors.white,
                                    //   size: 30,
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Instagram (guna ikon kamera)
                GestureDetector(
                  onTap: () {
                    html.window.open('https://instagram.com/syam0x', '_blank');
                  },
                  child: Icon(Icons.camera_alt, color: Colors.white),
                ),
                SizedBox(width: 30),

                // Facebook
                GestureDetector(
                  onTap: () {
                    html.window
                        .open('https://facebook.com/Mesyamudin', '_blank');
                  },
                  child: Icon(Icons.facebook, color: Colors.white),
                ),
                SizedBox(width: 30),

                // Email (mailto)
                GestureDetector(
                  onTap: () {
                    html.window.open('mailto:mesyamuddin@gmail.com', '_blank');
                  },
                  child: Icon(Icons.mail, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.orange.withOpacity(0.05)
      ..strokeWidth = 1;

    const spacing = 50.0;

    for (double y = 0; y < size.height; y += spacing) {
      for (double x = 0; x < size.width; x += spacing) {
        canvas.drawLine(Offset(x - 5, y), Offset(x + 5, y), paint);
        canvas.drawLine(Offset(x, y - 5), Offset(x, y + 5), paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
