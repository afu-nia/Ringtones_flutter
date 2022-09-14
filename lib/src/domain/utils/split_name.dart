class SplitName {
  static String splitName({required String name}) {
    var n = name.split('.');
    return n[0];
  }

  static String splitExt({required String name}) {
    return name.split('.').last;
  }
}
