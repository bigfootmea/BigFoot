import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            SafeArea(
              child: Text(
                '\n\n\nIn this pandemic situation it is a hepatic task  to reach each and every members of the society.So here we BIGFOOTians started our presence socially.\n\n',
                style: TextStyle(
                  fontFamily: 'NimbusSanL',
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            TextButton(
                child: Text(
                    'LinkedIn : \n https://www.linkedin.com/in/big-foot-5a3229210',
                    textAlign: TextAlign.left),
                onPressed: () => linkedIn()),
            TextButton(
                child: Text(
                    '   Instagram: \n   https://www.instagram.com/b_i_g_foot?r=nametag',
                    textAlign: TextAlign.left),
                onPressed: () => instagram()),
            TextButton(
                child: Text(
                    '       Facebook page: \nhttps://www.facebook.com/Big-Foot-101808942055198/',
                    textAlign: TextAlign.left),
                onPressed: () => instagram()),
            SafeArea(
              child: Text(
                '\n\nBIGFOOT are actually a problem solution firm working as an intern for BMW. Evenif we carry over an automobile intern, Our 9 membered team are so enthusiastic and determined to reach the unreach. \nFeel free to reach us either through social networks or \n\nemail us : bigfootmea@gmail.com\n\nPhone us : 7592868515',
                style: TextStyle(
                  fontFamily: 'NimbusSanL',
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

linkedIn() async {
  const Url = 'https://www.linkedin.com/in/big-foot-5a3229210';
  if (await canLaunch(Url)) {
    await launch(Url, forceSafariVC: false);
  } else {
    throw 'could not launch $Url';
    //print(Text('cant download'));
  }
}

instagram() async {
  const Url = 'https://www.instagram.com/b_i_g_foot?r=nametag';
  if (await canLaunch(Url)) {
    await launch(Url, forceSafariVC: false);
  } else {
    throw 'could not launch $Url';
    //print(Text('cant download'));
  }
}

facebook() async {
  const Url = 'https://www.facebook.com/Big-Foot-101808942055198/';
  if (await canLaunch(Url)) {
    await launch(Url, forceSafariVC: false);
  } else {
    throw 'could not launch $Url';
    //print(Text('cant download'));
  }
}
