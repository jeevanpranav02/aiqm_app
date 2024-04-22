class Failure {
  String error;
  String inputSequence;
  String inputSequenceType;

  Failure({
    required this.error,
    required this.inputSequence,
    required this.inputSequenceType,
  });

  Failure copyWith({
    String? error,
    String? inputSequence,
    String? inputSequenceType,
  }) =>
      Failure(
        error: error ?? this.error,
        inputSequence: inputSequence ?? this.inputSequence,
        inputSequenceType: inputSequenceType ?? this.inputSequenceType,
      );
}
