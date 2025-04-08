import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';
import 'package:image/image.dart' as img;



class ResultListViewItem extends StatefulWidget {
  const ResultListViewItem({
    super.key,
    required this.text1,
    required this.text2,
    required this.image,
    this.file, required this.numberOfModel,
  });

  final String text1, text2, image;
  final File? file;
  final int numberOfModel;

  @override
  State<ResultListViewItem> createState() => _ResultListViewItemState();
}

class _ResultListViewItemState extends State<ResultListViewItem> {

  String? text;
   bool loading= false;

  Future<List<List<List<double>>>> preprocessImage(File file) async {
    // Load the image file
    final imageBytes = file.readAsBytesSync();
    final img.Image? image = img.decodeImage(imageBytes);

    if (image == null) {
      throw Exception("Failed to decode image.");
    }

    // Resize the image to the required size (e.g., 224x224)
    final img.Image resizedImage = img.copyResize(image, width: 224, height: 224);

    // Normalize the image data to [0, 1] and convert to a 3D list
    return List.generate(
      224,
          (y) => List.generate(
        224,
            (x) {
          final pixel = resizedImage.getPixel(x, y);
          final r = img.getRed(pixel) / 255.0;
          final g = img.getGreen(pixel) / 255.0;
          final b = img.getBlue(pixel) / 255.0;
          return [r, g, b];
        },
      ),
    );
  }

  /// Run the TensorFlow Lite model
  Future<void> runModel(File imageFile) async {
    final Interpreter interpreter;
    try {
      // Load the TensorFlow Lite model
      if(widget.numberOfModel==1){
        interpreter = await Interpreter.fromAsset('assets/converted_model.tflite');

      }else if(widget.numberOfModel == 2){
        interpreter = await Interpreter.fromAsset('assets/converted_Inception_model.tflite');

      }else{
        interpreter = await Interpreter.fromAsset('assets/converted_ResNet50_model.tflite');

      }

      // Preprocess the image
      final input = await preprocessImage(imageFile);

      // Prepare input tensor: Add a batch dimension
      final inputTensor = [input];

      // Define output tensor shape based on your model's output (22 classes)
      final outputTensor = List.filled(22, 0.0).reshape([1, 22]);

      // Run inference
      interpreter.run(inputTensor, outputTensor);

      // Output the results
      final probabilities = outputTensor[0] as List<double>;
      final predictedIndex = probabilities.indexOf(probabilities.reduce((a, b) => a > b ? a : b));


      text= 'Predicted Class $predictedIndex';
      setState(() {

      });
      print('Predicted Class: $predictedIndex');
      print('Predicted Class: $outputTensor');
      print('Probabilities: $probabilities');
    } catch (e) {
      print('Error running model: $e');
    }
  }




  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: loading,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: Container(
          height: 375,
          width: 392,
          decoration: BoxDecoration(
              color: Color(0xFF2E372E), borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 17, right: 17, top: 21.55, bottom: 17.55),
                child: Text(
                  widget.text1,
                  style: Styles.styleBold20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17, right: 17),
                child: Row(
                  children: [
                    SvgPicture.asset(Assets.imagesText),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                        child: Text(
                      widget.text2,
                      style: Styles.styleRegular16,
                      softWrap: true,
                    ))
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                    child: widget.file == null
                        ? const Text("Image not found")
                        : Image.file(width: 300, height: 150, widget.file!)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Visibility(visible: text!=null,child: Text(text??'',style: TextStyle(color: Colors.white),)),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: CustomButton1(
                  backgroundColor: kPrimaryColor,
                  text: S.of(context).ExploreDiagnosis,
                  onPressed: () async {
                    loading = true;
                    if (widget.file != null) {
                      await runModel(widget.file!);
                      loading = false;
                    } else {
                      print("No image selected.");
                      loading = false;
                    }
                  },
                    borderRadius: BorderRadius.circular(32),
                  buttonHeight: 37,
                  buttonWidth: 250,
                  textStyle: Styles.styleSemiBold12.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
