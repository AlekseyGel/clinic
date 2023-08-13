// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

import '../models/doctor_model.dart';

class DoctorDetailsScreen extends StatefulWidget {
  const DoctorDetailsScreen({super.key, required this.model});

  final DoctorModel model;

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  List<Widget> tabItems = [
    Center(
      child: Text(
        'Здесь можеть быть очень много написано всякой херни.',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
      ),
    ),
    Center(
      child: Text(
        'Ну а здесь конечно чтото другое',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
      ),
    ),
    Center(
      child: Text(
        'Соответственно здесь будет третье.',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
      ),
    ),
  ];

  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.model.name,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(widget.model.image),
                radius: 100,
              ),
              const SizedBox(height: 15),
              Text(
                widget.model.name,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              Text(
                widget.model.professional,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RatingBar.builder(
                    initialRating: widget.model.stars,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                  Text(
                    widget.model.stars.toString(),
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      height: 1.3,
                    ),
                  )
                ],
              ),
              SizedBox(height: 25),
              DefaultTabController(
                initialIndex: 0,
                length: 3,
                child: TabBar(
                  onTap: (value) {
                    currentTabIndex = value;
                    setState(() {});
                  },
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Tab(
                      height: 50,
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/svgs/on.svg',
                            height: 25,
                            width: 25,
                            colorFilter:
                                ColorFilter.mode(Colors.blue, BlendMode.srcIn),
                          ),
                          Text(
                            'О докторе',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Tab(
                      height: 50,
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/svgs/tw.svg',
                            height: 25,
                            width: 25,
                            colorFilter:
                                ColorFilter.mode(Colors.blue, BlendMode.srcIn),
                          ),
                          Text(
                            'Опыт',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Tab(
                      height: 50,
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/svgs/tr.svg',
                            height: 25,
                            width: 25,
                            colorFilter:
                                ColorFilter.mode(Colors.blue, BlendMode.srcIn),
                          ),
                          Text(
                            'Контакты',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              tabItems[currentTabIndex],
            ],
          ),
        ),
      ),
    );
  }
}
