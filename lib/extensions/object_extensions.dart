extension GetDynamicUtils<T> on T {
  T map<T>(T f(dynamic e)) {
    return f(this);
  }
}
