import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeData darkey = ThemeData(
      textTheme: const TextTheme(
        labelLarge: TextStyle(
          fontFamily: "Jura",
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        labelMedium: TextStyle(
          fontFamily: "Jura",
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Color(0xff14121a),
        ),
        labelSmall: TextStyle(
            fontFamily: "Jura",
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xff52525b)),
        bodySmall: TextStyle(
          fontFamily: "Jura",
          fontSize: 17,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        titleLarge: TextStyle(
          fontFamily: "Jura",
          fontSize: 24,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
      ),
      brightness: Brightness.dark,
      primaryColor: const Color(0xFFA5FEAE),
      scaffoldBackgroundColor: const Color(0xff14121a),
      cardColor: const Color(0xff24222a),
    );

    ThemeData lighty = ThemeData(
      textTheme: const TextTheme(
        labelLarge: TextStyle(
          fontFamily: "Jura",
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
        labelMedium: TextStyle(
          fontFamily: "Jura",
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Color(0xff14121a),
        ),
        labelSmall: TextStyle(
            fontFamily: "Jura",
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xff52525b)),
        bodySmall: TextStyle(
          fontFamily: "Jura",
          fontSize: 17,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
        titleLarge: TextStyle(
          fontFamily: "Jura",
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
      brightness: Brightness.light,
      primaryColor: const Color.fromARGB(255, 127, 255, 140),
      scaffoldBackgroundColor: const Color(0xffffffff),
      cardColor: const Color.fromARGB(255, 232, 254, 245),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lighty,
      darkTheme: darkey,
      home: const PasswordGen(),
    );
  }
}

class PasswordGen extends StatefulWidget {
  const PasswordGen({super.key});

  @override
  State<PasswordGen> createState() => _PasswordGenState();
}

String pass = '';
double length = 8;

class _PasswordGenState extends State<PasswordGen> {
  bool lowc = true;
  bool upc = false;
  bool digc = false;
  bool spcc = false;
  @override
  Widget build(BuildContext context) {
    void passGen(int length, bool low, bool up, bool dig, bool spc) {
      pass = '';
      const String lowercaseChars = 'abcdefghijklmnopqrstuvwxyz';
      const String uppercaseChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
      const String digitChars = '0123456789';
      const String specialChars = '!@#\$%^&*()-_=+[]{}|;:,.<>?';

      String allChars = '';
      if (low) allChars += lowercaseChars;
      if (up) allChars += uppercaseChars;
      if (dig) allChars += digitChars;
      if (spc) allChars += specialChars;
      Random random = Random();

      for (int i = 0; i < length; i++) {
        if (allChars.isEmpty) break;
        int randomIndex = random.nextInt(allChars.length);
        pass += allChars[randomIndex];
      }
      setState(() {});
    }

    final screenSize = MediaQuery.of(context).size;
    final isPortrait = screenSize.height > screenSize.width;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: screenSize.width * 0.06),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (!isPortrait)
                      const SizedBox(
                        height: 20,
                      ),
                    Text(
                      "Password Generator",
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Card(
                      color: Theme.of(context).cardColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: Text(
                                (pass == '') ? "P455W0RD" : pass,
                                style: (pass == '')
                                    ? Theme.of(context).textTheme.labelSmall
                                    : Theme.of(context).textTheme.labelLarge,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: GestureDetector(
                                onTap: () {
                                  Clipboard.setData(ClipboardData(text: pass));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('Password copied to clipboard'),
                                      duration: Duration(seconds: 3),
                                    ),
                                  );
                                },
                                child: Icon(
                                  Icons.content_copy,
                                  size: 40,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Card(
                        color: Theme.of(context).cardColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 25),
                                    child: Text(
                                      "Character Length",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Text(
                                      length.toInt().toString(),
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                              Slider(
                                  value: length,
                                  min: 0,
                                  max: 20,
                                  activeColor: Theme.of(context).primaryColor,
                                  inactiveColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  onChanged: (double val) {
                                    setState(() {
                                      length = val;
                                    });
                                  }),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Checkbox(
                                        activeColor: const Color(0xff24222a),
                                        value: lowc,
                                        onChanged: (bool? val) {
                                          setState(() {
                                            lowc = val!;
                                          });
                                        }),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 3),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            lowc = !lowc;
                                          });
                                        },
                                        child: Text(
                                          "Include Lowercase Letters",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Checkbox(
                                        activeColor: const Color(0xff24222a),
                                        value: upc,
                                        onChanged: (bool? val) {
                                          setState(() {
                                            upc = val!;
                                          });
                                        }),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 3),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            upc = !upc;
                                          });
                                        },
                                        child: Text(
                                          "Include Uppercase Letters",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Checkbox(
                                        activeColor: const Color(0xff24222a),
                                        value: digc,
                                        onChanged: (bool? val) {
                                          setState(() {
                                            digc = val!;
                                          });
                                        }),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 3),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            digc = !digc;
                                          });
                                        },
                                        child: Text(
                                          "Include Numbers",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Checkbox(
                                        activeColor: const Color(0xff24222a),
                                        value: spcc,
                                        onChanged: (bool? val) {
                                          setState(() {
                                            spcc = val!;
                                          });
                                        }),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 3),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            spcc = !spcc;
                                          });
                                        },
                                        child: Text(
                                          "Include Special Characters",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: MaterialButton(
                                  elevation: 5,
                                  onPressed: () {
                                    passGen(
                                        length.toInt(), lowc, upc, digc, spcc);
                                  },
                                  color: Theme.of(context).primaryColor,
                                  minWidth: screenSize.width * 0.7,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text(
                                      "GENERATE",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: screenSize.height * 0.08),
                      child: const Text(
                        "Made with ❤️ by ISE Student",
                        style: TextStyle(
                          fontFamily: "Jura",
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    if (!isPortrait)
                      const SizedBox(
                        height: 20,
                      ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
