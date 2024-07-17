class Content {
  final int boardId;
  final String boardTitle;
  final String boardContent;
  final int boardHit;
  final String boardCreatedAt;
  final String boardCreatedAtDuration;
  final int userId;
  final String userNickname;
  final String? userPosition;
  final String userImage;
  final bool myLike;
  final bool myBookmark;
  final int likeCount;
  final int bookmarkCount;
  final int replyCount;

  Content({
    required this.boardId,
    required this.boardTitle,
    required this.boardContent,
    required this.boardHit,
    required this.boardCreatedAt,
    required this.boardCreatedAtDuration,
    required this.userId,
    required this.userNickname,
    required this.userPosition,
    required this.userImage,
    required this.myLike,
    required this.myBookmark,
    required this.likeCount,
    required this.bookmarkCount,
    required this.replyCount,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        boardId: json["boardId"],
        boardTitle: json["boardTitle"],
        boardContent: json["boardContent"],
        boardHit: json["boardHit"],
        boardCreatedAt: json["boardCreatedAt"],
        boardCreatedAtDuration: json["boardCreatedAtDuration"],
        userId: json["userId"],
        userNickname: json["userNickname"],
        userPosition: json["userPosition"],
        userImage: json["userImage"],
        myLike: json["myLike"],
        myBookmark: json["myBookmark"],
        likeCount: json["likeCount"],
        bookmarkCount: json["bookmarkCount"],
        replyCount: json["replyCount"],
      );

  Map<String, dynamic> toJson() => {
        "boardId": boardId,
        "boardTitle": boardTitle,
        "boardContent": boardContent,
        "boardHit": boardHit,
        "boardCreatedAt": boardCreatedAt,
        "boardCreatedAtDuration": boardCreatedAtDuration,
        "userId": userId,
        "userNickname": userNickname,
        "userPosition": userPosition,
        "userImage": userImage,
        "myLike": myLike,
        "myBookmark": myBookmark,
        "likeCount": likeCount,
        "bookmarkCount": bookmarkCount,
        "replyCount": replyCount,
      };
}
