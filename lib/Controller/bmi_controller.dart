import 'package:flutter/material.dart';
import 'package:get/get.dart';
class BMIController extends GetxController
{
  RxString Gender = 'MALE'.obs;
  RxInt Weight = 12.obs;
  RxInt Age = 12.obs;
  RxDouble Height = 100.0.obs;
  RxString BMI = "".obs;
  RxDouble tempBMI = 0.0.obs;
  RxString BMIstatus = "".obs;
  Rx<Color> colorStatus = Color(0xffF246AFE).obs;
  RxString BMItips = "".obs;

  void genderHandle(String gender)
  {
    Gender.value = gender;
  }

  void CalculateBMI()
  {
    var Hmeter = Height/100;
    tempBMI.value = Weight / (Hmeter*Hmeter);
    BMI.value = tempBMI.toStringAsFixed(1);
    tempBMI.value = double.parse(BMI.value);
    findStatus();
    print(BMI);
}
void findStatus()
{
  if(tempBMI.value < 18.5)
    {
      BMIstatus.value = "UnderWeight";
      colorStatus.value = Color(0xffFF8800);
      BMItips.value = " It is important to eat a variety of foods that give you the nutrition you need. You should make sure you eat foods with enough energy to help you gain weight, protein to repair your body and build your muscles, and vitamins and minerals to keep your body cells functioning well.";
    }
  if(tempBMI.value > 18.5 && tempBMI.value < 24.9)
    {
      BMIstatus.value = "Normal";
      colorStatus.value = Color(0xff00CA39);
      BMItips.value = "A balanced, calorie-controlled diet is the ticket to a healthy BMI – the safe way. By making simple healthier food swaps, reducing portion sizes and cutting down on high-calorie food and drink, you're more likely to reach a healthy BMI steadily, and keep the extra weight off.";
    }
  if(tempBMI.value > 25.0 && tempBMI.value < 29.9)
  {
    BMIstatus.value = "Over Weight";
    colorStatus.value = Color(0xffFF5858);
    BMItips.value = "Get active for 150 minutes a week – you can break this up into shorter sessions.aim to get your 5 A Day – 80g of fresh, canned or frozen fruit or vegetables count as 1 portion.aim to lose 1 to 2lbs, or 0.5 to 1kg, a week.";
  }
  if(tempBMI.value > 30.0 && tempBMI.value < 34.9)
  {
    BMIstatus.value = "OBESE";
    colorStatus.value = Color(0xffFF0000);
    BMItips.value ="eat a balanced, calorie-controlled diet as recommended by your GP or weight loss management health professional (such as a dietitian)Join a local weight loss group.Take up activities such as fast walking, jogging, swimming or tennis for 150 to 300 minutes (two-and-a-half to five hours) a week.";
  }
  if(tempBMI.value > 35.0)
  {
    BMIstatus.value = "Extremely OBESE";
    colorStatus.value = Color(0xff000000);
    BMItips.value = "Eat a balanced, calorie-controlled diet as recommended by your GP or weight loss management health professional (such as a dietitian)join a local weight loss group.take up activities such as fast walking, jogging, swimming or tennis for 150 to 300 minutes (two-and-a-half to five hours) a week.";
  }
}
}