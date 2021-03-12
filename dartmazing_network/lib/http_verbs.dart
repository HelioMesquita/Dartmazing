enum HttpVerbs {
  GET, POST, PUT, PATCH, DELETE
}

String getMethod(HttpVerbs type) {
  switch (type) {
    case HttpVerbs.GET:
      return "GET";
    case HttpVerbs.POST:
      return "POST";
    case HttpVerbs.PUT:
      return "PUT";
    case HttpVerbs.PATCH:
      return "PATCH";
    case HttpVerbs.DELETE:
      return "DELETE";
  }
  return "";
}