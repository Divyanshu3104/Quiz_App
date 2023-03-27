import 'package:assignment/Screens/HomeScreen.dart';
import 'package:assignment/UI/Drawerdata.dart';
import 'package:assignment/UI/Entrypagedata.dart';
import 'package:flutter/material.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key});

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            iconTheme: const IconThemeData(color: Colors.black),
          ),
          drawer: Drawer(
              // backgroundColor: const Color.fromARGB(255, 11, 220, 248),
              child: ListView(
            children: [DrawerData()],
          )),
          body: EntryPageData()),
    );
  }
}
