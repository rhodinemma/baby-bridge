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
      const ContentConfig(
        centerWidget: Image(
          image: AssetImage('lib/images/mom.jpg'),
          height: 300,
          width: 300,
        ),
        title: "Welcome to Baby Bridge",
        description:
        "Bridging the gap to parenthood, with surrogacy",
        styleDescription: TextStyle(
          color: Colors.white,
          fontSize: 22.0,
        ),
        backgroundColor: Colors.teal,
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
        description:
        "Creating families, one baby at a time",
        styleDescription: TextStyle(
          color: Colors.white,
          fontSize: 22.0,
        ),
        backgroundColor: Colors.cyan,
      ),
    );
    // add content for the third slide
    _listContentConfig.add(
      const ContentConfig(
        centerWidget: Image(
          image: AssetImage('lib/images/pregnantLadyWithDoctor.jpg'),
          height: 300,
          width: 300,
        ),
        title: "Get support and guidance",
        description: "....throughout the surrogacy journey.",
        styleDescription: TextStyle(
          color: Colors.white,
          fontSize: 22.0,
        ),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }

  // This function will be called when the user press the "done" button
  // in the last slide
  void _onDonePress() {
    debugPrint('Done Pressed');
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
