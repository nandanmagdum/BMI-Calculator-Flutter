import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app1/constants.dart';
import 'result.dart';

const bottomContainerMargin = 10.0;
Color originalColor = const Color(0xFF1D1E28);
Color maleColour = selectedColor;
Color femaleColour = originalColor;
// Color selectedColor = Color(0xFF1D1E4F);
Color selectedColor = Colors.red;

// example of using enum to represent gender insted of numbers **IMP**
enum Gender {male, female }

enum Operation { add, minus }

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

Container buildCustom(
    {Color? colour = const Color.fromARGB(255, 29, 30, 51), Widget? child}) {
  return Container(
    child: child,
    margin: EdgeInsets.all(15.0),
    // height: MediaQuery.of(context).size.height * 0.22,
    // width: MediaQuery.of(context).size.width * 0.41,
    decoration: BoxDecoration(
      // color: Color(0xFF1D1E33),
      color: colour,
      borderRadius: BorderRadius.circular(10.0),
    ),
  );
}

class _BMICalculatorState extends State<BMICalculator> {
  int height = 180;
  int weight = 65;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI CALCULATOR",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  print("MALE");
                  setState(() {
                      maleColour = selectedColor;
                      femaleColour = originalColor;
                  });
                },
                child: buildCustom(
                  colour: maleColour,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.mars,
                        size: 80,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "MALE",
                        style: kTextStyle(),
                      ),
                    ],
                  ),
                ),
              )),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  print("FEMALE");
                  setState(() {
                      femaleColour = selectedColor;
                      maleColour = originalColor;

                  });
                },
                child: buildCustom(
                    colour: femaleColour,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.venus,
                          size: 80,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "FEMALE",
                          style: kTextStyle(),
                        ),
                      ],
                    )),
              )),
            ],
          )),
          Expanded(
              child: buildCustom(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "HEIGHT",
                  style: kTextStyle(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kNumberStyle(),
                    ),
                    Text(
                      "cm",
                      style: kTextStyle(),
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    thumbColor: Colors.red,
                    overlayColor: Colors.grey,
                    overlayShape: RoundSliderThumbShape(enabledThumbRadius: 20),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                  ),
                  child: Slider(
                      value: height.toDouble(),
                      min: 140.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      }),
                )
              ],
            ),
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: buildCustom(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "WEIGHT",
                      style: kTextStyle(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          weight.toString(),
                          style: kNumberStyle(),
                        ),
                        Text(
                          "kg",
                          style: kTextStyle(),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                weight--;
                              });
                            },
                            child: CircleAvatar(
                              radius: 30.0,
                                child: Icon(FontAwesomeIcons.minus, size: 30))),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                weight++;
                              });
                            },
                            child: CircleAvatar(
                              radius: 30.0,
                                child: Icon(FontAwesomeIcons.plus, size: 30)))
                      ],
                    ),
                  ],
                ),
              )),
              Expanded(
                  child: buildCustom(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "AGE",
                      style: kTextStyle(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          age.toString(),
                          style: kNumberStyle(),
                        ),
                        Text(
                          "years",
                          style: kTextStyle(),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                age--;
                              });
                            },
                            child: CircleAvatar(
                              radius: 30.0,
                                child: Icon(FontAwesomeIcons.minus, size: 30,))),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                age++;
                              });
                            },
                            child: CircleAvatar(
                              radius: 30.0,
                                child: Icon(FontAwesomeIcons.plus,  size: 30)))
                      ],
                    ),
                  ],
                ),
              )),
            ],
          )),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                      double h = height.toDouble() * height.toDouble() ;
                      double BMI = (weight/h) * 10000.roundToDouble();
                      print(BMI);
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ResultPage(BMI: BMI,))
                      );
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: bottomContainerMargin),
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: double.infinity,
                    color: Color(0xFFEB1555),
                    child: Center(
                        child: Text(
                      "CALCULATE",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

RawMaterialButton customButton({Icon? icon, Operation? op}) {
  return RawMaterialButton(
    onPressed: () {},
    child: icon,
    constraints: BoxConstraints.tightFor(height: 56, width: 56),
    shape: CircleBorder(),
    fillColor: Color(0xFF4C4F5E),
  );
}
