import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphere/UI/components/Custom_BottomNavigationBar.dart';
import 'package:sphere/UI/screens/BottomNavigationBar_Screen/Bottom_ControllerProvider.dart';
import 'package:sphere/core/constants/Const_Colors.dart';

class NevigationBottomScreen extends StatefulWidget {
  const NevigationBottomScreen({super.key});

  @override
  State<NevigationBottomScreen> createState() => _NevigationBottomState();
}

class _NevigationBottomState extends State<NevigationBottomScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomControllerProvider>(context);

    return Scaffold(
      backgroundColor: ConstColors.thirdColor,
      body: provider.screens[provider.selectItem],
      bottomNavigationBar: const BottomNavigationBarScreen(),
    );
  }
}
