import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[100],
        body: SafeArea(
          bottom: false,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: const [
                _TopPart(),
                _BottomPart(),
              ],
            ),
          ),
        ));
  }
}

class _BottomPart extends StatelessWidget {
  const _BottomPart();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.asset(
        "assets/img/rsz_result.png",
        scale: 0.5,
      ),
    );
  }
}

class _TopPart extends StatefulWidget {
  const _TopPart();

  @override
  State<_TopPart> createState() => _TopPartState();
}

class _TopPartState extends State<_TopPart> {
  DateTime selectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "U&I",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'parisienne',
              fontSize: 80,
            ),
          ),
          Column(
            children: [
              const Text(
                "우리 처음 만난 날",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'sunflower',
                  fontSize: 30,
                ),
              ),
              Text(
                "${selectedDate.year}.${selectedDate.month}.${selectedDate.day}",
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'sunflower',
                  fontSize: 25,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              showCupertinoDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (BuildContext context) {
                    return Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        color: Colors.white,
                        height: 350,
                        child: CupertinoDatePicker(
                          initialDateTime: selectedDate,
                          maximumDate: DateTime(
                            DateTime.now().year,
                            DateTime.now().month,
                            DateTime.now().day,
                          ),
                          onDateTimeChanged: (value) {
                            setState(() {
                              selectedDate = value;
                            });
                          },
                          mode: CupertinoDatePickerMode.date,
                        ),
                      ),
                    );
                  });
            },
            iconSize: 60,
            icon: const Icon(
              Icons.favorite,
              color: Colors.pink,
            ),
          ),
          Text(
            "D+${DateTime(
                  DateTime.now().year,
                  DateTime.now().month,
                  DateTime.now().day,
                ).difference(selectedDate).inDays + 1}",
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'sunflower',
              fontSize: 50,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
