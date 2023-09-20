import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery_app/src/presentation/custom_box_shape/widgets/ticket_widget.dart';

@RoutePage()
class CustomBoxShapePage extends StatelessWidget {
  const CustomBoxShapePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom Box Shape")),
      body: const Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TicketWidget(
              image: "assets/images/logo.png",
              title: "GIOITHIEU",
              content: "Giảm giá 12k cho đơn hàng",
              expired: "Kết thúc: 31/12/2021",
            ),
            TicketWidget(
              image: "assets/images/logo.png",
              title: "GIOITHIEU",
              content: "Giảm giá 12k cho đơn hàng",
              expired: "Kết thúc: 31/12/2021",
            ),
            TicketWidget(
              image: "assets/images/logo.png",
              title: "GIOITHIEU",
              content: "Giảm giá 12k cho đơn hàng",
              expired: "Kết thúc: 31/12/2021",
            )
          ],
        ),
      ),
    );
  }
}
