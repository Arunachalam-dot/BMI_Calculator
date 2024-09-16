import 'package:bmi_calculator/Controller/bmi_controller.dart';
import 'package:bmi_calculator/Controller/theme_controller.dart';
import 'package:bmi_calculator/Controller/themechangebutton.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:bmi_calculator/section_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  //bool _isFinished = false;
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController());
    BMIController bmiController = Get.put(BMIController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              ThemeChangeButton(),
              Row(
                children: [
                  Text('Welcome You 😃', style: TextStyle(fontSize: 10)),
                ],
              ),
              Row(
                children: [
                  Text('BMI Calculator',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  GenderButton(icon: Icons.male, btnName: 'MALE', onPress: ()=>bmiController.genderHandle('MALE')),
                  SizedBox(width: 20),
                  GenderButton(icon: Icons.female, btnName: 'FEMALE', onPress: ()=>bmiController.genderHandle('FEMALE')),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            Text(
                              'Height (CM)',
                              style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              child: Obx(
                                () => SfSlider.vertical(
                                  activeColor: Colors.purple,
                                  inactiveColor: Colors.purple.shade200,
                                  min: 50,
                                  max: 250,
                                  value: bmiController.Height.value,
                                  interval: 25,
                                  showTicks: true,
                                  showLabels: true,
                                  enableTooltip: true,
                                  minorTicksPerInterval: 5,
                                  onChanged: (dynamic value) => bmiController.Height.value = value,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Weight(title: 'Weight'),
                    SizedBox(width: 20),
                    Age(title: 'Age'),
                  ],
                ),
              ),

              ///Calculate Button
              SizedBox(height: 20),
              SwipeButton()
            ],
          ),
        ),
      ),
    );
  }
}

class SwipeButton extends StatefulWidget {
  SwipeButton({super.key});

  @override
  State<SwipeButton> createState() => _SwipeButtonState();
}

class _SwipeButtonState extends State<SwipeButton> {
  bool _isFinished = false;

  @override
  Widget build(BuildContext context) {
    BMIController bmiController = Get.put(BMIController());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 50),
      child: SwipeableButtonView(
        isFinished: _isFinished,
        onFinish: () async{
          await Navigator.push(context,
              PageTransition(child: ResultPage(), type: PageTransitionType.fade));
          setState(() {
            _isFinished = false;
          });
        },
        onWaitingProcess: () {

          CalculateBMI();
          Future.delayed(Duration(seconds: 1),(){
            setState(() {
              _isFinished = true;
            });
          });
        },
        activeColor: Colors.purple,
        buttonWidget: Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,),
        buttonText: 'RESULT',
        //buttontextstyle: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

void CalculateBMI()
{
  BMIController bmiController = Get.put(BMIController());
  bmiController.CalculateBMI();
}


class Weight extends StatelessWidget {
  final String title;
  const Weight({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    BMIController bmiController = Get.put(BMIController());
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(title, style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(
                        ()=> Text('${bmiController.Weight.value}',
                            style: TextStyle(
                                fontSize: 65,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onBackground)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SectionButton(
                          onPress: () => bmiController.Weight++, icon: Icons.add),
                      SectionButton(
                          onPress: () => bmiController.Weight--, icon: Icons.minimize)
                    ],
                  ),
                ],
              ),
              height: 190,
              width: 250,
              //color: Colors.deepPurple,
              decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .primaryContainer,
                  borderRadius: BorderRadius.circular(15)),
            ),
            SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('BMI Ranges',style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold,color: Colors.purple),),
                SizedBox(height: 10),
                Text('UnderWeight',style: TextStyle(fontSize: 20)),
                SizedBox(height: 5),
                Text('Normal',style: TextStyle(fontSize: 20)),
                SizedBox(height: 5),
                Text('OverWeight',style: TextStyle(fontSize: 20)),
                SizedBox(height: 5),
                Text('Obese',style: TextStyle(fontSize: 20)),
                SizedBox(height: 5),
                Text('     Extremely',style: TextStyle(fontSize: 20)),
                Text('Obese',style: TextStyle(fontSize: 20)),
        
              ],
            ),
        
          ],
        ),
      ),
    );
  }
}

class Age extends StatelessWidget {
  final String title;
  const Age({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    BMIController bmiController = Get.put(BMIController());
    return Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(title, style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(
                              ()=> Text('${bmiController.Age.value}',
                              style: TextStyle(
                                  fontSize: 65,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.onBackground)),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SectionButton(
                            onPress: () => bmiController.Age++, icon: Icons.add),
                        SectionButton(
                            onPress: () => bmiController.Age--, icon: Icons.minimize)
                      ],
                    ),
                  ],
                ),
                height: 190,
                width: 250,
                //color: Colors.deepPurple,
                decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .primaryContainer,
                    borderRadius: BorderRadius.circular(15)),
              ),
              SizedBox(height: 70),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('18.5 or less',style: TextStyle(fontSize: 20),),
                  SizedBox(height: 5),
                  Text('18.5–24.9',style: TextStyle(fontSize: 20)),
                  SizedBox(height: 5),
                  Text(' 25–29.9',style: TextStyle(fontSize: 20)),
                  SizedBox(height: 5),
                  Text('30-34.9',style: TextStyle(fontSize: 20)),
                  SizedBox(height: 5),
                  Text('35 or greater',style: TextStyle(fontSize: 20)),
                ],
              ),
          
            ],
          ),
        ),
    );
  }
}

class GenderButton extends StatelessWidget {
  const GenderButton({
    super.key, required this.icon, required this.btnName, required this.onPress,

  });

  final IconData icon;
  final String btnName;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    BMIController bmiController = Get.put(BMIController());
    return Expanded(
      child: InkWell(
        onTap: onPress,
        child: Obx(
          () => Container(
            //padding: EdgeInsets.all(10),
            height: 100,
            decoration: BoxDecoration(
                color: bmiController.Gender.value == btnName ? Colors.purple: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(10)),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: bmiController.Gender.value == btnName ? Theme.of(context).colorScheme.primaryContainer : Colors.purple,
                  size: 100,
                ),
                Text(
                    btnName,
                    style: TextStyle(fontWeight: FontWeight.bold,color: bmiController.Gender.value == btnName ? Theme.of(context).colorScheme.primaryContainer : Colors.purple))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
