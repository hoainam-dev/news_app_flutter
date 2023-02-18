class News {
  int? articleId;
  int? categoryId;
  int? userId;
  String? title;
  String? description;
  String? content;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? isDelete;

  News({
    this.articleId,
    this.categoryId,
    this.userId,
    this.title,
    this.description,
    this.content,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.isDelete,
  });
}
