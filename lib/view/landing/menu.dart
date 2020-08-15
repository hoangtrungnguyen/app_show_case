import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(fontSize: 32,fontWeight: FontWeight.w500),
      child: Card(
        child: Container(
          color: Colors.blue.withOpacity(0.2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MenuItem(title:"Sản phẩm"),
//                Container(color: Colors.black,width: 1,margin: EdgeInsets.symmetric(vertical: 16),),
                MenuItem(title:"Lớp học"),
//                Container(color: Colors.black,width: 1,margin: EdgeInsets.symmetric(vertical: 16),),
                MenuItem(title:"Đăng ký"),
              ],
            )),
      ),
    );
  }
}

class MenuItem extends StatefulWidget {
  final String title;
  final Function onTap;

  const MenuItem({Key key, this.title, this.onTap}) : super(key: key);

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        child: Text(
          widget.title,
          style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
