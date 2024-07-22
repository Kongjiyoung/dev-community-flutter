//main-page list
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

//인기 리스트
class TopTenContent {
  final int boardId;
  final String boardTitle;
  final String boardCreatedAt;
  final String boardCreatedAtDuration;
  final int userId;
  final String userNickname;
  final String? userPosition;
  final String userImage;
  final int rank;

  TopTenContent({
    required this.boardId,
    required this.boardTitle,
    required this.boardCreatedAt,
    required this.boardCreatedAtDuration,
    required this.userId,
    required this.userNickname,
    required this.userPosition,
    required this.userImage,
    required this.rank,
  });

  factory TopTenContent.fromJson(Map<String, dynamic> json) => TopTenContent(
    boardId: json["boardId"],
    boardTitle: json["boardTitle"],
    boardCreatedAt: json["boardCreatedAt"],
    boardCreatedAtDuration: json["boardCreatedAtDuration"],
    userId: json["userId"],
    userNickname: json["userNickname"],
    userPosition: json["userPosition"],
    userImage: json["userImage"],
    rank: json["rank"],
  );

  Map<String, dynamic> toJson() => {
    "boardId": boardId,
    "boardTitle": boardTitle,
    "boardCreatedAt": boardCreatedAt,
    "boardCreatedAtDuration": boardCreatedAtDuration,
    "userId": userId,
    "userNickname": userNickname,
    "userPosition": userPosition,
    "userImage": userImage,
    "rank": rank,
  };
}
//bookmark list
class BookmarkContent{
  int userId;
  String userNickname;
  String userPosition;
  String userImage;
  int boardId;
  String boardTitle;
  String boardContent;
  int boardViews;
  String boardCreatedAt;
  int replyCount;
  int loveCount;
  bool love;
  bool bookmark;

  BookmarkContent({
    required this.userId,
    required this.userNickname,
    required this.userPosition,
    required this.userImage,
    required this.boardId,
    required this.boardTitle,
    required this.boardContent,
    required this.boardViews,
    required this.boardCreatedAt,
    required this.replyCount,
    required this.loveCount,
    required this.love,
    required this.bookmark,
  });

  factory BookmarkContent.fromJson(Map<String, dynamic> json) => BookmarkContent(
    userId: json["userId"],
    userNickname: json["userNickname"],
    userPosition: json["userPosition"],
    userImage: json["userImage"],
    boardId: json["boardId"],
    boardTitle: json["boardTitle"],
    boardContent: json["boardContent"],
    boardViews: json["boardViews"],
    boardCreatedAt: json["boardCreatedAt"],
    replyCount: json["replyCount"],
    loveCount: json["loveCount"],
    love: json["love"],
    bookmark: json["bookmark"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "userNickname": userNickname,
    "userPosition": userPosition,
    "userImage": userImage,
    "boardId": boardId,
    "boardTitle": boardTitle,
    "boardContent": boardContent,
    "boardViews": boardViews,
    "boardCreatedAt": boardCreatedAt,
    "replyCount": replyCount,
    "loveCount": loveCount,
    "love": love,
    "bookmark": bookmark,
  };
}


// BoardDetail ==========================================================

class BoardDetailDTO {
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
  final List<ReplyDTO> replies;

  BoardDetailDTO({
    required this.boardId,
    required this.boardTitle,
    required this.boardContent,
    required this.boardHit,
    required this.boardCreatedAt,
    required this.boardCreatedAtDuration,
    required this.userId,
    required this.userNickname,
    String? userPosition,
    required this.userImage,
    required this.myLike,
    required this.myBookmark,
    required this.likeCount,
    required this.bookmarkCount,
    required this.replyCount,
    required this.replies,
  }) : userPosition = userPosition ?? 'Default Position'; // null일 경우 기본값 설정

  factory BoardDetailDTO.fromJson(Map<String, dynamic> json) => BoardDetailDTO(
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
    replies: List<ReplyDTO>.from(json["replies"].map((x) => ReplyDTO.fromJson(x))),
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
    "replies": List<dynamic>.from(replies.map((x) => x.toJson())),
  };
}

class ReplyDTO {
  final int id;
  final int boardId;
  final int userId;
  final String userNickname;
  final String? userPosition;
  final String userImage;
  final String comment;
  final String updatedAt;

  ReplyDTO({
    required this.id,
    required this.boardId,
    required this.userId,
    required this.userNickname,
    String? userPosition,
    required this.userImage,
    required this.comment,
    required this.updatedAt,
  }) : userPosition = userPosition ?? 'Default Position'; // null일 경우 기본값 설정

  factory ReplyDTO.fromJson(Map<String, dynamic> json) => ReplyDTO(
    id: json["id"],
    boardId: json["boardId"],
    userId: json["userId"],
    userNickname: json["userNickname"],
    userPosition: json["userPosition"],
    userImage: json["userImage"],
    comment: json["comment"],
    updatedAt: json["updatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "boardId": boardId,
    "userId": userId,
    "userNickname": userNickname,
    "userPosition": userPosition,
    "userImage": userImage,
    "comment": comment,
    "updatedAt": updatedAt,
  };
}

// BoardDetail ==========================================================