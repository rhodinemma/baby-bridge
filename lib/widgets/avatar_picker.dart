import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AvatarPicker extends StatefulWidget {
  const AvatarPicker({Key? key}) : super(key: key);

  @override
  State<AvatarPicker> createState() => _AvatarPickerState();
}

class _AvatarPickerState extends State<AvatarPicker> {
  // This is the file that will be used to store the image
  File? _image;
  // This is the image picker
  final _picker = ImagePicker();
  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
    await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: _openImagePicker,
          child: CircleAvatar(
            backgroundColor: Colors.teal,
            radius: 75,
            backgroundImage: _image != null ? FileImage(_image!) : null,
            child: _image == null
                ? const Icon(
              Icons.camera_alt,
              size: 50,
            )
                : null,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Tap to upload a photo',
          style: TextStyle(fontSize: 16),
        ),
        Text(_image.toString(), style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
