import 'package:flutter/material.dart';
import 'package:multiselect/constants.dart';
import 'package:just_audio/just_audio.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:searchfield/searchfield.dart';

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
    screenheight = MediaQuery.of(context).size.height;
    screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff19183e),
          title: Center(
            child: Text(
              '',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: 20, letterSpacing: .2, color: Colors.white),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                          child: GestureDetector(
                        // onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                        child: SearchField(
                          // controller: Branch_mr,
                          suggestions: map
                              .map((String) => SearchFieldListItem(String))
                              .toList(),
                          validator: (x) {
                            if (x!.isEmpty) {
                              return " Branch can't be empty";
                            }

                            return null;
                          },
                          suggestionState: Suggestion.hidden,
                          suggestionDirection: SuggestionDirection.down,

                          textInputAction: TextInputAction.done,
                          hasOverlay: true,
                          searchStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.black.withOpacity(0.8),
                          ),
                          suggestionAction: SuggestionAction.unfocus,

                          searchInputDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                  color: Color(0xff19183e), width: 2.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 197, 188, 188),
                                  width: .5),
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            // hintText: "Branch",
                          ),
                          maxSuggestionsInViewPort: 5,
                          itemHeight: 50,
                        ),
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: ElevatedButton(
                        child: Text(
                          'Submit',
                          style: GoogleFonts.poppins(
                            textStyle:
                                TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff19183e),
                            shadowColor: Color(0xff19183e),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            )),
                        onPressed: () {
                          print('Pressed');
                        },
                      ))
                    ],
                  ),
                ),
              ),
              Container(
                height: screenheight / 1.4,
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
                          child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Card(
                          shape: (test[index]["actual_qty"] == 1)
                              ? new RoundedRectangleBorder(
                                  side: new BorderSide(
                                      color: Colors.blue, width: 2.0),
                                  borderRadius: BorderRadius.circular(4.0))
                              : new RoundedRectangleBorder(
                                  side: new BorderSide(
                                      color: Colors.white, width: 2.0),
                                  borderRadius: BorderRadius.circular(4.0)),
                          child: SizedBox(
                            height: 96,
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
                                      print(Sample);

                                      checkBoxesCheckedStates[index] = value!;
                                      temp["name"] = test[index]["name"];
                                      temp["amt"] = controllers[index].text;
                                      test[index]["actual_qty"] = 1;

                                      _selectedItems.add(temp);
                                      player.setAsset('assets/audio/ping.mp3');
                                      print("valueeeeeeeeeeeeeeee");
                                      print(_selectedItems);
                                      // player.play();
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
                          ),
                        ),
                      ));
                    }),
              ),
              Container(
                  child: ElevatedButton(
                child: Text(
                  'Submit',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff19183e),
                    shadowColor: Color(0xff19183e),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    )),
                onPressed: () {
                  print('Pressed');
                },
              )),
            ],
          ),
        ));
  }
}
