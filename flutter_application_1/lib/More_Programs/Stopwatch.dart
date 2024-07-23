import 'package:flutter/cupertino.dart';
import'dart:async';

import 'package:flutter/material.dart';
class Stopwatch extends StatefulWidget {
  const Stopwatch({super.key});

  @override
  State<Stopwatch> createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> {
  int seconds = 0;
  late Timer timer;
  bool _isTicking = true;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1),_ontick);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title :const Text('StopWatch'),
        ),
    
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
       children:[
        Center(
          child: Text(
            '$seconds Second',
             style: Theme.of(context).textTheme.headlineSmall,
             ),
          ),
          const SizedBox(
            height: 20,

          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _isTicking ? null : _starttimer, 
              style: ButtonStyle(
                foregroundColor: 
                WidgetStateProperty.all(Colors.black),
                backgroundColor: 
                WidgetStateProperty.all(Colors.amber)),
                child: const Text("start"),
            ),
             SizedBox(width: 20,),
           ElevatedButton(
              onPressed: _isTicking ? _stoptimer : null,
              style: ButtonStyle(
                foregroundColor: 
                WidgetStateProperty.all(Colors.black),
                backgroundColor: 
                WidgetStateProperty.all(const Color.fromARGB(255, 255, 7, 7))),
                child: const Text("stop"),
               ),
          ],
        )
        ],
        ));
 }

 void _starttimer() {
  timer = Timer.periodic(const Duration(seconds: 1), _ontick);
  setState(() {
    seconds = 0;
    _isTicking = true;
  });
 }

  void _stoptimer() {
  timer.cancel();
  setState(() {
    _isTicking = false;
  });
  }


  void _ontick(Timer timer){
  if (mounted){
  setState(() {
    ++seconds;
  },);
  }
  }


  @override
  void dispose(){
    timer.cancel();
    super.dispose();
  
  }
}