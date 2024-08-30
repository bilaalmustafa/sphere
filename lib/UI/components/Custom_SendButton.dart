import 'package:flutter/material.dart';
import 'package:sphere/core/constants/Const_Colors.dart';

class SendButton extends StatelessWidget {
  const SendButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(color: ConstColors.blackColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Icon(
        Icons.send_and_archive_outlined,
        color: ConstColors.blackColor,
      ),
    );
  }
}
