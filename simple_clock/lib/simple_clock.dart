import 'dart:async';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SimpleClockPage extends StatefulWidget {
  @override
  _SimpleClockPageState createState() => _SimpleClockPageState();
}

class _SimpleClockPageState extends State<SimpleClockPage> {

  String _hourString="";
  String _minuteString="";
  String _secondsString="";
  String _dayString="";
  String _aMpMString="";
  int year=0;
  int weekday=0;
  int month=0;
  int day=0;
  bool _status = false;



  void initState() {
    _hourString = "${DateFormat("hh").format(DateTime.now())}";
    _minuteString = "${DateFormat("mm").format(DateTime.now())}";
    _secondsString = "${DateFormat("ss").format(DateTime.now())}";
    _aMpMString = "${(DateTime.now().hour>=12)?"P.M":(DateTime.now().hour==0)?"A.M":"A.M"}";
    setDate();
    _status = true;
    Timer.periodic(Duration(seconds:1), (Timer t)=>_getCurrentTime());

    super.initState();

  }


  void setDate(){
    weekday=DateTime.now().weekday;
    month=DateTime.now().month;
    year=DateTime.now().year;
    String monthNew;
    String dayNew;
    switch(month){
      case 1:monthNew = "JAN"; break;
      case 2:monthNew = "FEB"; break;
      case 3:monthNew = "MAR"; break;
      case 4:monthNew = "APR"; break;
      case 5:monthNew = "MAY"; break;
      case 6:monthNew = "JUN"; break;
      case 7:monthNew = "JUL"; break;
      case 8:monthNew = "AUG"; break;
      case 9:monthNew = "SEP"; break;
      case 10:monthNew = "OCT"; break;
      case 11:monthNew = "NOV"; break;
      case 12:monthNew = "DEC"; break;
      default:monthNew="JAN"; break;

    }
    switch(weekday){
      case 1:dayNew = "MON"; break;
      case 2:dayNew = "TUE"; break;
      case 3:dayNew = "WED"; break;
      case 4:dayNew = "THU"; break;
      case 5:dayNew = "FRI"; break;
      case 6:dayNew = "SAT"; break;
      case 7:dayNew = "SUN"; break;
      default:dayNew="MON"; break;
    }
    _dayString = dayNew+" "+"${DateTime.now().day}"+" "+monthNew;
    day=DateTime.now().day;
  }

  void _getCurrentTime()  {
    setState(() {
      _hourString = "${DateFormat("hh").format(DateTime.now())}";
      _minuteString = "${DateFormat("mm").format(DateTime.now())}";
      _secondsString = "${DateFormat("ss").format(DateTime.now())}";
      _aMpMString = "${(DateTime.now().hour>=12)?"P.M":(DateTime.now().hour==0)?"A.M":"A.M"}";
      if(DateTime.now().day!=day){
        setDate();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:(_status==false)?Center(child: CircularProgressIndicator(),): Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_hourString,style: TextStyle(color: Colors.white,fontSize:150.0 ,fontWeight: FontWeight.normal),),
            SizedBox(width: 20.0,),
            Text(_minuteString,style: TextStyle(color: Colors.white,fontSize:125.0 ,fontWeight: FontWeight.normal),),
            SizedBox(width: 15.0,),
            Text(_secondsString,style: TextStyle(color: Colors.white,fontSize:100.0 ,fontWeight: FontWeight.normal),),
            SizedBox(width: 10.0,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[

                Text(_aMpMString,style: TextStyle(color: Colors.white,fontSize:35.0 ,fontWeight: FontWeight.normal,),),
                Text(_dayString,style: TextStyle(color: Colors.white,fontSize:15.0 ,fontWeight: FontWeight.normal,),),
                Text(year.toString(),style: TextStyle(color: Colors.white,fontSize:15.0 ,fontWeight: FontWeight.normal,),),
              ],
            ),



          ],
        ),
      ),
    );
  }
}
