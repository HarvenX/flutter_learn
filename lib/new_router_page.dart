import 'package:flutter/material.dart';

class NewRouterPage extends StatelessWidget {
  const NewRouterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          child: Text("子Widget和父Widget混合联动"),
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
  int statusInt = 0;

  int getStatusInt() {
    return statusInt;
  }

  static _StatusChangeState of(BuildContext context) {
    assert(context != null);
    final _StatusChangeState? result = context.findAncestorStateOfType<_StatusChangeState>();
    if (result != null) return result;
    throw FlutterError.fromParts(<DiagnosticsNode>[
      ErrorSummary(
        'Scaffold.of() called with a context that does not contain a Scaffold.',
      ),
      ErrorDescription(
        'No Scaffold ancestor could be found starting from the context that was passed to Scaffold.of(). '
        'This usually happens when the context provided is from the same StatefulWidget as that '
        'whose build function actually creates the Scaffold widget being sought.',
      ),
      ErrorHint(
        'There are several ways to avoid this problem. The simplest is to use a Builder to get a '
        'context that is "under" the Scaffold. For an example of this, please see the '
        'documentation for Scaffold.of():\n'
        '  https://api.flutter.dev/flutter/material/Scaffold/of.html',
      ),
      ErrorHint(
        'A more efficient solution is to split your build function into several widgets. This '
        'introduces a new context from which you can obtain the Scaffold. In this solution, '
        'you would have an outer widget that creates the Scaffold populated by instances of '
        'your new inner widgets, and then in these inner widgets you would use Scaffold.of().\n'
        'A less elegant but more expedient solution is assign a GlobalKey to the Scaffold, '
        'then use the key.currentState property to obtain the ScaffoldState rather than '
        'using the Scaffold.of() function.',
      ),
      context.describeElement('The context used was'),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ChildWidget(showString: "now Status is $statusInt"),
        ElevatedButton(
          child: Text("Button"),
          onPressed: () {
            setState(() {
              statusInt++;
            });
          },
        ),
        SelfChangeWidget(outClickTime: statusInt)
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
    int _chilkState = _StatusChangeState.of(context).getStatusInt();
    return ElevatedButton(
      child: Text("$_chilkState click self $_selfClickTime"),
      onPressed: () {
        setState(() {
          _selfClickTime++;
        });
      },
    );
  }
}
