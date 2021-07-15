import 'package:flutter/material.dart';

import 'modle/testData.dart';

class MyProvider extends ChangeNotifier{
  List<DataTest> data = [
    DataTest(id: 1,name: "name1",isFav: false),
    DataTest(id: 2,name: "name4",isFav: false),
    DataTest(id: 3,name: "name3",isFav: false),
    DataTest(id: 4,name: "name4",isFav: false),
  ];

  String text = 'init';
  changeTextHere(String value){
    text = value;
    notifyListeners();
  }
  changeFavHere(int index){
    if(data[index].isFav){
      data[index].isFav = false;
    }else {
      data[index].isFav = true;
    }
    notifyListeners();
  }
}