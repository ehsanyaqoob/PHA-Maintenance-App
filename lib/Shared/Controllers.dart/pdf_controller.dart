import 'dart:io';
import 'dart:typed_data';
import 'dart:convert'; // Import for JSON decoding
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:pharesidence/Colors/colors.dart';
import '../../Api_Providers/Api_Responses/api_urls.dart';
import '../../models/additionalInfo_model.dart';
import 'package:permission_handler/permission_handler.dart';

class PdfController extends GetxController {
  var isLoading = false.obs;

  // Sends a request to the server to generate the PDF and saves it locally
  Future<void> generateAndSavePdf(AdditionalInfoData additionalInfo) async {
    isLoading.value = true;

    try {
      // Prepare parameters to be sent to the server
      final params = {
        'fullName': additionalInfo.fullName,
        'registrationNo': additionalInfo.registrationNo,
        'cnic': additionalInfo.cnic,
        'laneNo': additionalInfo.laneNo?.toString(),
        'houseNo': additionalInfo.houseNo?.toString(),
        'category': additionalInfo.category,
        'projectName': additionalInfo.projectName,
        'presentAddress': additionalInfo.presentAddress,
        'cell': additionalInfo.cell,
        'status': additionalInfo.status,
        'issueDate': additionalInfo.issueDate,
        'dueDate': additionalInfo.dueDate,
        'amount': additionalInfo.amount?.toString(),
        'lateFee': additionalInfo.lateFee?.toString(),
        'totalAmountDue': additionalInfo.totalAmountDue?.toString(),
      };

      // Log request details
      print("Sending request to $DownloadPDF with parameters: $params");

      // Send request to generate PDF
      final response = await http.post(
        Uri.parse(DownloadPDF),
        body: params,
      );

      // Log response details
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        // Extract the PDF data and filename from the response
        Uint8List pdfData = response.bodyBytes;
        final filename = _extractFilenameFromResponse(response.body);

        if (filename != null) {
          // Save the PDF with the server-provided filename
          await _savePdfToDownloads(pdfData, filename);
        } else {
          print("Failed to retrieve filename from response.");
          Get.snackbar("Error", "Failed to retrieve filename from server",
              snackPosition: SnackPosition.BOTTOM);
        }
      } else {
        print("Failed to generate PDF. Status code: ${response.statusCode}");
        Get.snackbar("Error", "Failed to generate PDF from server",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print("An error occurred: $e");
      Get.snackbar("Error", "An error occurred: $e",
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  // Save the PDF file locally in Downloads folder with a server-provided filename
  Future<void> _savePdfToDownloads(Uint8List pdfData, String filename) async {
    // Check and request permission to access storage if needed
    await _requestStoragePermission();

    // Get the directory for downloads (Android specific)
    final directory = await getExternalStorageDirectory();
    final downloadsDir = Directory('${directory!.path}/Download');

    // Ensure the path is valid for Android and create directory if not exists
    if (!await downloadsDir.exists()) {
      await downloadsDir.create(recursive: true);
    }

    // Set the file path for the PDF file with the server-provided filename
    final filePath = '${downloadsDir.path}/$filename.pdf';
    final file = File(filePath);

    try {
      await file.writeAsBytes(pdfData);
      print("PDF saved in Downloads folder as ${file.path}");

      // Show success snackbar with a short message
      Get.snackbar("Success", "PDF saved in Downloads",
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 2),
          backgroundColor: AppColors.AppPrimary,
          colorText: AppColors.appWhite);
    } catch (e) {
      print("Failed to save PDF locally: $e");
      Get.snackbar("Error", "Failed to save PDF locally: $e",
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColors.AppPrimary,
          colorText: AppColors.appWhite);
    }
  }

  // Request storage permission if not granted
  Future<void> _requestStoragePermission() async {
    // Request permission for Android
    if (await Permission.storage.request().isGranted) {
      // Permission granted, proceed with saving the file
    } else {
      // Permission denied, show a message or handle accordingly
      Get.snackbar("Permission Denied", "Storage permission is required",
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColors.AppPrimary,
          colorText: AppColors.appWhite);
    }
  }

  // Extract the filename from the server's response (assuming response is JSON)
  String? _extractFilenameFromResponse(String responseBody) {
    try {
      // Parse the response body as JSON and extract the filename
      final Map<String, dynamic> responseJson = jsonDecode(responseBody);
      return responseJson['filename']; // Assuming the filename is in the 'filename' field
    } catch (e) {
      print("Failed to parse filename from response: $e");
      return null;
    }
  }
}
