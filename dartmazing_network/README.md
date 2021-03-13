# dartmazing_network

A local flutter plugin that performs requests using native.

## Motivation
The main objective of this dependency was to demonstrate how to create a plugin and add native dependencies on it.

The native request is performed in 
iOS by Alamofire 
Android by Okhttp

## Getting Started

To perform a request you are supposed to create an object that extends `RequestNative`.
This object is responsible to create all fields necessary for a request.

Then, you are supposed to create an object that contains a factory called `fromJson(Map<String, dynamic> json)`. This object is responsible to parse the data and create it.

With these two objects, you can perform the request. Follow the example

```
final network = DartmazingNetwork();
final responseNative = await network.execute(
    request: REQUESTOBJECT(),  
    factory: (json) => PARSEROBJECT.fromJson(json)
    );
```

The result of the request came from an object called `NativeRequest` that infer the parser object inside it. This object returns the status code and de object parser.
