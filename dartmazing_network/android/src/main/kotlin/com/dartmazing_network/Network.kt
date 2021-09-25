import com.dartmazing_network.RequestError
import com.dartmazing_network.RequestNative
import okhttp3.Call
import okhttp3.Callback
import okhttp3.OkHttpClient
import okhttp3.Response
import okio.IOException

class Network {

    private val client = OkHttpClient()

    fun fetch(requestNative: RequestNative,
              onSuccess: (HashMap<String, Any>) -> Unit,
              onFailure: (RequestError) -> Unit) {
        client.newCall(requestNative.asRequestBuilder()).enqueue(object : Callback {

            override fun onFailure(call: Call, e: IOException) {
                onFailure(RequestError.unknownError)
            }

            override fun onResponse(call: Call, response: Response) {
                response.use {

                    val statusCode = response.code
                    if (statusCode in 200..299) {

                        var responseNative : HashMap<String, Any> = HashMap<String, Any>()
                        responseNative["statusCode"] = "${response.code}"
                        responseNative["response"] = response.body!!.string() ?: ""
                        onSuccess(responseNative)

                    } else {
                        onFailure(RequestError.from(statusCode))
                    }

                }
            }
        })
    }

}
