import 'dart:convert';

import 'package:flutter_complex_ui_gym_app/video_info.dart';
import 'package:get/get.dart';

import 'colors.dart' as color;
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._initData();
  }

  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/info.json")
        .then((value) {
      setState(() {
        info = json.decode(value);
      });

      print(info[0]['title']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Training",
                  style: TextStyle(
                      fontSize: 30,
                      color: color.AppColor.homePageTitle,
                      fontWeight: FontWeight.w700),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.arrow_back_ios_sharp,
                  size: 20,
                  color: color.AppColor.homePageIcons,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: Icon(
                    Icons.calendar_today_rounded,
                    size: 20,
                    color: color.AppColor.homePageIcons,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 20,
                  color: color.AppColor.homePageIcons,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Your Program",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: color.AppColor.homePageSubTitle),
                ),
                Expanded(child: Container()),
                Text(
                  "Details",
                  style: TextStyle(
                      color: color.AppColor.homePageDetail, fontSize: 20),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const VideoInfo());
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: color.AppColor.homePageIcons,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    color.AppColor.secondPageContainerGradient1stColor,
                    color.AppColor.secondPageContainerGradient2ndColor
                        .withOpacity(0.8)
                  ], begin: Alignment.bottomLeft, end: Alignment.centerRight),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(80)),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(10, 10),
                        blurRadius: 10,
                        color: color.AppColor.gradientSecond.withOpacity(0.2))
                  ]),
              child: Container(
                padding: const EdgeInsets.only(left: 20, top: 25, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Next Workout",
                      style: TextStyle(
                          fontSize: 16,
                          color: color.AppColor.homePageContainerTextSmall),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Legs Tonning",
                      style: TextStyle(
                          color: color.AppColor.homePageContainerTextSmall,
                          fontSize: 25),
                    ),
                    Text(
                      "and Glutes Workout",
                      style: TextStyle(
                          color: color.AppColor.homePageContainerTextSmall,
                          fontSize: 25),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.timer,
                              size: 20,
                              color: color.AppColor.homePageContainerTextSmall,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "60 min",
                              style: TextStyle(
                                  color:
                                      color.AppColor.homePageContainerTextSmall,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              boxShadow: [
                                BoxShadow(
                                    color: color.AppColor
                                        .secondPageContainerGradient1stColor,
                                    blurRadius: 10,
                                    offset: const Offset(4, 8))
                              ]),
                          child: const Icon(
                            Icons.play_circle_fill,
                            color: Colors.white,
                            size: 60,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 30),
                    height: 120,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              offset: const Offset(-1, -5),
                              color: color.AppColor.gradientSecond
                                  .withOpacity(0.3)),
                          BoxShadow(
                              blurRadius: 40,
                              offset: const Offset(8, 10),
                              color: color.AppColor.gradientSecond
                                  .withOpacity(0.3))
                        ],
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                            image: AssetImage('assets/card.jpg'),
                            fit: BoxFit.fill)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 200, bottom: 30),
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage('assets/figure.png'),
                          //fit: BoxFit.cover
                        )),
                  ),
                  Container(
                    width: double.maxFinite, //takes the available width
                    height: 100,

                    margin: const EdgeInsets.only(left: 150, top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "You are doing great",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: color.AppColor.homePageDetail),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                            text: TextSpan(
                                text: "Keep it up\n",
                                style: TextStyle(
                                    color: color.AppColor.homePagePlanColor,
                                    fontSize: 16),
                                children: const [
                              TextSpan(text: "stick to your plan")
                            ]))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  "Area of foucs",
                  style: TextStyle(
                      fontSize: 25,
                      color: color.AppColor.homePageTitle,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            Expanded(
                child: OverflowBox(
              maxWidth: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemCount: (info.length.toDouble() / 2).toInt(), //
                  itemBuilder: (_, i) {
                    int a = 2 * i; //0 2
                    int b = 2 * i + 1; //1 3
                    return Row(
                      children: [
                        Container(
                          height: 170,
                          width: (MediaQuery.of(context).size.width - 90) / 2,
                          margin: const EdgeInsets.only(
                              left: 30, right: 15, bottom: 20),
                          padding: const EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 3,
                                    offset: Offset(5, 5),
                                    color: color.AppColor.gradientSecond
                                        .withOpacity(0.1)),
                                BoxShadow(
                                    blurRadius: 3,
                                    offset: Offset(-5, -5),
                                    color: color.AppColor.gradientSecond
                                        .withOpacity(0.1))
                              ],
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: AssetImage(info[a]['img']))),
                          child: Center(
                              child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              info[a]['title'],
                              style: TextStyle(
                                  fontSize: 20,
                                  color: color.AppColor.homePageDetail),
                            ),
                          )),
                        ),
                        Container(
                          height: 170,
                          width: (MediaQuery.of(context).size.width - 90) / 2,
                          margin: const EdgeInsets.only(
                              left: 15, right: 30, bottom: 20),
                          padding: const EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 3,
                                    offset: Offset(5, 5),
                                    color: color.AppColor.gradientSecond
                                        .withOpacity(0.1)),
                                BoxShadow(
                                    blurRadius: 3,
                                    offset: Offset(-5, -5),
                                    color: color.AppColor.gradientSecond
                                        .withOpacity(0.1))
                              ],
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: AssetImage(info[b]['img']))),
                          child: Center(
                              child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              info[b]['title'],
                              style: TextStyle(
                                  fontSize: 20,
                                  color: color.AppColor.homePageDetail),
                            ),
                          )),
                        )
                      ],
                    );
                  }),
            ))
          ],
        ),
      ),
    );
  }
}
