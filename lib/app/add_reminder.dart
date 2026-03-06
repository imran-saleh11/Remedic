import 'package:flutter/material.dart';

class AddReminderScreen extends StatefulWidget {
  const AddReminderScreen({super.key});

  @override
  State<AddReminderScreen> createState() => _AddReminderScreenState();
}

class _AddReminderScreenState extends State<AddReminderScreen> {
  bool _isSwitcher = false;
  final int _counter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 31),
          margin: EdgeInsets.only(top: 31, bottom: 12), // later
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 300,
                    height: 80,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Add title',
                        hintStyle: TextStyle(
                          color: Colors.grey[230],
                        ),
                        filled: false,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none
                        ),
                      ),
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isSwitcher = !_isSwitcher;
                      });
                    },
                    child: AnimatedContainer(
                      width: 60,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[700],
                      ),
                      duration: Duration(milliseconds: 200),
                      child: AnimatedAlign(
                        alignment: _isSwitcher ? Alignment.centerRight : Alignment.centerLeft,
                        duration: Duration(milliseconds: 299),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.grey[500],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            _isSwitcher ? Icons.check : Icons.calendar_month,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 3,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                ),
              ),
              Row(
                children: [
                  SizedBox(height: 90),
                  Text("Quantity",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[300],
                    ),
                  ),
                  Spacer(),
                  _Stepper(),
                ],
              ),
              Row(
                children: [
                  SizedBox(height: 20),
                  Text("Type",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[300],
                    ),
                  ),
                  Spacer(),
                  // Drawer
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text("Doses",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[300],
                    ),
                  ),
                  Spacer(),
                  _Stepper(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class _Stepper extends StatefulWidget {
  const _Stepper({super.key});

  @override
  State<_Stepper> createState() => _StepperState();
}

class _StepperState extends State<_Stepper> {
  int _step = 0;

  void _stepUp() {
    setState(() {
      _step++;
    });
  }
  void _stepDown() {
    setState(() {
      _step--;
      if(_step < 0) _step = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.grey[900],
          ),
          child: IconButton(
            icon: Icon(
              Icons.remove,
              color: Colors.white,
              size: 20,
            ),
            onPressed: _stepDown,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          margin: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            '$_step',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.grey[900],
          ),
          child: IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
              size: 20,
            ),
            onPressed: _stepUp,
          ),
        ),
      ],
    );
  }
}