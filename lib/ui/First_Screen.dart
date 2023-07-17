import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hospital/core/app_fonts.dart';
import 'package:hospital/models/profil_model.dart';

import '../core/common_widgets/app_button.dart';
import '../core/common_widgets/profile_widget.dart';
import '../resources/resources.dart';
import 'login_screen.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({super.key});

  List<ProfileModel> models = [
    ProfileModel(
        image: Images.one,
        text: 'Записывайтесь на прием к самым лучшим специалистам'),
    ProfileModel(
        image: Images.two,
        text:
            'Сохраняйте результаты ваших анализов, диагнозы и рекомендации от врачей в собственную библиотеку'),
    ProfileModel(
        image: Images.tree,
        text:
            'Просматривайте отзывы о врачах и дополняйте собственными комментариями'),
    ProfileModel(
        image: Images.foo,
        text: 'Получайте уведомления о приеме или о поступивших сообщениях'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings_outlined,
              color: Colors.black,
            ),
          ),
        ],
        title: const Text(
          'Профиль',
          style: AppFonts.w600s17,
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Зачем нужен профиль?',
              style: AppFonts.w500s22,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: models.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: ProfileWidget(model: models[index]),
              ),
            ),
            const SizedBox(height: 5),
            Center(
              child: AppButton(
                title: 'Войти',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
