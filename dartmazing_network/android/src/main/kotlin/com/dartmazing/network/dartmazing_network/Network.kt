import com.dartmazing.network.dartmazing_network.RequestNative
import okhttp3.Call
import okhttp3.Callback
import okhttp3.OkHttpClient
import okhttp3.Response
import okio.IOException

class Network {

    private val client = OkHttpClient()

    fun fetch(requestNative: RequestNative, onFinished: (HashMap<String, Any>)->Unit) {
        client.newCall(requestNative.asRequestBuilder()).enqueue(object : Callback {
            override fun onFailure(call: Call, e: IOException) {
                onFinished.invoke(HashMap<String, Any>())
            }

            override fun onResponse(call: Call, response: Response) {
                response.use {
                    var responseNative : HashMap<String, Any> = HashMap<String, Any>()
                    responseNative["statusCode"] = "${response.code}"
                    if (response.body != null) {
                        responseNative["response"] = response.body!!.string()
                    }

                    onFinished(responseNative)
                }
            }
        })
    }

}
