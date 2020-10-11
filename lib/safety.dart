import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class safety extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: Vx.blue800,
        child: VStack(
          [
            "As per WHO"
                .text
                .white
                .xl
                .bold
                .make()
                .box
                .p32
                .alignCenter
                .rounded
                .neumorphic(
                    color: Vx.blue800, elevation: 8, curve: VxCurve.emboss)
                .make(),
            "Most Common Symptoms:\n              Fever\n              Dry Cough\n              Tiredness"
                .text
                .white
                .xl
                .bold
                .make()
                .box
                .width(300)
                .height(200)
                .p32
                .alignCenter
                .rounded
                .neumorphic(
                    color: Vx.blue800, elevation: 8, curve: VxCurve.flat)
                .make(),
            40.heightBox,
            "SERIOUS SYMPTOMS:\n\nDifficulty breathing\nShortness of breath\nChest pain or pressure\nLoss of speech or movement"
                .text
                .white
                .xl
                .bold
                .make()
                .box
                .width(300)
                .height(200)
                .p32
                .alignCenter
                .rounded
                .neumorphic(
                    color: Vx.blue800, elevation: 8, curve: VxCurve.flat)
                .make(),
            40.heightBox,
          ],
          alignment: MainAxisAlignment.center,
          crossAlignment: CrossAxisAlignment.center,
        ).p16(),
      ),
    );
  }
}
