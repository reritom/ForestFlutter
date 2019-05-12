class Connection {
  // Singleton pattern
  Connection._internalConstructor();
  static final Connection _instance = Connection._internalConstructor();

  factory Connection() {
    return _instance;
  }

  Future<bool> check() async {
    return true;
  }
}