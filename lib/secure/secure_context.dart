import 'dart:html';

const _secureTokenKey = "SECURE_TOKEN_KEY";

class SecureContext {
  String token;

  static SecureContext? _instance;

  SecureContext._privateConstructor(this.token);

  factory SecureContext.build(String token) {
    assert(token.isNotEmpty);
    //刷新local storage
    window.localStorage[_secureTokenKey] = token;
    _instance = SecureContext._privateConstructor(token);
    return _instance!;
  }

  static SecureContext? get secureContext {
    if (_instance == null) {
      _tyrLoadSecureContextFromCache();
    }
    return _instance;
  }

  static void _tyrLoadSecureContextFromCache() {
    Storage localStorage = window.localStorage;
    if (localStorage.containsKey(_secureTokenKey)) {
      SecureContext.build(localStorage[_secureTokenKey]!);
    }
  }
}
