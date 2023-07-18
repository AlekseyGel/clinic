import 'package:flutter/material.dart';
import 'package:hospital/core/app_fonts.dart';
import 'package:hospital/core/common_widgets/app_button.dart';

class CheckCodePage extends StatefulWidget {
  const CheckCodePage({super.key, required this.code});

  final int code;

  @override
  State<CheckCodePage> createState() => _CheckCodePageState();
}

class _CheckCodePageState extends State<CheckCodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(
              0xff007AFF,
            ),
          ),
        ),
        title: Text(
          'Подтверждение номера',
          style: AppFonts.w600s17,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            const Text(
              'Введите код из смс',
              style: AppFonts.w500s22,
            ),
            SizedBox(
              height: 140,
            ),
            TextField(
              textAlign: TextAlign.center,
              obscureText: true,
              obscuringCharacter: '*',
              maxLength: 4,
              decoration: InputDecoration(
                prefixIcon: Text(
                  'Код',
                  style: AppFonts.w600s18,
                ),
                suffix: InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 17.5,
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      widget.code.toString(),
                    ),
                  ),
                );
              },
              child: Text(
                'Получить код повторно',
                style: AppFonts.w400s15.copyWith(
                  color: Colors.blue,
                ),
              ),
            ),
            const Spacer(),
            AppButton(title: 'Далее', onPressed: () {}),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
