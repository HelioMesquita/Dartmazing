package com.dartmazing.network.dartmazing_network

import Network
import android.os.Handler
import android.os.Looper
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

/** DartmazingNetworkPlugin */
class DartmazingNetworkPlugin: FlutterPlugin, MethodCallHandler {
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "dartmazing_network")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    val mainThread = MainThreadResult(result)
    if (call.method == "performNativeRequest") {
      val json = call.arguments as HashMap<String, Any>
      val requestNative = RequestNative(json)
      Network().fetch(requestNative) {
        mainThread.success(it)
      }
    } else {
      mainThread.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}

private class MainThreadResult internal constructor(private val result: MethodChannel.Result) : MethodChannel.Result {
  private val handler: Handler

  override fun success(result: Any?) {
    handler.post(Runnable { this.result.success(result) })
  }

  override fun error(errorCode: String, errorMessage: String?, errorDetails: Any?) {
    handler.post(Runnable { result.error(errorCode, errorMessage, errorDetails) })
  }

  override fun notImplemented() {
    handler.post(Runnable { result.notImplemented() })
  }

  init {
    handler = Handler(Looper.getMainLooper())
  }
}