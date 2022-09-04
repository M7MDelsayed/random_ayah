import 'package:flutter/material.dart';
import 'package:random_ayah/build_done.dart';
import 'package:random_ayah/build_loading.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isloading ? const BuildLoading() : const BuildDone(),
    );
  }
}
