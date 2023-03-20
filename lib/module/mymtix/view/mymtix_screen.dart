import 'package:clone_mtix/shared/utils/colors/colors_app.dart';
import 'package:clone_mtix/shared/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyMtixScreen extends StatelessWidget {
  const MyMtixScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Image.asset(
                  mtixLogo,
                )),
            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: "Handphone",
                prefixIcon: FaIcon(FontAwesomeIcons.mobileScreen),
              ),
            ),
            SizedBox(height: 5),
            TextField(
              keyboardType: TextInputType.number,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: "PIN/Password (6-digit number)",
                prefixIcon: FaIcon(FontAwesomeIcons.lock),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: ColorsApp.blueMtix),
                onPressed: () {},
                child: Text("Log In"),
              ),
            ),
            Text("Or"),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: ColorsApp.brownMtix),
                onPressed: () {},
                child: Text("Register m.tix"),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text("Forgot PIN/Password?",
                    style: TextStyle(
                      color: Colors.black54,
                      decoration: TextDecoration.underline,
                    )),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                  "Once you have received OTP Activation code through SMS,",
                  style: TextStyle(
                    color: Colors.black54,
                  )),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Please activate your M-Tix here",
                  style: TextStyle(
                    color: ColorsApp.orangeMtix,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
