class CreateReviewParams {
  final String id;
  final String ratings;
  final String comments;

  CreateReviewParams(this.id, this.ratings, this.comments);

  Map<String, dynamic> toJson() {
    return {"product": id, "comment": comments, "rating": ratings};
  }
}
