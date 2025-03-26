import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.all(80),
          child: Text(
            'Bem-vindo (a)',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        backgroundColor: Color.fromRGBO(255, 156, 230, 1),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          }, 
          icon: Icon(
            Icons.logout,
          )
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'HOME PAGE',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 58,
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),
    );
  }
}