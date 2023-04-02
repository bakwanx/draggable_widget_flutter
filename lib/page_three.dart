import 'package:flutter/material.dart';

class PageThree extends StatefulWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  late List<ObjChoice> objChoice;
  List<ObjChoice> catchAnswer = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    objChoice = [
      ObjChoice(question: "Question one", answer: "Answer one"),
      ObjChoice(question: "Question two", answer: "Answer two"),
      ObjChoice(question: "Question three",answer: "Answer three"),
      ObjChoice(question: "Question four",answer: "Answer four"),
      ObjChoice(question: "Question five",answer: "Answer five"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;

    Widget change(){
      return Container();
    }
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: objChoice.map((item) {
              return Row(
                children: [
                  DragTarget(
                    builder: (ctx, acceptedItems, rejectedItem) {
                      return Row(
                        children: [
                          Container(
                            color: Colors.grey,
                            child: Text(
                              item.question!,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          item.isChoice ?
                          Container(
                            color: Colors.grey,
                            child: Text(
                              item.answer!,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ) : Container()
                        ],
                      );
                    },
                    onAccept: (ObjChoice item) {
                      print("pesan ${item.answer}");
                      setState(() {
                        item.isChoice = true;
                        catchAnswer.add(item);
                      });
                    },
                  ),
                ],
              );
            }).toList(),
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: objChoice.map((item) {
              return Draggable(
                data: item,
                child: Container(
                  color: Colors.white,
                  child: Text(
                    item.answer!,
                  ),
                ),
                childWhenDragging: Container(
                  color: Colors.grey,
                  child: Text(
                    item.answer!,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                feedback: Container(
                  color: Colors.white,
                  child: Text(
                    item.answer!,
                    style: TextStyle(fontSize: 14, color: Colors.red),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class ObjChoice {
  final String? question;
  final String? answer;
  bool isChoice;

  ObjChoice({this.question, this.answer, this.isChoice = false});
}
