import 'package:flutter/material.dart';

class VerifiedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

       body:  new Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: <Widget>[
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: new Text('Enter your mobile number',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
           ),
           Padding(
             padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
             child: Text(
               "We'll send you a sms,please enter a valid phone number to verify you",
               textAlign: TextAlign.center,
             ),
           ),
            _textField(),
           _resendSMS(),
           _buildButton(),

         ],
       ),
      ),
    );
  }
  Widget _textField(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: new TextField(
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "WorkSansSemiBold",
                  fontSize: 16.0,
                  color: Colors.black),

              decoration: InputDecoration(
                //border: InputBorder.none,
                hintText: "123 - 456",
                hintStyle: TextStyle(
                  color: Colors.black45,
                  wordSpacing: 2.0,
                  fontFamily: "WorkSansSemiBold",
                  fontSize: 28.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
  Widget _resendSMS(){
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right:20.0,bottom: 30.0,left: 20.0),
          child: InkWell(
            onTap: (){

            },
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Icon(Icons.chat_bubble,color: Colors.black45,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text('Resend SMS',style: TextStyle(color: Colors.black45),),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildButton() {
    return Center(
      child: Container(
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: const Color(0x609968f8),
              offset: Offset(1.0, 6.0),
              blurRadius: 5.0,
            ),
          ],
          gradient: new LinearGradient(
              colors: [
                const Color(0xFF898dfb),
                const Color(0x809968f8),
              ],
              begin: const FractionalOffset(0.2, 0.2),
              end: const FractionalOffset(1.0, 1.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: MaterialButton(
            highlightColor: Colors.transparent,
            splashColor: const Color(0xFF9968f8),
            //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 20.0, horizontal: 100.0),
              child: Text(
                "  Verify  ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: "WorkSansNormal"),
              ),
            ),
            onPressed: () => print("Verify button pressed")),
      ),
    );
  }

}
