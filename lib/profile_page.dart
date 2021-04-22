import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'about.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isOpen = false;
  PanelController _panelController = PanelController();
  var _imageList = [
    'images/1.jpg',
    'images/2.jpg',
    'images/3.jpg',
    'images/4.jpg',
    'images/5.jpg',
    'images/6.jpg',
    'images/7.jpg',
    'images/8.jpg',
    'images/9.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: 0.7,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/profile.jfif'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.3,
            child: Container(
              color: Colors.white,
            ),
          ),

          /// Sliding Panel
          SlidingUpPanel(
            controller: _panelController,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(32),
              topLeft: Radius.circular(32),
            ),
            minHeight: MediaQuery.of(context).size.height * 0.35,
            maxHeight: MediaQuery.of(context).size.height * 0.85,
            body: GestureDetector(
              onTap: () => _panelController.close(),
              child: Container(
                color: Colors.transparent,
              ),
            ),
            panelBuilder: (ScrollController controller) =>
                _panelBody(controller),
            onPanelSlide: (value) {
              if (value >= 0.2) {
                if (!_isOpen) {
                  setState(() {
                    _isOpen = true;
                  });
                }
              }
            },
            onPanelClosed: () {
              setState(() {
                _isOpen = false;
              });
            },
          ),
        ],
      ),
    );
  }

  SingleChildScrollView _panelBody(ScrollController controller) {
    double hPadding = 40;

    return SingleChildScrollView(
      controller: controller,
      physics: ClampingScrollPhysics(),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: hPadding),
            height: MediaQuery.of(context).size.height * 0.35,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _titleSection(),
                // _infoSection(),
                _actionSection(hPadding: hPadding),
              ],
            ),
          ),
          SafeArea(
            child: GridView.builder(
              primary: false,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: _imageList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 9,
              ),
              itemBuilder: (BuildContext context, int index) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(_imageList[index]),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Action Section
  Row _actionSection({double hPadding}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Visibility(
          visible: !_isOpen,
          child: Expanded(
            child: OutlineButton(
              onPressed: () => _panelController.open(),
              borderSide: BorderSide(color: Colors.blue),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Text(
                'Members',
                style: TextStyle(
                  fontFamily: 'NimbusSanL',
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: !_isOpen,
          child: SizedBox(
            width: 16,
          ),
        ),
        
          OutlineButton(
            onPressed:  () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => About())),
            borderSide: BorderSide(color: Colors.blue),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
            child: Text(
              'Team',
              style: TextStyle(
                fontFamily: 'NimbusSanL',
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        
      ],
    );
  }

  /// Title Section
  Column _titleSection() {
    return Column(
      children: <Widget>[
        Text(
          'BIG FOOT',
          style: TextStyle(
            fontFamily: 'NimbusSanL',
            fontWeight: FontWeight.w700,
            fontSize: 60,
          ),
        ),
        SizedBox(
          height: 0,
        ),
        Text(
          'Together We Stand,Best accompanies',
          style: TextStyle(
            fontFamily: 'NimbusSanL',
            fontStyle: FontStyle.italic,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
