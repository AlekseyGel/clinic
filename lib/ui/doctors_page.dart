import 'package:flutter/material.dart';

import '../models/doctor_model.dart';
import 'doctor_detail_screen.dart';

class DoctorPage extends StatefulWidget {
  const DoctorPage({super.key});

  @override
  State<DoctorPage> createState() => _DoctorPageState();
}

String image =
    'https://u.9111s.ru/uploads/202104/07/feadfccb0998d53f628c7bb3d0ae4318.jpg';

class _DoctorPageState extends State<DoctorPage> {
  final TextEditingController controller = TextEditingController();

  List<String> professional = [
    'Все',
    'Аритмологи',
    'Кардиологи',
    'Неврологи',
    'Гастроинтерологи',
    'Педиаторы',
  ];

  List<DoctorModel> doctorsList = [
    DoctorModel(
        name: 'Сергей Иванов',
        professional: 'Кардиолог',
        image: image,
        stars: 4.3,
        description:
            'descriptiondescriptiondescriptiondescriptiondescriptiondescription'),
    DoctorModel(
        name: 'Иван Сергеев',
        professional: 'Аритмолог',
        image: image,
        stars: 4.6,
        description:
            'descriptiondescriptiondescriptiondescriptiondescriptiondescription'),
    DoctorModel(
        name: 'Максим Петром',
        professional: 'Невролог',
        image: image,
        stars: 4.8,
        description:
            'descriptiondescriptiondescriptiondescriptiondescriptiondescription'),
    DoctorModel(
        name: 'Сергей Иванов',
        professional: 'Кардиолог',
        image: image,
        stars: 3.5,
        description:
            'descriptiondescriptiondescriptiondescriptiondescriptiondescription'),
    DoctorModel(
        name: 'Сергей Иванов',
        professional: 'Кардиолог',
        image: image,
        stars: 5.0,
        description:
            'descriptiondescriptiondescriptiondescriptiondescriptiondescription'),
  ];

  String selectedDoctor = 'Все';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Доктора',
          style: TextStyle(
              color: Colors.black, fontSize: 34, fontWeight: FontWeight.w700),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.bloodtype_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 36,
                  width: 236,
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                      hintText: "Поиск врача",
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    controller.text = '';
                  },
                  child: const Text('Очистить'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: professional.length,
                itemBuilder: (context, index) {
                  return doctorChois(
                      selected: selectedDoctor == professional[index],
                      title: professional[index],
                      onSelected: (val) {
                        selectedDoctor = professional[index];
                        setState(() {});
                      });
                },
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.63,
                color: Colors.grey,
                child: ListView.builder(
                  itemCount: doctorsList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => DoctorsListItem(
                    model: doctorsList[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoctorDetailsScreen(
                            model: doctorsList[index],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorsListItem extends StatelessWidget {
  const DoctorsListItem({
    super.key,
    required this.model,
    required this.onTap,
  });

  final DoctorModel model;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(model.image),
                  radius: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.professional,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      model.name,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Icon(
                      Icons.star,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('${model.stars}'),
                  ],
                ),
                Column(
                  children: [
                    const Icon(
                      Icons.comment,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('${model.comments?.length}'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class doctorChois extends StatelessWidget {
  const doctorChois({
    super.key,
    required this.selected,
    required this.title,
    required this.onSelected,
  });

  final bool selected;
  final String title;
  final Function(bool) onSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ChoiceChip(
        onSelected: onSelected,
        disabledColor: const Color.fromARGB(255, 214, 212, 212),
        selectedColor: const Color.fromARGB(255, 241, 104, 104),
        label: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w600,
            fontFamily: 'SP Pro Display',
          ),
        ),
        selected: selected,
      ),
    );
  }
}
