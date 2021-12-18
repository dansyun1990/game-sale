import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
            decoration: InputDecoration(
          label: Text('user'),
        )),
        TextField(
          decoration: InputDecoration(
            label: Text('password'),
          ),
        )
      ],
    );
  }
}
