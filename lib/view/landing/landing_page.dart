import 'package:appshowcase/view/landing/appbar.dart';
import 'package:appshowcase/view/landing/menu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    print("width ${MediaQuery.of(context).size.width}");
    var screenSize = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: ShowcaseAppBar(preferredSizeShowCase: screenSize,),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: screenSize.height*0.8,
                  child: Stack(
                    children: [
                      Positioned(
                        height: screenSize.height * 0.6,
                        width: screenSize.width,
                        child: Container(decoration: BoxDecoration(
                            color: Colors.blue,

                            image: DecorationImage( fit: BoxFit.cover, image: AssetImage('images/image_cover_fl.jpg',),)),
                          height: screenSize.height/3*2,
                          child: Container(color: Colors.black.withOpacity(0.3),
                          ),
                        ),
                      ),
                      Positioned(
                        top: screenSize.height * 0.55,
                        height: screenSize.height * 0.15,
                        right: screenSize.width/4,
                        left: screenSize.width/4,
                        child: Menu()
                      ),

                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Featured',
                      style: GoogleFonts.montserrat(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Unique wildlife tours & destinations',
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ListActionButtons extends StatefulWidget {
  @override
  _ListActionButtonsState createState() => _ListActionButtonsState();
}

class _ListActionButtonsState extends State<ListActionButtons> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 1300)
          return Row(
            children: [
              ActionButton(
                onPressed: () {},
                label: "Liên hệ",
                icon: Icons.email,
              ),
              ActionButton(
                onPressed: () {},
                label: "Lịch học",
                icon: Icons.calendar_today,
              ),
              ActionButton(
                onPressed: () {},
                label: "Giảng viên",
                icon: Icons.people,
                padding:
                    EdgeInsets.only(top: 16, right: 64, left: 8, bottom: 16),
              ),
            ],
          );
        else
          return IconButton(icon: Icon(Icons.menu), onPressed: () {});
      },
    );
  }
}

class ActionButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final Function onPressed;
  final EdgeInsets padding;

  ActionButton(
      {Key key,
      @required this.label,
      @required this.icon,
      @required this.onPressed,
      this.padding})
      : super(key: key);

  @override
  _ActionButtonState createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  final Color color = Colors.white.withOpacity(0.8);
  Color hoverColor = Colors.indigo;
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          widget.padding ?? EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: MouseRegion(
        onHover: (event) {
          setState(() {
            isHover = true;
          });
        },
        onExit: (event) {
          setState(() {
            isHover = false;
          });
        },
        child: FlatButton.icon(
            onPressed: widget.onPressed,
            icon: Icon(
              widget.icon,
              color: color,
            ),
            label: Container(
                child: Text("${widget.label}",
                    style: TextStyle(
                      color: color,
                    )))),
      ),
    );
  }
}
