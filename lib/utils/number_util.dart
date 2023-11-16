class NumberUtil {
  static bool isInteger(num value) {
    if (!value.isFinite) {
      return false;
    }

    return value == value.toInt();
  }

  static num relativeIntDouble(num value) {
    if (isInteger(value)) {
      return value.toInt();
    }

    return value;
  }
}
