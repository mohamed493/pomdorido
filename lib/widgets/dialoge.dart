import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dialog1 {
  final Function? takeBreak;
  final Function? skipIt;
  final Function? voidIt;
  Dialog1({this.takeBreak, this.skipIt, this.voidIt});
  showDialog1(BuildContext ctx, devicewidth ) {
    return showDialog(
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
              elevation: 50,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    // width: 400,
                    //  height: 235,
                    decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Colors.grey, width: 8),
                          left: BorderSide(color: Colors.grey, width: 8),
                          right: BorderSide(color: Colors.grey, width: 8)),
                      color: Colors.black,
                    ),
                    constraints: BoxConstraints(minWidth: 400),

                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Break time",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white)),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        "Well done , you may now take a break of",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  TextSpan(
                                    text: " 5 minutes ",
                                    style: TextStyle(
                                        color: Colors.deepOrange, fontSize: 20),
                                  ),
                                  TextSpan(
                                    text: ",skip it ,or void the last "
                                        "pomodoro in case you get distracted",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            // width: width,
                            width: double.infinity,
                            color: Colors.grey,
                            height: 58,
                            child:   Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Color.fromRGBO(224, 216,
                                              216, 0.6), // background
                                          onPrimary:
                                          Colors.black, // foreground
                                        ),
                                        onPressed: () {
                                          takeBreak!(devicewidth);
                                        },
                                        child: Container(
                                          //color: Colors.red,
                                          child: Text("Take break"),
                                        )),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Color.fromRGBO(224, 216,
                                              216, 0.6), // background
                                          onPrimary:
                                          Colors.black, // foreground
                                        ),
                                        onPressed: () {
                                          skipIt!();
                                        },
                                        child: Container(
                                          //color: Colors.red,
                                          child: Text("Skip it"),
                                        )),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Color.fromRGBO(224, 216,
                                              216, 0.6), // background
                                          onPrimary:
                                          Colors.black, // foreground
                                        ),
                                        onPressed: () {
                                          voidIt!();
                                        },
                                        child: Container(
                                          //color: Colors.red,
                                          child: Text("Void it"),
                                        )),
                                  ),
                                ),
                              ],
                            ) ,
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ));
        },
        context: ctx);
  }
}
