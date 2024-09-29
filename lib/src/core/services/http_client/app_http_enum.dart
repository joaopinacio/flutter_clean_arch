/// Enumeration that defines the different supported HTTP methods.
enum RequestMethod {
  /// Represents the HTTP GET method, which is used to retrieve information from a server.
  get('GET'),

  /// Represents the HTTP POST method, which is used to send data to a server to create a resource.
  post('POST'),

  /// Represents the HTTP PUT method, which is used to send data to a server to update a resource.
  put('PUT'),

  /// Represents the HTTP DELETE method, which is used to delete a resource from a server.
  delete('DELETE'),

  /// Represents the HTTP PATCH method, which is used to apply partial modifications to a resource.
  patch('PATCH');

  /// Creates an instance of RequestMethod with the corresponding value.
  const RequestMethod(this.value);

  /// String value associated with each HTTP method.
  final String value;
}
