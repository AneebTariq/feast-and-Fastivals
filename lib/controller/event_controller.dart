import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pak_festive/utils/app_colors.dart';
import 'package:pak_festive/utils/helper.dart';

class EventController extends GetxController{
  /// Controllers for text fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController totalTicketsController = TextEditingController();
  final TextEditingController ticketPriceController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();

  /// **Time Picker Function**
  Future<void> pickTime({required bool isStartTime}) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      String formattedTime = pickedTime.format(Get.context!);
      if (isStartTime) {
        startTimeController.text = formattedTime;
      } else {
        endTimeController.text = formattedTime;
      }
    }
  }
  /// Image Picker
  final ImagePicker _picker = ImagePicker();
  Rx<File?> eventImage = Rx<File?>(null);

  /// Google Maps Location
  Rx<LatLng?> selectedLocation = Rx<LatLng?>(null);

  /// Pick an image from gallery
  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      eventImage.value = File(pickedFile.path);
    }
  }

  /// Set selected location from Google Map
  void setEventLocation(LatLng location) {
    selectedLocation.value = location;
    locationController.text = "${location.latitude}, ${location.longitude}";
  }

  /// Create Event Logic
  void onCreateEvent() {
    if (nameController.text.isEmpty ||
        totalTicketsController.text.isEmpty ||
        ticketPriceController.text.isEmpty ||
        locationController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        eventImage.value == null ||
        selectedLocation.value == null) {
      showToast("Error: Please fill all fields and select an image & location",kcErrorColor);
      return;
    }

    /// Event Data
    final eventData = {
      "name": nameController.text,
      "total_tickets": totalTicketsController.text,
      "ticket_price": ticketPriceController.text,
      "location": locationController.text,
      "latitude": selectedLocation.value!.latitude,
      "longitude": selectedLocation.value!.longitude,
      "description": descriptionController.text,
      "image_path": eventImage.value!.path,
    };

    /// You can send `eventData` to Firebase, Supabase, or any backend here.
    print("Event Created: $eventData");

    showToast("Event Created Successfully!",kcSuccess);

    /// Clear fields after successful creation
    clearFields();
  }

  /// Clear all input fields
  void clearFields() {
    nameController.clear();
    totalTicketsController.clear();
    ticketPriceController.clear();
    locationController.clear();
    descriptionController.clear();
    eventImage.value = null;
    selectedLocation.value = null;
  }
}