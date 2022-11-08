import 'package:flutter/material.dart';
import 'package:multiselect/constants.dart';
import 'package:just_audio/just_audio.dart';
import 'package:getwidget/getwidget.dart';

class mutliselect extends StatefulWidget {
  const mutliselect({super.key});

  @override
  State<mutliselect> createState() => _mutliselectState();
}

class _mutliselectState extends State<mutliselect> {
  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  List _selectedItems = [];
  List<bool> checkBoxesCheckedStates = [];
  // List<bool> read = [true];

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(),
          Container(
            child: ListView.builder(
                itemCount: test.length,
                shrinkWrap: true,
                itemBuilder: (context, int index) {
                  controllers.add(new TextEditingController());
                  checkBoxesCheckedStates.add(false);
                  // read.add(true);
                  var temp = {};
                  bool check = false;
                  return GestureDetector(
                      child: Card(
                    color: (test[index]["actual_qty"] == 1)
                        ? Colors.blue.withOpacity(0.5)
                        : Colors.white,
                    child: GFCheckboxListTile(
                        title: Text(test[index]["name"]),
                        subTitle: TextField(
                          // readOnly: read[index],
                          autofocus: false,
                          controller: controllers[index],
                          onEditingComplete: () {
                            setState(() {
                              // Sample = controllers[index].text.toString();
                              print("valirfldsmf");
                              print(Sample);
                            });
                          },
                          // onChanged: (value) {
                          //   setState(() {
                          //     temp["amt"] = controllers[index].text;
                          //     _selectedItems.add(temp);
                          //   });
                          // },
                        ),
                        value: checkBoxesCheckedStates[index],
                        avatar: Icon(Icons.assignment),
                        size: 20,
                        activeBgColor: Colors.green,
                        type: GFCheckboxType.circle,
                        activeIcon: Icon(
                          Icons.check,
                          size: 16,
                          color: Colors.white,
                        ),
                        onChanged: (bool? value) {
                          print(value);
                          setState(() {
                            if (value == true) {
                              //    setState(() {
                              //   read[index] = false;
                              // });
                              print(_selectedItems);
                              print("valueeeeeeeeeeeeeeee");
                              print(Sample);

                              checkBoxesCheckedStates[index] = value!;
                              temp["name"] = test[index]["name"];
                              temp["amt"] = controllers[index].text;
                              test[index]["actual_qty"] = 1;

                              _selectedItems.add(temp);
                              player.setAsset('assets/audio/ping.mp3');
                              player.play();
                            } else {
                              setState(() {
                                // read[index] = true;
                                controllers[index].text = "";
                              });
                              test[index]["actual_qty"] = 0;
                              checkBoxesCheckedStates[index] = value!;
                              _selectedItems.removeAt(index);
                              print("removeeeeee");
                              print(_selectedItems);
                            }
                          });
                        }),
                  ));
                }),
          ),
        ],
      ),
    );
  }
}
