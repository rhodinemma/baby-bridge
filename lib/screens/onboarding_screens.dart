import 'package:baby_bridge/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({Key? key}) : super(key: key);

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  final List<ContentConfig> _listContentConfig = [];

  @override
  void initState() {
    super.initState();

    // add content for the first slide
    _listContentConfig.add(
      ContentConfig(
        centerWidget: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: const Image(
            image: AssetImage('lib/images/mom.jpg'),
            height: 300,
            width: 300,
          ),
        ),
        title: "Welcome to Baby Bridge",
        description:
        "Bridging the gap to parenthood, with surrogacy",
        styleDescription: const TextStyle(
          color: Colors.white,
          fontSize: 22.0,
        ),
        backgroundColor: const Color(0xFF2E3840),
      ),
    );
    // add content for the second slide
    _listContentConfig.add(
      const ContentConfig(
        centerWidget: Image(
          image: AssetImage('lib/images/pregnantLadies.jpg'),
          height: 300,
          width: 300,
        ),
        title: "A journey of love and hope",
        styleTitle: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        description:
        "Creating families, one baby at a time",
        styleDescription: TextStyle(
          color: Colors.black,
          fontSize: 22.0,
        ),
        backgroundColor: Color(0xFFE4DCCF),
      ),
    );
    // add content for the third slide
    _listContentConfig.add(
       ContentConfig(
        centerWidget: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: const Image(
            image: AssetImage('lib/images/pregnantLadyWithDoctor.jpg'),
            height: 300,
            width: 300,
          ),
        ),
        title: "Get support and guidance",
        styleTitle: const TextStyle(
          color: Colors.black,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        description: "....throughout the surrogacy journey.",
        styleDescription: const TextStyle(
          color: Colors.black,
          fontSize: 22.0,
        ),
         backgroundColor: const Color(0xFFFFBF9B),
      ),
    );
  }

  // This function will be called when the user press the "done" button
  // in the last slide
  void _onDonePress() {
    debugPrint('Done Pressed');
    // Navigate to home screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      skipButtonStyle: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        foregroundColor: MaterialStateProperty.all(Colors.black),
      ),
      nextButtonStyle: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        foregroundColor: MaterialStateProperty.all(Colors.black),
      ),
      doneButtonStyle: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        foregroundColor: MaterialStateProperty.all(Colors.black),
      ),
      key: UniqueKey(),
      listContentConfig: _listContentConfig,
      onDonePress: _onDonePress,
    );
  }
}
