class TextResponse {
  String id;
  String text;
  String author;
  int like;
  int likeCount;

  TextResponse(
      {required this.id,
      required this.text,
      required this.author,
      required this.like,
      required this.likeCount,
      });
}
