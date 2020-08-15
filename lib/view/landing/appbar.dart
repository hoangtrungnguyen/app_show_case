import 'package:flutter/material.dart';

class ShowcaseAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(preferredSize.width, 1000),
      child: Container(
        height: 100,
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 20,),
            Text(
              "EXPLORE",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppBarButton(
                    title: "Discover",
                  ),
                  SizedBox(width: preferredSize.width / 20),
                  AppBarButton(
                    title: "Contact Us",
                  )
                ],
              ),
            ),
            AppBarButton(
              title: "Sign Up",
            ),
            SizedBox(
              width: preferredSize.width / 50,
            ),
            AppBarButton(
              title: "Login",
            )
          ],
        ),
      ),
    );
  }

  ShowcaseAppBar({Key key, @required this.preferredSizeShowCase});

  final Size preferredSizeShowCase;

  @override
  Size get preferredSize => preferredSizeShowCase;
}

class AppBarButton extends StatefulWidget {
  final String title;
  final Function onTap;

  AppBarButton({this.title, this.onTap});

  @override
  _AppBarButtonState createState() => _AppBarButtonState();
}

class _AppBarButtonState extends State<AppBarButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      onTap: widget.onTap ?? () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
//        crossAxisAlignment:CrossAxisAlignment.start ,
      mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title ?? "Null",
            style: TextStyle(color: isHover ? Colors.blue[100] : Colors.white),
          ),
          SizedBox(
            height: 5,
          ),
          // For showing an underline on hover
          Visibility(
            maintainAnimation: true,
            maintainState: true,
            maintainSize: true,
            visible: isHover,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              width: isHover ? 30 : 0,
              child: Container(
                height: 2,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
