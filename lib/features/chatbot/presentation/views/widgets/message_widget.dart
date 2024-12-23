import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({super.key, required this.message, required this.isFromUser});
  final String message;
  final bool isFromUser;


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isFromUser ? Alignment.centerRight: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isFromUser?Colors.green:Colors.grey.shade800,
          borderRadius: BorderRadius.circular(8),
        ),
        child:   Text(
          message,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),

        // child:  Column(
        //   children: [
        //     Text(
        //       message,
        //       style: TextStyle(color: Colors.white, fontSize: 16),
        //     ),
        //
        //     Visibility(visible: !isFromUser,child: const SizedBox(height: 8)),
        //     Visibility(
        //       visible: !isFromUser,
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.end,
        //         children: [
        //           IconButton(
        //             icon:
        //             const Icon(Icons.thumb_up, color: Colors.white),
        //             onPressed: () {},
        //           ),
        //           IconButton(
        //             icon: const Icon(Icons.thumb_down,
        //                 color: Colors.white),
        //             onPressed: () {},
        //           ),
        //           IconButton(
        //             icon: const Icon(Icons.copy, color: Colors.white),
        //             onPressed: () {},
        //           ),
        //         ],
        //       ),
        //     )
        //   ],
        // ),
      ),
    );
  }
}
