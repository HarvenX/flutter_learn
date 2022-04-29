import 'package:flutter/material.dart';

class NewRouterPage extends StatelessWidget {
  const NewRouterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          child: Text("New route"),
          onTap: () {
            print("Title Click");
          },
        ),
      ),
      body: Center(
        child: ChangeStatusText(),
      ),
    );
  }
}

class ChangeStatusText extends StatefulWidget {
  const ChangeStatusText({Key? key}) : super(key: key);

  @override
  State<ChangeStatusText> createState() {
    return _StatusChangeState();
  }
}

class _StatusChangeState extends State<ChangeStatusText> {
  int _statusInt = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ChildWidget(showString: "now Status is $_statusInt"),
        ElevatedButton(
          child: Text("Button"),
          onPressed: () {
            setState(() {
              _statusInt++;
            });
          },
        ),
        SelfChangeWidget(outClickTime: _statusInt)
      ],
    );
  }
}

class ChildWidget extends StatelessWidget {
  final String showString;

  ChildWidget({Key? key, this.showString: "Child "}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("Child data : $showString");
  }
}

class SelfChangeWidget extends StatefulWidget {
  final int outClickTime;
  const SelfChangeWidget({Key? key, this.outClickTime = 0}) : super(key: key);

  @override
  State<SelfChangeWidget> createState() {
    return _selfState(outClickTime);
  }
}

class _selfState extends State<SelfChangeWidget> {
  int _selfClickTime = 0;
  int _outClickTime = 0;

  _selfState(this._outClickTime);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text("$_outClickTime  click self $_selfClickTime"),
      onPressed: () {
        setState(() {
          _selfClickTime++;
        });
      },
    );
  }
}
