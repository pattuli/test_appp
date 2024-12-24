import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   late final XFile? image;
    ImagePicker _picker = ImagePicker();
    Future<void> pickImage()async{
   
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      image = image;
    }
    Future<void> uploadPhoto() async{
             var response = await http.post(Uri.parse("https://interview-mock-api.onrender.com/upload"),
        body: ({
          'image': image,
        })
        );
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
      child: FloatingActionButton(onPressed: (){
         pickImage();
      }),
     ),
    );
  }
}