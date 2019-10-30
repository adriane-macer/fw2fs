import 'package:flutter/material.dart';
import 'package:fw2fw/pages/home_page.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:intro_slider/dot_animation_enum.dart';

class Intro extends StatefulWidget {
  Intro({Key key}) : super(key: key);

  @override
  IntroState createState() => new IntroState();
}

class IntroState extends State<Intro> {
  List<Slide> slides = new List();
  Function goToTab;

  @override
  void initState() {
    super.initState();
    slides.add(
      new Slide(
        title: "Agreeculture App",
        styleTitle: TextStyle(
          color: Colors.blue,
          fontSize: 24.0,
        ),
        description: "Ask advice on planting crops or tell people about your harvest",
        styleDescription: TextStyle(
          fontSize: 18.0,
        ),
//        pathImage: "assets/f2f.png",
      ),
    );
  }

  void onDonePress() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  void onTabChangeCompleted(index) {
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Colors.blue,
      // (0xffffcc5c),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Colors.green,
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Colors.brown,
    );
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = new List();
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          margin: EdgeInsets.only(bottom: 60.0, top: 60.0),
          child: ListView(
            children: <Widget>[
              Container(
                child: Text(
                  currentSlide.title,
                  style: currentSlide.styleTitle,
                  textAlign: TextAlign.center,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
              Container(
                child: Text(
                  currentSlide.description,
                  style: currentSlide.styleDescription,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
            ],
          ),
        ),
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // List slides
      slides: this.slides,
      renderSkipBtn: this.renderSkipBtn(),
      // Skip button
      colorSkipBtn: Colors.yellow,
      // (0x33ffcc5c),
      highlightColorSkipBtn: Colors.yellow,
      renderNextBtn: this.renderNextBtn(),
      // Next button
      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      colorDoneBtn: Colors.yellow,
      highlightColorDoneBtn: Colors.yellow,
      // Dot indicator
      colorDot: Colors.yellow,
      sizeDot: 13.0,
      typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,
      // Tabs
      listCustomTabs: this.renderListCustomTabs(),
      backgroundColorAllSlides: Colors.white,
      refFuncGoToTab: (refFunc) {
        this.goToTab = refFunc;
      },
      // Show or hide status bar
      shouldHideStatusBar: true,
      // On tab change completed
      onTabChangeCompleted: this.onTabChangeCompleted,
    );
  }
}
