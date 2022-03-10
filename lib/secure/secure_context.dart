class SecureContext {
  String token;

  static SecureContext? _instance;

  SecureContext._privateConstructor(this.token);

  factory SecureContext.build(String token) {
    _instance = SecureContext._privateConstructor(token);
    return _instance!;
  }

  static SecureContext? get secureContext {
    return _instance;
  }
}
