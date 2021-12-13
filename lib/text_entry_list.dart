import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:get/get.dart';
import 'common/route_list.dart';

class TextEntryList extends StatefulWidget {
  @override
  _TextEntryListState createState() => _TextEntryListState();
}

class _TextEntryListState extends State<TextEntryList> {
  // Controller
  late ExpandedTileController _controller;

  void initState() {
    // initialize controller
    _controller = ExpandedTileController(isExpanded: false);
    super.initState();
  }

  List<Map> crateList = [
    {
      'caratename': 'L1',
      'status': 'pending',
    },
    {
      'caratename': 'L2',
      'status': 'pending',
    },
    {
      'caratename': 'L3',
      'status': 'pending',
    },
    {
      'caratename': 'L4',
      'status': 'pending',
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child:
            //* Seperate usage of a tile.
            Column(
          children: [
            //* Starting V0.3.4 : ExpandedTileList.builder widget is available.
            ExpandedTileList.builder(
              itemCount: 4,
              maxOpened: 1,
              reverse: false,
              itemBuilder: (context, index, controller) {
                return ExpandedTile(
                  theme: const ExpandedTileThemeData(
                    headerColor: Colors.grey,
                    headerRadius: 24.0,
                    headerPadding: EdgeInsets.all(24.0),
                    //headerSplashColor: Colors.red,

                    contentBackgroundColor: Colors.grey,
                    contentPadding: EdgeInsets.all(24.0),
                    contentRadius: 12.0,
                  ),
                  controller: _controller.isExpanded
                      ? controller.copyWith(isExpanded: true)
                      : controller,
                  title: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(' CARATE ' +  crateList[index]['caratename']),
                      Text(crateList[index]['status']),

                    ],
                  ),

                  content: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'CARATE ${crateList[index]['caratename']}',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          Container(
                            height: 30,
                            width: 50,
                            color: Colors.red,
                            child: const InkWell(
                              child: Center(
                                child: Text(
                                  'SCAN',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Container(
                        height: 28,
                        width: Get.mediaQuery.size.width,
                        color: Colors.white,
                        child: const Center(
                          child: Text(
                            'TYPE BAR CODE',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Container(
                        height: 28,
                        width: Get.mediaQuery.size.width,
                        color: Colors.white,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                'CHOOSE SIZE',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Center(
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    size: 30,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    debugPrint('tapped!!');
                  },
                  onLongTap: () {
                    debugPrint('looooooooooong tapped!!');
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
