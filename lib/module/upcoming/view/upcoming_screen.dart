import 'package:clone_mtix/module/upcoming/bloc/upcoming_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clone_mtix/module/upcoming/view/export.dart';

import '../../../model/movie/movie_model.dart';

class UpcomingScreen extends StatefulWidget {
  const UpcomingScreen({super.key});

  @override
  State<UpcomingScreen> createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends State<UpcomingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UpcomingBody(),
    );
  }
}
