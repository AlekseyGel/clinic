import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hospital/core/app_fonts.dart';
import 'package:hospital/ui/check_code_page.dart';

import '../core/common_widgets/app_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int code = Random().nextInt(8999 + 1000);
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Вход',
          style: AppFonts.w600s17,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.black.withOpacity(0.54),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Войти',
              style: AppFonts.w700s34.copyWith(
                color: const Color(
                  0xff333333,
                ),
              ),
            ),
            const SizedBox(
              height: 49,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 11,
              ),
              child: Text(
                'Номер телефона',
                style: AppFonts.w400s15.copyWith(
                  color: const Color(0xff333333),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: controller,
              style: AppFonts.w700s17,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                hintText: '+7 ... ... .. ..',
                hintStyle: AppFonts.w700s17,
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            Text(
              'На указанный номер придет СМС-сообщение с кодом подтверждения',
              style: AppFonts.w400s15,
            ),
            Spacer(),
            Center(
              child: AppButton(
                title: 'Далее',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CheckCodePage(
                        code: code,
                      ),
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        code.toString(),
                      ),
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CheckCodePage(
                        code: code,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
