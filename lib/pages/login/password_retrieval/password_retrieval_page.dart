import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class PasswordRetrievalPage extends StatelessWidget {
const PasswordRetrievalPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(leading: BackButton(onPressed: () => context.navigateBack()),),
    );
  }
}