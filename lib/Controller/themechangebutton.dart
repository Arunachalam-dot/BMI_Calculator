import 'package:bmi_calculator/Controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ThemeChangeButton extends StatelessWidget {
  const ThemeChangeButton({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController =Get.put(ThemeController());
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(15)
          ),
          child: InkWell(
            onTap: ()=>themeController.changeTheme(),
            child: Row(
              children: [
                IconButton(onPressed: ()=>themeController.changeTheme(), icon: Icon(Icons.dark_mode)),
                //SizedBox(width: 5.0),
                IconButton(onPressed: ()=>themeController.changeTheme(), icon: Icon(Icons.light_mode)),
              ],
            ),
          ),
        )
      ],
    );
  }
}
