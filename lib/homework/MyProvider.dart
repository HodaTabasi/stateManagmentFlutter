import 'package:flutter/material.dart';
import 'package:state_managment/homework/product_model.dart';

class MyProvider extends ChangeNotifier {
  List<ProductModel> dataFav = [];

  List<ProductModel> data = [
    ProductModel(
        id: 1,
        name: "name1",
        isFav: false,
        imageUrl:
            'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
    ProductModel(
        id: 2,
        name: "name4",
        isFav: false,
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1280px-Image_created_with_a_mobile_phone.png'),
    ProductModel(
        id: 3,
        name: "name3",
        isFav: false,
        imageUrl:
            'https://filedn.com/ltOdFv1aqz1YIFhf4gTY8D7/ingus-info/BLOGS/Photography-stocks3/stock-photography-slider.jpg'),
    ProductModel(
        id: 4,
        name: "name4",
        isFav: false,
        imageUrl:
            'https://images.unsplash.com/photo-1612151855475-877969f4a6cc?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aGQlMjBpbWFnZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80'),
    ProductModel(
        id: 5,
        name: "name5",
        isFav: false,
        imageUrl:
            'https://www.publicdomainpictures.net/pictures/320000/nahled/background-image.png'),
    ProductModel(
        id: 6,
        name: "name6",
        isFav: false,
        imageUrl:
            'https://media-exp1.licdn.com/dms/image/C4D1BAQHt5jcoqtEWIg/company-background_10000/0/1617264177780?e=2159024400&v=beta&t=T2fcYwGlPmcbM1ihTzLW57yZneMMYe34tRAWjYnU3wY'),
  ];

  String text = 'init';

  changeTextHere(String value) {
    text = value;
    notifyListeners();
  }

  favProduct() {
    dataFav = data.where((element) => element.isFav).toList();
    notifyListeners();
  }

  addToFav(ProductModel model) {
    int index = data.indexOf(model);
    data[index].isFav = !data[index].isFav;
    favProduct();
  }

  changeFavHere(int index) {
    if (data[index].isFav) {
      data[index].isFav = false;
    } else {
      data[index].isFav = true;
    }
    notifyListeners();
  }
}
