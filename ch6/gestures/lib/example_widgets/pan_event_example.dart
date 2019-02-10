import 'package:flutter/material.dart';

/**
 * Dragging on the whole container dispatch the pan drag events
 * behaves like a horizontal drag + vertical drag
 */
class PanWidgetExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PanWidgetExampleState();
  }
}

class _PanWidgetExampleState extends State<PanWidgetExample> {
  bool _dragging = false;
  Offset _move = Offset.zero;
  int _dragCount = 0;  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (DragStartDetails details) {
        setState(() {
         _move = Offset.zero;
         _dragging = true; 
        });
      },
      onPanUpdate: (DragUpdateDetails details) {
        setState(() {
         _move += details.delta;
        });
      },
      onPanEnd: (DragEndDetails details) {
        setState(() {          
          _dragging = false;
          _dragCount++;
        });
      },
      child: Container(
        color: Colors.grey,
        child: Center(
          child: Transform.translate(
            offset: _move,
            child: Text(
              _dragging? "DRAGGING!" : "Drags: $_dragCount",
              style: Theme.of(context).textTheme.display1,
            ),
          ),
        ),
      ),
    );
  }
}


/**
 * Horizontal has the same behavior as vertical, the only difference is the axis
 */
class HorizontalDragWidgetExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HorizontalDragWidgetExampleState();
  }
}

class _HorizontalDragWidgetExampleState extends State<HorizontalDragWidgetExample> {
  bool _dragging = false;
  Offset _move = Offset.zero;
  int _dragCount = 0;  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: (DragStartDetails details) {
        setState(() {
         _move = Offset.zero;
         _dragging = true; 
        });
      },
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        setState(() {
         _move += details.delta;
        });
      },
      onHorizontalDragEnd: (DragEndDetails details) {
        setState(() {          
          _dragging = false;
          _dragCount++;
        });
      },
      child: Container(
        color: Colors.grey,
        child: Center(
          child: Transform.translate(
            offset: _move,
            child: Text(
              _dragging? "DRAGGING!" : "Drags: $_dragCount",
              style: Theme.of(context).textTheme.display1,
            ),
          ),
        ),
      ),
    );
  }
}
