

import 'package:auth_app/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuhtPage extends ConsumerStatefulWidget {
  const AuhtPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuhtPageState();
}

class _AuhtPageState extends ConsumerState<AuhtPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: Column(
        children: const[
           Text('Weclome to Auth Panel',style:TextStyle(color:greyColor,fontSize: 30)),
           TextField(),
           TextField(),
        ],
      ),
    );
  }
}