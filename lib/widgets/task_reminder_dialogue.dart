import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dialog2 extends StatelessWidget with ChangeNotifier{
  TextEditingController textEditingController=TextEditingController(
  ) ;
  String? value;
  showDialog2(BuildContext ctx  ) {
     value=textEditingController.value.text ;
    return showDialog(
      //  barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
              elevation: 50,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    color: Colors.black,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            child: Text("Edit your task reminder",style: TextStyle(color: Colors.white,fontSize: 20),)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
                        child: Container(
                          color: Colors.white,
                          child: TextField(
                            keyboardType:TextInputType.text,
                            maxLines: 1,
                            expands: false,
                            autofocus: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                              ),),
                            controller: textEditingController,
                          ),
                        ),
                      ),
                      Container(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(224, 216,
                                216, 0.6), // background
                            onPrimary:
                            Colors.black, // foreground
                          ),
                          onPressed: (){
                            value=textEditingController.value.text ;
                            print(value);
                            notifyListeners();
                            Navigator.pop(context,);
                          }, child: Text("Go, go,go !"),

                        ),
                      ),

                    ],),),


                ],
              ));
        },
        context: ctx);}



    @override
  Widget build(BuildContext context) {
    return Container();
  }
}


