import 'package:flutter/material.dart';

import '../MyProvider.dart';
import 'package:provider/provider.dart';

class Item extends StatelessWidget {
  int index = 0;

  Item(this.index);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListTile(
        title: Text(Provider.of<MyProvider>(context).data[index].name),
        trailing: InkWell(
            onTap: () {
              Provider.of<MyProvider>(context, listen: false)
                  .changeFavHere(index);
            },
            child: Icon(Provider.of<MyProvider>(context, listen: false)
                    .data[index]
                    .isFav
                ? Icons.favorite
                : Icons.favorite_border)),
      ),
    );
  }
}
