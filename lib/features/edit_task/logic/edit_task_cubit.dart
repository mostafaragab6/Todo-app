import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/features/edit_task/data/models/edit_task_request.dart';
import 'package:todo_app/features/edit_task/data/repos/edit_task_repo.dart';
import 'package:todo_app/features/edit_task/logic/edit_task_state.dart';
import 'package:todo_app/features/home/data/models/model.dart';

import '../../../core/networking/dio_factory.dart';

class EditTaskCubit extends Cubit<EditTaskState> {
  final EditTaskRepo _editTaskRepo;
  final Data taskDetails;
  late final TextEditingController titleController;
  late final TextEditingController descController;
  late final TextEditingController priorityController;
  late final TextEditingController dateController;
  late final TextEditingController statusController;
  final formKey = GlobalKey<FormState>();

  EditTaskCubit(this._editTaskRepo, this.taskDetails)
      : super(EditTaskState.initial()) {
    titleController = TextEditingController(
      text: taskDetails.title ?? '',
    );
    descController = TextEditingController(
      text: taskDetails.desc ?? '',
    );
    priorityController = TextEditingController(
      text: taskDetails.priority?.toString() ?? '',
    );
    dateController = TextEditingController(
      text: taskDetails.createdAt?.substring(0, 10) ?? '',
    );
    statusController = TextEditingController(
      text: taskDetails.status ?? '',
    );
  }

  String? imageToBeSent;
  void editTask() async {
    final response = await _editTaskRepo.editTask(
      taskDetails.id ?? '',
      EditTaskRequest(
        desc: descController.text,
        image: imageToBeSent ?? taskDetails.image ?? '',
        priority: priorityController.text,
        status: statusController.text,
        title: titleController.text,
        user: taskDetails.user ?? '',
      ),
    );

    response.when(
      success: (data) {
        print(data);
        print('-_- Done');

        emit(EditTaskState.success(data));
      },
      failure: (error) {
        print(error);
        emit(EditTaskState.error(error));
      },
    );
  }

  Future<void> uploadImage() async {
    emit(EditTaskState.uploadImageLoading());
    print(fileName);
    print(image!.path);
    FormData formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(
        image!.path,
        filename: fileName,
        contentType: MediaType('image', 'png'),
      ),
    });
    DioFactory.dio
        ?.post(
      options: Options(
        headers: {
          'Content-Type': 'multipart/form-data',
        },
      ),
      'https://todo.iraqsapp.com/upload/image',
      data: formData,
    )
        .then((value) {
      imageToBeSent = value.data['image'];
      emit(EditTaskState.uploadImageSuccess());

      print(value.data['image']);
    }).catchError((error) {
      print(error);
      emit(EditTaskState.uploadImageError(error.toString()));
    });
  }

  File? image;
  String? fileName;
  final ImagePicker picker = ImagePicker();

  Future<void> pickImage(String source) async {
    final dynamic pickedFile;
    if (source == 'camera') {
      pickedFile = await picker.pickImage(source: ImageSource.camera);
    } else {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    }
    if (pickedFile != null) {
      File originalImage = File(pickedFile.path);

      XFile? returedImage = await compressImage(originalImage);

      File compressedImage = File(returedImage!.path);
      image = compressedImage;
      fileName = image!.path.split('/').last;

      print('Original size: ${originalImage.lengthSync()} bytes');
      print('Compressed size: ${compressedImage.lengthSync()} bytes');
      print('Compressed size: ${compressedImage.path} bytes');
      // Upload the compressed image
      uploadImage();
    } else {
      print('No image selected.');
    }
  }

  Future<XFile?> compressImage(File file) async {
    final dir = await getTemporaryDirectory();
    final targetPath =
        '${dir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';

    return await FlutterImageCompress.compressAndGetFile(
      file.absolute.path, // Path of the original image
      targetPath, // Path to save the compressed image
      quality: 80, // Adjust quality (0-100)
      format: CompressFormat.jpeg, // Ensure JPEG format
    );
  }
}
