package com.phaf.maintenance

import io.flutter.embedding.android.FlutterActivity


import android.app.DownloadManager
import android.content.Context
import android.net.Uri
import android.os.Environment
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.download/pdf"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            if (call.method == "downloadPdf") {
                val url = call.argument<String>("url")
                val fileName = call.argument<String>("fileName")
                if (url != null && fileName != null) {
                    downloadPdf(url, fileName)
                    result.success("Download started")
                } else {
                    result.error("INVALID_ARGUMENTS", "URL or FileName is null", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }

    private fun downloadPdf(url: String, fileName: String) {
        val request = DownloadManager.Request(Uri.parse(url))
        request.setTitle("Downloading $fileName")
        request.setDescription("Downloading PDF file...")
        request.setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED)
        request.setDestinationInExternalPublicDir(Environment.DIRECTORY_DOWNLOADS, fileName)

        val downloadManager = getSystemService(Context.DOWNLOAD_SERVICE) as DownloadManager
        downloadManager.enqueue(request)
    }
}
