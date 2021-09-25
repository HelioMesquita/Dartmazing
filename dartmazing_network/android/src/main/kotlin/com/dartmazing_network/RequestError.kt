package com.dartmazing_network

enum class RequestError constructor(val statusCode: Int) {
    unknownError(0),
    invalidParser(1),
    badRequest(400),
    unauthorized(401),
    forbidden(403),
    notFound(404);

    companion object {
        fun from(findValue: Int): RequestError = RequestError.values().first { it.statusCode == findValue } ?: RequestError.unknownError
    }
}