package com.dartmazing_network

import com.google.gson.Gson
import okhttp3.Request
import okhttp3.RequestBody
import okhttp3.RequestBody.Companion.toRequestBody
import okhttp3.internal.http2.Header
import okhttp3.internal.toHeaders

class RequestNative{
    val url: String
    val body: HashMap<String, Any>
    val headers: HashMap<String, String>
    val method: String

    constructor(map: HashMap<String, Any>) {
        this.url = map["url"] as String
        this.body = map["body"] as HashMap<String, Any>
        this.headers = map["headers"] as HashMap<String, String>
        this.method = map["method"] as String
    }

    fun asRequestBuilder(): Request {
        val headers = headers.map { Header(it.key,it.value) }.toHeaders()

        var requestBody: RequestBody? = null
        if (body.isNotEmpty()) {
            requestBody = Gson().toJson(body).toString().toRequestBody()
        }

        return Request.Builder()
                .url(url)
                .headers(headers)
                .method(method, requestBody)
                .build()
    }
}