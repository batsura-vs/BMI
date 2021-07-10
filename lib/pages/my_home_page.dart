import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mbi/my_widgets/ContainerCard.dart';
import 'package:mbi/my_widgets/RoundIconButton.dart';
import 'package:mbi/my_widgets/text_icon.dart';
import 'package:mbi/pages/resultPage.dart';
import 'package:mbi/styles/styles.dart';
import 'package:mbi/calculator.dart';

enum Gender { male, female }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedGender;
  var height = 180.0;
  var weight = 70;
  var age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Индекс массы тела')),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ContainerCard(
                    tap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: TextIcon('Мужчина', Icons.male),
                    color: selectedGender == Gender.male
                        ? kContainerColor
                        : kUnselectedColor,
                  ),
                ),
                Expanded(
                  child: ContainerCard(
                    tap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: TextIcon('Женщина', Icons.female),
                    color: selectedGender == Gender.female
                        ? kContainerColor
                        : kUnselectedColor,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ContainerCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Рост',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(height.round().toString(),
                                style: kLargeTextLabelStyle),
                            Text(
                              'см',
                              style: kLabelTextStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbColor: Color(0xff2c4cb3),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15),
                          ),
                          child: Slider(
                            value: height,
                            onChanged: (heightNow) {
                              setState(() {
                                height = heightNow;
                              });
                            },
                            max: 240,
                            min: 120,
                          ),
                        )
                      ],
                    ),
                    color: kContainerColor,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ContainerCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Вес',
                          style: kLabelTextStyle,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          weight.toString(),
                          style: kLargeTextLabelStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              child: Icon(
                                Icons.remove,
                                color: kTextColor,
                              ),
                              onPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              child: Icon(
                                Icons.add,
                                color: kTextColor,
                              ),
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    color: kContainerColor,
                  ),
                ),
                Expanded(
                  child: ContainerCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Возраст',
                          style: kLabelTextStyle,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          age.toString(),
                          style: kLargeTextLabelStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              child: Icon(
                                Icons.remove,
                                color: kTextColor,
                              ),
                              onPress: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              child: Icon(
                                Icons.add,
                                color: kTextColor,
                              ),
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    color: kContainerColor,
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              var calc = CalculateBMI(weight: weight, height: height);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                      bmi: calc.calculate(),
                      verdict: calc.getResult(),
                      comment: calc.getComment(),
                      age: age),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              color: Color(0xff293776),
              padding: EdgeInsets.all(20),
              child: Center(
                child: Text(
                  'Рассчитать!',
                  style: kLabelTextStyle,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
