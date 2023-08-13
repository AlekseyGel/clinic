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
  Function()? onPressed;

  _CheckCodePageState() {
    onPressed = null;
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
        title: const Text(
          'Подтверждение номера',
          style: AppFonts.w600s17,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'Введите код из смс',
              style: AppFonts.w500s22,
            ),
            const SizedBox(
              height: 120,
            ),
            TextField(
              onChanged: (value) {
                if (value == widget.code.toString()) {
                  onPressed = () {};
                } else {
                  onPressed = null;
                }
                setState(() {});
              },
              textAlign: TextAlign.center,
              obscureText: true,
              obscuringCharacter: '*',
              maxLength: 4,
              decoration: InputDecoration(
                prefixIcon: const Text(
                  'Код',
                  style: AppFonts.w600s18,
                ),
                suffix: InkWell(
                  onTap: () {},
                  child: const CircleAvatar(
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
            const SizedBox(
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
            AppButton(title: 'Далее', onPressed: onPressed),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
