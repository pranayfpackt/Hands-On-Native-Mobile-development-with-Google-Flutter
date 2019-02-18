import 'package:flutter/material.dart';

void main() => runApp(MyAppDefaultTheme()); // default theme
//  void main() => runApp(MyAppCustomTheme()); 
//  void main() => runApp(MaterialAppDefaultTheme()); 

class MyAppDefaultTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: Text(
          "Simple Text",
          textDirection: TextDirection.ltr,
          style: Theme.of(context).textTheme.display1,
        ),
      ),
    );
  }
}

class MyAppCustomTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Theme(
          data: Theme.of(context).copyWith(
            textTheme: Theme.of(context).textTheme.copyWith(
                  display1: TextStyle(
                    color: Colors.yellow,
                  ),
                ),
          ),
          child: Builder(
            builder: (context) => Text(
                  "Simple Text",
                  textDirection: TextDirection.ltr,
                  style: Theme.of(context).textTheme.display1,
                ),
          ),
        ),
      ),
    );
  }
}

class MaterialAppDefaultTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(                
      home: Container(
        color: Colors.white,
        child: Center(
          child: Text(
            "Simple Text",
            // textDirection: TextDirection.ltr, don't need, materialapp does the job
          ),
        ),
      ),
    );
  }
}

