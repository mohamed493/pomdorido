
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown.dart';
import 'package:flutter_countdown_timer/countdown_controller.dart';
import 'package:myapp/vodafone_like.dart';
import 'package:myapp/widgets/dialoge.dart';
import 'package:myapp/widgets/task_reminder_dialogue.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class MyHomePageWeb extends StatefulWidget {
  MyHomePageWeb({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageWebState createState() => _MyHomePageWebState();
}

class _MyHomePageWebState extends State<MyHomePageWeb> {
  CountdownController? countdownController;
  CountdownController? countdownController2;
  void setUpController1(durationTime, deviceWidth) {
    setState(() {
      durationTime11 = promdoroTIme;
      countdownController = CountdownController(
          duration: Duration(minutes: durationTime),
          onEnd: () {
            setState(() {
              onStartControllerEnd(deviceWidth);
            });
          });
    });
  }

  void setUpController2(durationTime) {
    setState(() {
      durationTime11 = breakTime;
      countdownController2 = CountdownController(
          duration: Duration(minutes: durationTime),
          onEnd: () {
            setState(() {
              onBreakControllerEnd();
            });
          });
    });
  }

  onStartControllerEnd(deviceWidth) {
    setState(() {
      setState(() {
        Dialog1(takeBreak: takeBreak, voidIt: voidIt, skipIt: skipIt)
            .showDialog1(context, deviceWidth);
      });
    });
  }

  onBreakControllerEnd() {
    setState(() {
      setState(() {
        break1 = false;
        isStart = true;
        shadowColor = selectedColor;
        selectedColor = carrier;
      });
    });
  }

  void takeBreak(deviceWidth11) {
    setState(() {
      break1 = true;
      _incrementCounter();
      setUpController2(breakTime);
      countdownController2!.start();
      stopFuture = false;
      increaseTheWidthOfTHwGreenContainer(deviceWidth11);
      Navigator.pop(context);
    });
  }

  void skipIt() {
    setState(() {
      isStart = true;
      shadowColor = selectedColor;
      selectedColor = carrier;
      _incrementCounter();
      Navigator.pop(context);
    });
  }

  void voidIt() {
    setState(() {
      //   countdownController!.dispose();
      isStart = true;
      shadowColor = selectedColor;
      selectedColor = carrier;
      Navigator.pop(context);
    });
  }

  void increaseTheWidthOfTHwGreenContainer(deviceWidth) async {
    double step = double.parse((deviceWidth / 100).toStringAsFixed(1));
    width = double.parse(step.toStringAsFixed(1));
    for (var i = 0; i < 100; i++) {
      if (stopFuture) {
        setState(() {
          durationTime11 = 10000000000000000;
          i = 100;
          width -= step;
          print("stopFuture");
        });
        break;
      } else if (!stopFuture) {
        await Future.delayed(Duration(milliseconds: durationTime11 * 60 * 10),
                () {
              setState(() {
                width += step;
              });
            });
      }
      if (width >= deviceWidth) {
        print("done");
        break;
      }
    }
  }

  SharedPreferences? preferences;
  SharedPreferences? preferences2;
  SharedPreferences? preferences3;
  String date = DateTime.now().toIso8601String();
  String combination = "";
  int numBomodorosDay = 0;


  @override
  void initState() {
    super.initState();
    initializePreference().whenComplete(() {
      setState(() {});
    });
  }


  void _incrementCounter() async {
    setState(() {
      numBomodorosDay++;
      numBomodorosWeek++;
      combination = '${DateTime.now().weekday}' +
          (int.parse(combination.substring(1)) + 1).toString();
      date = DateTime.now().toIso8601String();
      this.preferences?.setString("combination", combination);
      this.preferences2?.setInt("numBomodorosWeek", numBomodorosWeek);
      this.preferences3?.setString("date", date);
    });
  }

  Future<void> initializePreference() async {
    ;
    this.preferences = await SharedPreferences.getInstance();
    this.preferences2 = await SharedPreferences.getInstance();
    this.preferences3 = await SharedPreferences.getInstance();

    combination = this.preferences?.getString("combination") ??
        "${DateTime.now().weekday}$numBomodorosDay";
    numBomodorosWeek = this.preferences2?.getInt("numBomodorosWeek") ?? 0;
    numBomodorosDay = int.tryParse(combination.substring(1)) ?? 0;
    date = this.preferences3?.getString("date") ??
        DateTime.now().toIso8601String();
  }

  int durationTime11 = 1;
  static const int promdoroTIme = 25;
  static const int breakTime = 5;
  final TextStyle headNumberStyle =
  TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25);
  final TextStyle headwordStyle = TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.4),
      // fontWeight: FontWeight.bold,
      fontSize: 20);
  double width = 0.0;
  bool break1 = false;

  Color selectedColor = Color.fromRGBO(154, 24, 24, 1.0);
  Color shadowColor = Color.fromRGBO(45, 5, 7, 0.30196078431372547);
  Color x = Color(0x4d2d0507);
  bool isStart = true;
  int numBomodorosWeek = 0;
  bool stopFuture = false;
  static const Color carrier = Color.fromRGBO(154, 24, 24, 1.0);
  @override
  Widget build(BuildContext context) {
    String? taskReminder = context.watch<Dialog2>().value;
    print(taskReminder);
    int taskReminderFlex = 9;
    double waitingHeight = 50;
    int bottomFlex = 3;
    if (!kIsWeb) {
      if (MediaQuery.of(context).orientation == Orientation.landscape) {
        taskReminderFlex = 2;
        waitingHeight = 50;
        bottomFlex = 4;
      }
    }
    if (DateTime.now().difference(DateTime.parse(date)) > (Duration(days: 7))) {
      numBomodorosWeek = 0;
      combination = "${DateTime.now().weekday}0";
      this.preferences?.setString("combination", combination);
    }
    if (combination != "${DateTime.now().weekday}$numBomodorosDay" &&
        combination != "") {
      if (DateTime.now().weekday <
          int.parse(this.preferences!.getString("combination")![0])) {
        setState(() {
          //    combination=combination[0]+"0" ;
          numBomodorosWeek = 0;
          combination = "${DateTime.now().weekday}0";
          this.preferences?.setString("combination", combination);
          print("A new week");
        });
      }

      if (DateTime.now().weekday >
          int.parse(this.preferences!.getString("combination")![0])) {
        setState(() {
          combination = "${DateTime.now().weekday}0";
          this.preferences?.setString("combination", combination);
          print("New Day");
        });
      }
    }
    double deviceWidth = (MediaQuery.of(context).size.width).ceilToDouble();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(104, 15, 15, 1.0),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //  crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "${this.preferences?.getString("combination")?.substring(1) ?? 0} ",
                          style: headNumberStyle),
                      Row(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            'today ',
                            style: headwordStyle,
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: true),
                          ),
                        ],
                      ),
                      Text(" $numBomodorosWeek ", style: headNumberStyle),
                      Row(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Text("this week", style: headwordStyle),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    //  height: 80,
                    //     margin: EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(154, 24, 24, 1.0),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    width: double.infinity,
                    // height: 20,

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Hint: Remember Nike. Just do it.",
                        textAlign: TextAlign.left,
                        softWrap: true,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: Container(
                            width: 100,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                "Level: 12",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              width: (MediaQuery.of(context).size.width) - 103,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(154, 24, 24, 1.0),
                                borderRadius:
                                BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Text(""),
                            ),
                            Container(
                              //  width: (MediaQuery.of(context).size.width)-103,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(78, 153, 13, 1.0),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5)),
                              ),
                              child: Text(""),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text("pomodoros until next level : 250",
                          textAlign: TextAlign.center,
                          style: headwordStyle.copyWith(fontSize: 15)),
                    ),
                  ],
                )),
            Expanded(
              flex: taskReminderFlex,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    context.read<Dialog2>().showDialog2(context);
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      //   color: Colors.black,
                      width: double.infinity,
                      //   height: 300,
                      child: Text(
                          taskReminder == null
                              ? 'Click here to set a task reminder'
                              : "Task reminder:\n$taskReminder",
                          textAlign: TextAlign.center,
                          style: headwordStyle.copyWith(fontSize: 18)),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: bottomFlex,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(154, 24, 24, 1.0),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  // color: Colors.brown,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, right: 5, left: 5),
                    child: Column(
                      children: [
                        Container(
                          child: Stack(
                            children: [
                              Container(
                                width: deviceWidth,
                                height: waitingHeight,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black54,
                                      width: 1,
                                      style: BorderStyle.solid),
                                  color: Color.fromRGBO(154, 24, 24, 1.0),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    isStart
                                        ? Text(
                                      "Waiting to start next pomodoro",
                                      style: TextStyle(
                                          color: Colors.white,
                                          //   fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                      textAlign: TextAlign.center,
                                    )
                                        : Text(
                                      "",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  width: isStart ? 0 : width,
                                  height: waitingHeight,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black54,
                                        width: 1,
                                        style: BorderStyle.solid),
                                    color: Color.fromRGBO(78, 153, 13, 1.0),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                    ),
                                  ),
                                  child: Container()),
                              !isStart
                                  ? Countdown(
                                  countdownController: countdownController!,
                                  builder: (_, Duration time) {
                                    return Container(
                                      width: deviceWidth,
                                      height: waitingHeight,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black54,
                                            width: 1,
                                            style: BorderStyle.solid),
                                        //      color: Color.fromRGBO(154, 24, 24, 1.0),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          break1
                                              ? Text("")
                                              : Text(
                                            "Time Left : ${time.inMinutes % 60} : ${time.inSeconds % 60}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                // fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                            //  textAlign: TextAlign.center,
                                          )
                                        ],
                                      ),
                                    );
                                  })
                                  : Text(""),
                              break1
                                  ? Countdown(
                                  countdownController:
                                  countdownController2!,
                                  builder: (_, Duration time) {
                                    return Container(
                                      width: deviceWidth,
                                      height: waitingHeight,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black54,
                                            width: 1,
                                            style: BorderStyle.solid),
                                        //      color: Color.fromRGBO(154, 24, 24, 1.0),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "Break time left : ${time.inMinutes % 60} : ${time.inSeconds % 60}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                // fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                            //  textAlign: TextAlign.center,
                                          )
                                        ],
                                      ),
                                    );
                                  })
                                  : Text(""),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: waitingHeight - 8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: selectedColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                      border: Border.all(
                                          color: Colors.black54,
                                          width: 1,
                                          style: BorderStyle.solid)),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: selectedColor, // background
                                          //   onPrimary:Colors.black,
                                          elevation: 2000 // foreground
                                      ),
                                      child: Text(
                                        "start",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (isStart) {
                                            stopFuture = false;
                                            setUpController1(
                                                promdoroTIme, deviceWidth);
                                            countdownController!.start();
                                            increaseTheWidthOfTHwGreenContainer(
                                                deviceWidth);
                                            selectedColor = shadowColor;
                                            shadowColor = carrier;
                                            isStart = false;
                                          }
                                        });
                                      }),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: shadowColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                      border: Border.all(
                                          color: Colors.black54,
                                          width: 1,
                                          style: BorderStyle.solid)),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: shadowColor, // background
                                        // onPrimary:Colors.black,
                                        elevation: 2000 // foreground
                                    ),
                                    child: Text(
                                      "stop",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Vodafone()));
                                        if (!isStart) {
                                          stopFuture = true;
                                          break1 = false;
                                          // countdownController!.dispose();
                                          shadowColor = selectedColor;
                                          selectedColor = carrier;
                                          isStart = true;
                                        }
                                      });
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
