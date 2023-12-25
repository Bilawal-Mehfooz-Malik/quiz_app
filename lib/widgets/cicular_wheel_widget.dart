import 'package:flutter/material.dart';
import '../common/custom_icon_button.dart';

class CicularWheel extends StatelessWidget {
  final bool isplayed;
  final VoidCallback play;
  final VoidCallback stop;
  final VoidCallback details;
  final VoidCallback forwardCallback;
  final VoidCallback reverseCallback;

  const CicularWheel({
    super.key,
    required this.play,
    required this.stop,
    required this.details,
    required this.isplayed,
    required this.forwardCallback,
    required this.reverseCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          GestureDetector(
            child: Container(
              height: 300,
              width: 300,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.background,
            ),
          ),

          //* Top button
          Positioned(
            top: 30,
            child: TextButton(
              onPressed: details,
              child: const Text(
                'Details',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),

          //* bottom button
          CustomIconButton(
            bottom: 25,
            icon: isplayed ? Icons.stop : Icons.play_arrow,
            onPressed: isplayed ? stop : play,
          ),

          //* left button
          CustomIconButton(
            left: 16,
            icon: Icons.fast_rewind,
            onPressed: reverseCallback,
          ),

          //* right button
          CustomIconButton(
            right: 16,
            icon: Icons.fast_forward,
            onPressed: forwardCallback,
          )
        ],
      ),
    );
  }
}
