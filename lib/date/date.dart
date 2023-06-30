import 'package:flutter/material.dart';


class Date extends StatefulWidget {
  const Date({Key key}) : super(key: key);

  @override
  State<Date> createState() => _DateState();
}
class _DateState extends State<Date> {
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${date.day}/${date.month}/${date.year}',
              style: TextStyle(
                fontSize: 30,
                color: Colors.amber,
              ),

            ),
    MaterialButton(
    child: Text("Select a date",
    style: TextStyle(
      fontSize: 30,
    ),

    ),
    onPressed: ()async {
      DateTime newDate = await showDatePicker(context: context,
          initialDate: date,
          firstDate: DateTime(200),
          lastDate: DateTime(2100)
      );
      setState(() {
        date = newDate;
      });
      if (newDate == null ) return ;
      date = newDate;
    }
    ),

          ],
        ),

      ),

    );
  }
}
