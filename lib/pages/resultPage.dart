import 'package:flutter/material.dart';
import 'package:mbi/my_widgets/ContainerCard.dart';
import 'package:mbi/styles/styles.dart';

class ResultPage extends StatelessWidget {
  var bmi, comment, verdict, age;
  ResultPage({this.bmi, this.comment, this.verdict, this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Индекс массы тела'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  'Ваш результат:',
                  style: kLargeTextLabelStyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ContainerCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    verdict,
                    textAlign: TextAlign.center,
                    style: kResultTextVerdict,
                  ),
                  Text(
                    bmi,
                    textAlign: TextAlign.center,
                    style: kResultScore,
                  ),
                  Text(
                    comment,
                    textAlign: TextAlign.center,
                    style: kLabelTextStyle,
                  ),
                ],
              ),
              color: kContainerColor,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: double.infinity,
              color: Color(0xff293776),
              padding: EdgeInsets.all(20),
              child: Center(
                child: Text(
                  'Начать заново',
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
