package com.example.stjean_douai_app

import android.content.Intent
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "channel/notification_settings"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "openNotificationSettings") {
                openNotificationSettings()
                result.success(null)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun openNotificationSettings() {
        val intent = Intent(android.provider.Settings.ACTION_APP_NOTIFICATION_SETTINGS)
        intent.putExtra(android.provider.Settings.EXTRA_APP_PACKAGE, packageName)
        startActivity(intent)
    }
}
