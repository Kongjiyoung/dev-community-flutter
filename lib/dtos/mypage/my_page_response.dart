class MyPageDTO {
  final int userId;
  final String image;
  final String nickname;
  final String? position;
  final String? introduce;
  final List<MyBoardList> myBoardList;
  final List<MyReplyList> myReplyList;

  MyPageDTO({
    required this.userId,
    required this.image,
    required this.nickname,
    this.position,
    this.introduce,
    required this.myBoardList,
    required this.myReplyList,
  });

  MyPageDTO copyWith({
    int? userId,
    String? image,
    String? nickname,
    String? position,
    String? introduce,
    List<MyBoardList>? myBoardList,
    List<MyReplyList>? myReplyList,
  }) {
    return MyPageDTO(
      userId: userId ?? this.userId,
      image: image ?? this.image,
      nickname: nickname ?? this.nickname,
      position: position ?? this.position,
      introduce: introduce ?? this.introduce,
      myBoardList: myBoardList ?? this.myBoardList,
      myReplyList: myReplyList ?? this.myReplyList,
    );
  }

  factory MyPageDTO.fromJson(Map<String, dynamic> json) => MyPageDTO(
        userId: json["userId"],
        image: json["image"],
        nickname: json["nickname"],
        position: json["position"] ?? "포지션 없음",
        introduce: json["introduce"] ?? "소개 없음",
        myBoardList: List<MyBoardList>.from(
            json["myBoardList"].map((x) => MyBoardList.fromJson(x))),
        myReplyList: json["myReplyList"] != null
            ? List<MyReplyList>.from(
                json["myReplyList"].map((x) => MyReplyList.fromJson(x)))
            : [],
      );
}

class MyBoardList {
  final int boardId;
  final String title;
  final String updatedAt;

  MyBoardList({
    required this.boardId,
    required this.title,
    required this.updatedAt,
  });

  MyBoardList copyWith({
    int? boardId,
    String? title,
    String? updatedAt,
  }) {
    return MyBoardList(
      boardId: boardId ?? this.boardId,
      title: title ?? this.title,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory MyBoardList.fromJson(Map<String, dynamic> json) => MyBoardList(
        boardId: json["boardId"],
        title: json["title"],
        updatedAt: json["updatedAt"],
      );
}

class MyReplyList {
  final int replyId;
  final int boardId;
  final String comment;
  final String boardTitle;
  final String updatedAt;

  MyReplyList({
    required this.replyId,
    required this.boardId,
    required this.comment,
    required this.boardTitle,
    required this.updatedAt,
  });

  MyReplyList copyWith({
    int? replyId,
    int? boardId,
    String? comment,
    String? boardTitle,
    String? updatedAt,
  }) {
    return MyReplyList(
      replyId: replyId ?? this.replyId,
      boardId: boardId ?? this.boardId,
      comment: comment ?? this.comment,
      boardTitle: boardTitle ?? this.boardTitle,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory MyReplyList.fromJson(Map<String, dynamic> json) => MyReplyList(
        replyId: json["replyId"],
        boardId: json["boardId"],
        comment: json["comment"],
        boardTitle: json["boardTitle"],
        updatedAt: json["updatedAt"],
      );
}
