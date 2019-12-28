package org.usayuki.intercommunicationwithjavascript

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.webkit.JsResult
import android.webkit.WebChromeClient
import android.webkit.WebView

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val webView = findViewById(R.id.webView) as WebView
        webView.setWebChromeClient(object : WebChromeClient() {
            override fun onJsAlert(view: WebView, url: String, message: String, result: JsResult): Boolean {
                val components = message.split(":")
                when (components[0]) {
                    "double" -> {
                        val numString = components[1]
                        val number = numString.toInt()
                        val result = number * 2
                        webView.evaluateJavascript("window.double($result)", null)
                    }
                }
                result.cancel()
                return true
            }
        })
    }
}
