import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:try_your_luck/components/text_field.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController controller = TextEditingController();
  int number = 0;
  Widget answer = Container();
  Widget text = Text(
    "?",
    style: GoogleFonts.mukta(
        fontSize: 130, color: Colors.white, fontWeight: FontWeight.bold),
  );
  void onSubmit() {
    var intValue = Random().nextInt(10) + 1;
    setState(() {
      text = Text(
        "Calculating...",
        style: GoogleFonts.mukta(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
      );
    });
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        text = Text(
          "$intValue",
          style: GoogleFonts.mukta(
              fontSize: 80, color: Colors.white, fontWeight: FontWeight.bold),
        );
      });
      if (int.parse(controller.text) == intValue) {
        answer = Text(
          "You are right!",
          style: GoogleFonts.mukta(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        );
      } else {
        answer = Text(
          "You are wrong!",
          style: GoogleFonts.mukta(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Try your luck",
          style: GoogleFonts.kanit(
            fontSize: 30,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            "Try to guess a number into 1 to 10",
            style: GoogleFonts.mukta(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      30,
                    ),
                    color: Colors.red,
                  ),
                  child: number == 0
                      ? Center(
                          child: text,
                        )
                      : Text("$number")),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 55.0),
            child: InputField(
              label: "Your try: ",
              hint: "1 to 10",
              controller: controller,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          MaterialButton(
            minWidth: 200,
            height: 50,
            onPressed: onSubmit,
            color: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            textColor: const Color.fromARGB(255, 247, 247, 247),
            child: Text(
              "Submit",
              style: GoogleFonts.mukta(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Result: ",
                style: GoogleFonts.mukta(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              answer,
            ],
          ),
        ],
      ),
    );
  }
}
