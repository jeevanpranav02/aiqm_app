class Success {
  String prediction;

  Success({
    required this.prediction,
  });

  Success copyWith({
    String? prediction,
  }) =>
      Success(
        prediction: prediction ?? this.prediction,
      );
}
