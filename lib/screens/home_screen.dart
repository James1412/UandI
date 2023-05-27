import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  @override
  Widget build(BuildContext context) {
    onHeartPressed() {
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
    }

    return Scaffold(
        backgroundColor: Colors.pink[100],
        body: SafeArea(
          bottom: false,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                _TopPart(
                  selectedDate: selectedDate,
                  onPressed: onHeartPressed,
                ),
                const _BottomPart(),
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

class _TopPart extends StatelessWidget {
  final DateTime selectedDate;
  final VoidCallback onPressed;

  const _TopPart(
      {required this.selectedDate, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "U&I",
            style: theme.textTheme.displayLarge,
          ),
          Column(
            children: [
              Text(
                "우리 처음 만난 날",
                style: theme.textTheme.bodyLarge,
              ),
              Text(
                "${selectedDate.year}.${selectedDate.month}.${selectedDate.day}",
                style: theme.textTheme.displayMedium,
              ),
            ],
          ),
          IconButton(
            onPressed: onPressed,
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
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
