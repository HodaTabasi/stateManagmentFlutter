import 'package:flutter/material.dart';
import 'package:state_managment/homework/MyProvider.dart';
import 'package:state_managment/homework/product_model.dart';
import 'package:state_managment/homework/product_widget.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyProvider>(
      create: (BuildContext context) => MyProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return DefaultTabController(
      child: Scaffold(
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text("state management"),
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Icon(Icons.home),
                ),
                Tab(
                  child: Icon(Icons.favorite),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: listView(Provider.of<MyProvider>(context).data),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: listView(Provider.of<MyProvider>(context).dataFav),
              ),
            ],
          ) // This trailing comma makes auto-formatting nicer for build methods.
          ),
    );
  }

  listView(List<ProductModel> data) {
    return ListView.builder(
      itemCount: data == null
          ? 0
          : data.length,
      itemBuilder: (context, index) {
        return ProductWidget(data[index].id);
      },
    );
  }
}
