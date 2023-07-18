import 'package:flutter/material.dart';
import 'package:hospital/core/common_widgets/app_button.dart';

import '../core/app_fonts.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller1 = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Подтверждение номера',
          style: AppFonts.w600s17,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.blue.withOpacity(0.54),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Text(
                "Ведите код из смс",
                style: AppFonts.w400s22,
              ),
            ),
          ),
          SizedBox(
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                controller: controller1,
                style: AppFonts.w700s17,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.close),
                  prefix: Text(
                    'Код',
                    style: AppFonts.w700s17,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  hintText: '***9',
                  hintStyle: AppFonts.w700s17,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          TextButton(
            onPressed: () {},
            child: Text('Получить код повторно'),
          ),
          SizedBox(height: 85),
          const Spacer(),
          AppButton(title: ('Далее'), onPressed: () {}),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
