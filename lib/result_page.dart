import 'package:bmi_calculator/Controller/bmi_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    BMIController bmiController = Get.put(BMIController());
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(10),
          child: SafeArea(
            child: Column(
               children: [
              //   Row(
              //     children: [
              //       Icon(Icons.arrow_back_ios_new,size: 20,),
              //       Text('Back')
              //     ],
              //   ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Obx(()=>Text('Your BMI Score',style: TextStyle(fontSize: 28,color: bmiController.colorStatus.value,fontWeight: FontWeight.bold))),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  height: 350,
                  child: Expanded(
                    child: Obx(()
                      => CircularPercentIndicator(
                        animationDuration: 1000,
                        footer: Obx(()=> Text("${bmiController.BMIstatus.value}",style: TextStyle(color: bmiController.colorStatus.value,fontSize: 30))),
                        radius: 130.0,
                        lineWidth: 30.0,
                        percent: bmiController.tempBMI.value/100,
                        animation: true,
                        circularStrokeCap: CircularStrokeCap.round,
                        center: Text("${bmiController.tempBMI.value}%",style: TextStyle(color: Colors.purple,fontSize: 60),),
                        progressColor: bmiController.colorStatus.value,
                        backgroundColor:  bmiController.colorStatus.value.withOpacity(0.2),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: bmiController.colorStatus.value),
                  padding: EdgeInsets.all(10),
                  child: Obx(()=> Text("${bmiController.BMItips.value}",style: TextStyle(color: Colors.white),)),
                ),
                SizedBox(height: 20),
                ElevatedButton(onPressed: () =>Get.back(), child: Text('Find out More',style: TextStyle(color: Colors.purple),))
              ],
            ),
          ),
        ),

    );
  }
}
