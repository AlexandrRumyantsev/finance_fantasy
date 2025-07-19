package com.example.finance_fantasy

import io.flutter.embedding.android.FlutterActivity
import android.os.Build
import android.view.WindowManager

class MainActivity: FlutterActivity() {

    override fun onPause() {
        super.onPause()
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            window.attributes.alpha = 0.7f
            window.setFlags(
                WindowManager.LayoutParams.FLAG_BLUR_BEHIND,
                WindowManager.LayoutParams.FLAG_BLUR_BEHIND
            )
        }
    }

    override fun onResume() {
        super.onResume()
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            window.attributes.alpha = 1.0f
            window.clearFlags(WindowManager.LayoutParams.FLAG_BLUR_BEHIND)
        }
    }
}
