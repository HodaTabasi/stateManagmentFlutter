import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment/MyProvider.dart';
import 'package:state_managment/items/Item.dart';

import 'modle/testData.dart';

class page1 extends StatefulWidget {
  @override
  _page1State createState() => _page1State();
}

class _page1State extends State<page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: listView(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.ac_unit),label: "home"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "fav"),
          ],
        ),

        //     Text(Provider.of<MyProvider>(context).text),
        //     ElevatedButton(
        //         onPressed: () {
        //           Provider.of<MyProvider>(context, listen: false)
        //               .changeTextHere('my init11');
        //         },
        //         child: Text('change to'))
        //   ],
        // )
        );
  }

  listView() {
    return ListView.builder(
      itemCount: Provider.of<MyProvider>(context).data == null
          ? 0
          : Provider.of<MyProvider>(context).data.length,
      itemBuilder: (context, index) {
        return Item(index);
      },
    );
  }
}
