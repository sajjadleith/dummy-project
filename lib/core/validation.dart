import 'dart:io';


class Validation {
  static String? titleValidation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter the Title";
    } else {
      return null;
    }
  }

  static String? descValidation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter the Description";
    } else {
      return null;
    }
  }

  static String? timeValidation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please Enter the Time";
    } else {
      return null;
    }
  }

  static String? dateValidation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please Enter the Time";
    } else {
      return null;
    }
  }

  static String? imageValidation(File? imageFile) {
    if (imageFile == null) {
      return "Please Pick an image";
    } else {
      return null;
    }
  }
}
