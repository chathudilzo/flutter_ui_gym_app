import 'dart:convert';
import 'dart:math';

import 'package:flutter_complex_ui_gym_app/home_page.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import 'colors.dart' as color;
import 'package:flutter/material.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({super.key});

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List videoInfo = [];
  bool _playArea = false;
  VideoPlayerController? _vController;
  bool _isPlaying = false;
  bool _disposed = false;
  int _isPlayingIndex = -1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initData();
  }

  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/videoinfo.json")
        .then((value) {
      setState(() {
        videoInfo = json.decode(value);
      });
    });
  }

  @override
  void dispose() {
    _disposed = true;
    _vController?.pause();
    _vController?.dispose();
    _vController = null;
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _playArea == false
            ? BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                    color.AppColor.secondPageContainerGradient1stColor
                        .withOpacity(0.9),
                    color.AppColor.secondPageContainerGradient2ndColor
                        .withOpacity(0.9)
                  ],
                    begin: const FractionalOffset(0.0, 0.4),
                    end: Alignment.topRight))
            : BoxDecoration(color: color.AppColor.gradientSecond),
        child: Column(
          children: [
            _playArea == false
                ? Container(
                    padding:
                        const EdgeInsets.only(top: 70, left: 30, right: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                                color: color.AppColor.secondPageIconColor,
                              ),
                            ),
                            Expanded(child: Container()),
                            Icon(
                              Icons.info_outline_rounded,
                              size: 20,
                              color: color.AppColor.secondPageIconColor,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Legs toning",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        const Text(
                          "and Glutes Workout",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: color.AppColor.pinkbar),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.timer,
                                    color: color.AppColor.secondPageIconColor,
                                    size: 20,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    "68 min",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  )
                                ],
                              ),
                            ),
                            Expanded(child: Container()),
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                      colors: [
                                        color.AppColor
                                            .secondPageContainerGradient2ndColor,
                                        color.AppColor.barColor,
                                        color.AppColor.barColor2,
                                        color.AppColor
                                            .secondPageContainerGradient1stColor
                                      ],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight)),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.home_repair_service_outlined,
                                    color: color.AppColor.secondPageIconColor,
                                    size: 20,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    "Resistent band, kettlebell",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                : Container(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 50, left: 30, right: 30),
                          height: 100,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Icon(
                                  Icons.arrow_back_ios_new,
                                  size: 20,
                                  color: color.AppColor.homePageIcons,
                                ),
                              ),
                              Expanded(child: Container()),
                              Icon(
                                Icons.info_outline,
                                color: color.AppColor.secondPageTopIconColor,
                              )
                            ],
                          ),
                        ),
                        _playView(context),
                        _controllView(context)
                      ],
                    ),
                  ),
            //when ever need to use available space use expanded
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(70))),
              child: Container(
                margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Circuit 1:Legs Toning",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: color.AppColor.circuitsColor),
                        ),
                        Expanded(child: Container()),
                        Row(
                          children: [
                            Icon(
                              Icons.loop,
                              size: 30,
                              color: color.AppColor.secondPageTopIconColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "3 Sets",
                              style: TextStyle(
                                  color: color.AppColor.setsColor,
                                  fontSize: 15),
                            )
                          ],
                        )
                      ],
                    ),
                    Expanded(child: _listView())
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }

  _buildCard(int index) {
    return Container(
      height: 135,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(videoInfo[index]["thumbnail"]),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    videoInfo[index]["title"],
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      videoInfo[index]['time'],
                      style: const TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                  width: 80,
                  height: 20,
                  decoration: BoxDecoration(
                      color: Color(0xFFeaeefc),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text(
                      "15s rest",
                      style: TextStyle(
                          color: Color(0xFF839fed),
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              Row(
                children: [
                  for (int i = 0; i < 75; i++)
                    i.isEven
                        ? Container(
                            width: 3,
                            height: 1,
                            decoration: BoxDecoration(
                                color: const Color(0xFF839fed),
                                borderRadius: BorderRadius.circular(2)),
                          )
                        : Container(
                            width: 3,
                            height: 1,
                            color: Colors.white,
                          )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  _listView() {
    return ListView.builder(
        itemCount: videoInfo.length,
        itemBuilder: (_, int index) {
          return GestureDetector(
              onTap: () {
                _onTapVideo(index);
                debugPrint(index.toString());
                setState(() {
                  if (_playArea == false) {
                    _playArea = true;
                  }
                });
              },
              child: _buildCard(index));
        });
  }

  _initializeVideo(int index) async {
    final controller =
        VideoPlayerController.network(videoInfo[index]["videoUrl"]);
    final old = _vController;
    _vController = controller;
    if (old != null) {
      old.removeListener(_onControllerUpdate);
      old.pause();
    }
    setState(() {});
    controller
      ..initialize().then((_) {
        old?.dispose();
        _isPlayingIndex = index;
        controller.addListener(_onControllerUpdate);
        controller.play();
        setState(() {});
      });
  }

  var _onUpdateControllerTime;
  Duration? _duration;
  Duration? _position;
  var _prograss = 0.0;
  void _onControllerUpdate() async {
    if (_disposed) {
      return;
    }

    _onUpdateControllerTime = 0;

    final now = DateTime.now()
        .microsecondsSinceEpoch; //to reduce listners calling continueslly
    if (_onUpdateControllerTime > now) {
      return;
    } else {
      _onUpdateControllerTime = now + 500;
    }
    final controller = _vController;

    if (controller == null) {
      debugPrint("controller is null");
      return;
    }
    if (!controller.value.isInitialized) {
      debugPrint('Controller cannot be initialized');
      return;
    }
    if (_duration == null) {
      _duration = _vController?.value.duration;
    }
    var duration = _duration;
    if (duration == null) return;

    var position = await controller.position;
    _position = position;

    final playing = controller.value.isPlaying;
    if (playing) {
      //prograss ind
      if (_disposed) return;
      setState(() {});
      _prograss = position!.inMicroseconds.ceilToDouble() /
          duration.inMilliseconds.ceilToDouble();
    }
    _isPlaying = playing;
  }

  _onTapVideo(int index) {
    _initializeVideo(index);
  }

  Widget _playView(BuildContext context) {
    final controller = _vController;

    if (controller != null && controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: VideoPlayer(controller),
      );
    } else {
      return const AspectRatio(
          aspectRatio: 16 / 9,
          child: Center(
              child: Text(
            "Video is loading!",
            style: TextStyle(fontSize: 20, color: Colors.white),
          )));
    }
  }

  String convertTwo(int value) {
    return value < 10 ? "0$value" : "$value";
  }

  Widget _controllView(BuildContext context) {
    final noMute = (_vController?.value.volume ?? 0) > 0;
    // final duration = _vController?.value.duration.inSeconds ?? 0;
    final duration = _duration?.inSeconds ?? 0;
    // final head = _vController?.value.position.inSeconds ?? 0;
    final head = _position?.inSeconds ?? 0;
    final remained = max(0, duration - head);
    final mins = convertTwo(remained ~/ 60.0);
    final secs = convertTwo(remained % 60);
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color.AppColor.gradientSecond),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SliderTheme(
              data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.red[700],
                  inactiveTrackColor: Colors.red[100],
                  trackShape: RoundedRectSliderTrackShape(),
                  trackHeight: 2.0,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                  thumbColor: Colors.redAccent,
                  overlayColor: Colors.red.withAlpha(32),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                  tickMarkShape: RoundSliderTickMarkShape(),
                  activeTickMarkColor: Colors.red[700],
                  inactiveTickMarkColor: Colors.red[100],
                  valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                  valueIndicatorColor: Colors.redAccent,
                  valueIndicatorTextStyle: TextStyle(color: Colors.white)),
              child: Slider(
                value: max(0, min(_prograss * 100, 100)),
                min: 0,
                max: 100,
                divisions: 100,
                label: _position?.toString().split(".")[0],
                onChanged: (value) {
                  setState(() {
                    _prograss = value * 0.01;
                  });
                },
                onChangeStart: (value) {
                  _vController?.pause();
                },
                onChangeEnd: (value) {
                  final duration = _vController?.value.duration;
                  if (duration != null) {
                    var newValue = max(0, min(value, 99)) * 0.01;
                    var mills = (duration.inMicroseconds * newValue).toInt();
                    _vController?.seekTo(Duration(milliseconds: mills));
                    _vController?.play();
                  }
                },
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    if (noMute) {
                      _vController?.setVolume(0);
                    } else {
                      _vController?.setVolume(1.0);
                    }
                    setState(() {});
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0.0, 0.0),
                                blurRadius: 4.0,
                                color: Color.fromARGB(255, 15, 96, 172)),
                          ]),
                      child: Icon(
                        noMute ? Icons.volume_up : Icons.volume_off,
                        color: Colors.white,
                      ),
                    ),
                  )),
              TextButton(
                onPressed: () async {
                  final index = _isPlayingIndex - 1;
                  if (index >= 0 && videoInfo.length >= 0) {
                    _initializeVideo(index);
                  } else {
                    Get.snackbar("Video", "NO more videos to show",
                        snackPosition: SnackPosition.BOTTOM,
                        icon: const Icon(
                          Icons.hourglass_empty_sharp,
                          size: 30,
                          color: Colors.white,
                        ),
                        backgroundColor:
                            const Color.fromARGB(255, 64, 169, 255),
                        colorText: Colors.amberAccent,
                        messageText: const Text(
                          "More videos will be upload in near future!",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ));
                  }
                },
                child: const Icon(
                  Icons.fast_rewind,
                  color: Colors.white,
                ),
              ),
              TextButton(
                onPressed: () async {
                  setState(() {
                    if (_isPlaying) {
                      _vController!.pause();
                    } else {
                      _vController!.play();
                    }
                  });
                },
                child: Icon(
                  _isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                ),
              ),
              TextButton(
                onPressed: () async {
                  final index = _isPlayingIndex + 1;
                  if (index <= videoInfo.length - 1) {
                    _initializeVideo(index);
                  } else {
                    Get.snackbar("Video", "NO more videos to show",
                        snackPosition: SnackPosition.BOTTOM,
                        icon: const Icon(
                          Icons.sports_score_outlined,
                          size: 30,
                          color: Colors.white,
                        ),
                        backgroundColor:
                            const Color.fromARGB(255, 64, 169, 255),
                        colorText: Colors.amberAccent,
                        messageText: const Text(
                          "You Finished All The Videos! Congratz...         More videos will be upload in near future!",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ));
                  }
                },
                child: const Icon(
                  Icons.fast_forward,
                  color: Colors.white,
                ),
              ),
              Text(
                "$mins:$secs",
                style: const TextStyle(color: Colors.white, shadows: <Shadow>[
                  Shadow(
                      offset: Offset(0.0, 0.1),
                      blurRadius: 4.0,
                      color: Color.fromARGB(150, 0, 0, 0))
                ]),
              )
            ],
          ),
        ],
      ),
    );
  }
}
