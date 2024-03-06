import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({super.key, this.pickedImage, required this.function});

  final XFile? pickedImage;
  final void Function() function;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Center(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              // ignore: unnecessary_null_comparison
              child: (pickedImage == null)
                  ? Container(
                      width: size.width * 0.3,
                      height: size.width * 0.3,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(8)),
                    )
                  : Image.file(
                      width: size.width * 0.3,
                      height: size.width * 0.3,
                      File(pickedImage!.path),
                      fit: BoxFit.fill,
                    ),
            ),
          ),
          Positioned(
            top: 1,
            right: 1,
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: function,
              child: const CircleAvatar(
                backgroundColor: Colors.cyan,
                child: Icon(Icons.add_a_photo),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
