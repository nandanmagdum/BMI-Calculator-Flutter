import 'package:app1/screens/input_page.dart';
import 'package:flutter/material.dart';
import 'package:app1/constants.dart';

List<String> scales = ['UNDERWEIGHT', 'NORMAL', 'OVERWEIGHT', 'OBESE', 'EXTREMLY OBESE'];
List<String> desc = [
  'Your need to eat more ! :-(',
  'Your BMI is perfect , try maintaining it :-)',
  'Your are slightly overweight ! :-|',
  'You need to Exersize and Cut down weight :_('
];
String? Scale ;
String? Remark;
class ResultPage extends StatelessWidget {
  const ResultPage({super.key, this.BMI});
  final BMI;
  @override
  Widget build(BuildContext context) {
    if(BMI <= 18.5 ){
      Scale = scales[0];
      Remark = desc[0];
    } else if(BMI > 18.5 && BMI <= 24.9){
      Scale = scales[1];
      Remark = desc[1];
    } else if(BMI > 24.9 && BMI <= 29.9){
      Scale = scales[2];
      Remark = desc[2];
    } else if(BMI > 29.9 && BMI <= 34.9){
      Scale = scales[3];
      Remark = desc[3];
    } else {
      Scale = scales[4];
      Remark = desc[4];
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI CALCULATOR",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
          ),
          Text(
            "Your Result",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 60),
          ),
          Expanded(
            child: buildCustom(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 20,
                ),
                remark(type: Scale.toString()),
                Text(
                  BMI.toStringAsFixed(1),
                  style: TextStyle(fontSize: 80, fontWeight: FontWeight.w900),
                ),
                SizedBox(height: 150,),
                Text(Remark.toString(), style: kTextStyle(),textAlign: TextAlign.center,),
              ],
            )),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.only(top: 10),
              height: MediaQuery.of(context).size.height * 0.08,
              width: double.infinity,
              color: Color(0xFFEB1555),
              child: Center(
                child: Text(
                  "RE-CALCULATE",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
