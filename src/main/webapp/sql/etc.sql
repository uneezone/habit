# [문의 테이블]
CREATE TABLE question (
    q_no        int          NOT NULL  auto_increment  primary key, #문의 번호
    cont_no     int          NOT NULL,                              #콘텐츠 코드
    id          varchar(25)  NOT NULL,                              #회원/호스트 아이디
    q_question  TEXT(500)    NOT NULL,                              #내용
    q_bedate    datetime     NOT NULL  DEFAULT now(),               #등록일
    q_group     int          NOT NULL,                              #글 그룹번호
    q_div       char(1)      NOT NULL,                               #구분코드(U:회원, H:호스트)
    q_status    char(1)      NOT NULL   DEFAULT 'N'                  #host 답변 유무 (N:미답변, Y:답변)
);

drop table question;

insert into question (cont_no, id, q_question, q_bedate, q_group, q_div, q_status)
values (1, 'user-2', '최대 참석인원이 5명인가요?', '2022-04-11 00:00:00',(SELECT ifnull(max(q_no),0)+1 FROM question as qs), 'U', 'Y' );

insert into question (cont_no, id, q_question, q_bedate, q_group, q_div)
values (1, 'user-1', '네 맞습니다', '2022-04-11 02:02:02',1, 'H' );

insert into question (cont_no, id, q_question, q_bedate, q_group, q_div, q_status)
values (2, 'user-1', '회차권을 헷갈려서 2회권으로 잘못 구매했습니다.차액금 계좌이체 하고 3회권으로 바꿀 수 있을까요?', '2022-07-22 01:30:00',(SELECT ifnull(max(q_no),0)+1 FROM question as qs), 'U', 'Y' );

insert into question (cont_no, id, q_question, q_bedate, q_group, q_div)
values (2, 'user-2', '안녕하세요 고객님.문의 하신 내용은 전산상의 이유로 불가합니다.취소 후 3회권으로 재 구매 부탁드립니다.', '2022-07-23 14:30:00',3, 'H' );



# [리뷰 테이블]
CREATE TABLE review (
    review_no       int	         NOT NULL  auto_increment  primary key, #리뷰 코드
    user_id         varchar(25)	 NOT NULL,                              #유저 아이디
    cont_no         int	         NOT NULL,                              #콘텐츠 코드
    payd_no        int	         NOT NULL,                              #주문 상세 번호
    review_date     datetime     NOT NULL  DEFAULT now(),               #리뷰 등록일
    review_cont     Text(500)    NOT NULL,                              #리뷰 내용
    review_star     float	         NOT NULL,                              #별점
    review_img      varchar(20)	 NULL,                                  #리뷰 이미지
    review_imgsize  int	         NULL      DEFAULT 0,                   #이미지 사이즈
    review_ask      varchar(10)	 NULL,                                  #공통질문
    review_status   char(1)	     NOT NULL  DEFAULT 'Y',                  #리뷰 상태(Y:리뷰 게시중, N:리뷰 삭제)
    review_feed     char(1)      NOT NULL DEFAULT 'N'
);

insert into review(user_id, cont_no, payed_no, review_date, review_cont, review_star, review_img, review_ask, review_status)
VALUES ('user-2', '1', 1, '2022-04-20 0:00:00', '즐거운 하루였습니다.', 5, 'review_img', 'WF', 'Y');

insert into review(user_id, cont_no, payed_no, review_date, review_cont, review_star, review_img, review_ask, review_status)
VALUES ('user-1', '2', 3, '2022-08-01 0:00:00', '회차권 싸게 잘 구매했어요.', 5, 'review_img2', 'WA', 'Y');

insert into review(user_id, cont_no, payed_no, review_date, review_cont, review_star, review_img, review_ask, review_status)
VALUES ('user-3', '2', 4, '2022-08-08 0:00:00', '상담잘 받고있습니다', 4, 'review_img3', 'WA', 'N');

insert into review(user_id, cont_no, payed_no, review_date, review_cont, review_star, review_img, review_ask, review_status)
VALUES ('user-3', '3', 5, '2022-08-11 0:00:00', '빵만들기 재미있어요', 4, 'review_img4', 'WC', 'Y');



# [찜 테이블]
CREATE TABLE zzim (
    zzim_no  int	        NOT NULL  auto_increment  primary key, #찜 코드
    user_id  varchar(25)	NOT NULL,                              #유저 아이디
    cont_no  int	        NOT NULL                               #콘텐츠 코드
);

INSERT INTO zzim (user_id, cont_no) VALUES ('user-2', '1');

INSERT INTO zzim (user_id, cont_no) VALUES ('user-3', '3');



# [키워드 수집 테이블]
CREATE TABLE reco (
    reco_no       int	       NOT NULL  auto_increment  primary key, #키워드 코드
    reco_keyword  varchar(50)  NOT NULL,                              #키워드
    reco_date     datetime	   NOT NULL  DEFAULT now()                #키워드 생성일
);

insert into reco (reco_keyword, reco_date) values ('서핑', '2022-04-11 00:05:00');

insert into reco (reco_keyword, reco_date) values ('상담', '2022-07-21 23:00:00');

insert into reco (reco_keyword, reco_date) values ('휘낭시애', '2022-07-29 23:00:00');

insert into reco (reco_keyword, reco_date) values ('휘낭시에','2022-07-29 23:00:30');



# [설문조사 테이블]
CREATE TABLE survey (
    user_id   varchar(25)  NOT NULL  primary key,  #유저 아이디
    ask_1     varchar(20)  NOT NULL,               #질문1
    ask_2     varchar(20)  NOT NULL,               #질문1
    ask_3     varchar(20)  NOT NULL,               #질문1
    ask_4     varchar(20)  NOT NULL,               #질문1
    ask_5     varchar(20)  NOT NULL,               #질문1
    ask_date  datetime	   NOT NULL	 DEFAULT now() #설문 참여일
);

insert into survey (user_id, ask_1, ask_2, ask_3, ask_4, ask_5, ask_date)
values ('user-3', 'm', '30', 'out', 'WA', 'p7', '2023-06-07 00:00:00');

select * from survey;
