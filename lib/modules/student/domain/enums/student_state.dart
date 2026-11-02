enum StudentState {
  active(0),
  inactive(1);

  const StudentState(this.value);

  final int value;

  bool get isActive => this == StudentState.active;

  bool get isInactive => this == StudentState.inactive;

  static StudentState fromValue(int value) {
    return StudentState.values.firstWhere(
      (element) => element.value == value,
      orElse: () => StudentState.active,
    );
  }
}
