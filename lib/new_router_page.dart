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
        Text("now Status is $_statusInt"),
        ElevatedButton(
          child: Text("Button"),
          onPressed: () {
            setState(() {
              _statusInt++;
            });
          },
        )
      ],
    );
  }
}
