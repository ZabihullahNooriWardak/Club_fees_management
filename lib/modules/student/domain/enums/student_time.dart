enum StudentTime {
  morning(0),
  afternoon(1),
  night(2);

  const StudentTime(this.value);

  final int value;

  bool get isMorning => this == StudentTime.morning;

  bool get isAfternoon => this == StudentTime.afternoon;

  bool get isNight => this == StudentTime.night;

  static StudentTime fromValue(int value) {
    return StudentTime.values.firstWhere(
      (element) => element.value == value,
      orElse: () => StudentTime.night,
    );
  }
}
