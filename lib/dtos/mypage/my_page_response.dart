class MyPageDTO {
  final int userId;
  final String image;
  final String nickname;
  final String position;
  final String introduce;
  final List<MyBoardList> myBoardList;
  final List<MyReplyList> myReplyList;

  MyPageDTO({
    required this.userId,
    required this.image,
    required this.nickname,
    required this.position,
    required this.introduce,
    required this.myBoardList,
    required this.myReplyList,
  });

  factory MyPageDTO.fromJson(Map<String, dynamic> json) => MyPageDTO(
        userId: json["userId"],
        image: json["image"],
        nickname: json["nickname"],
        position: json["position"],
        introduce: json["introduce"],
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

  factory MyReplyList.fromJson(Map<String, dynamic> json) => MyReplyList(
        replyId: json["replyId"],
        boardId: json["boardId"],
        comment: json["comment"],
        boardTitle: json["boardTitle"],
        updatedAt: json["updatedAt"],
      );
}
