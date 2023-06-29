use habit;

# [회원 테이블]
# 이미지 기본값 설정 해야함
CREATE TABLE user (
    user_id      varchar(25)   NOT NULL  primary key,                #유저 아이디
    user_pw      varchar(25)   NOT NULL,                             #비밀번호
    user_name    varchar(15)   NOT NULL,                             #닉네임
    user_email   varchar(40)   NOT NULL,                             #이메일
    user_phone   varchar(15)   NOT NULL,                             #전화번호
    user_birth   varchar(10)   NOT NULL,                             #생년월일(8자리)
    user_gender  varchar(10)   NOT NULL,                             #성별
    user_img     varchar(100)  NOT NULL  DEFAULT 'defaultPro.png',   #프로필 이미지
    user_status  char(1)       NOT NULL  DEFAULT 'O',                #회원 상태
    user_grade   char(1)       NOT NULL  DEFAULT 'M',                #회원 구분
    user_level   char(1)       NOT NULL  DEFAULT 'B',                #회원 등급
    user_date    datetime      NOT NULL  DEFAULT now()               #가입날짜
);
drop table user;

insert into user (user_id, user_pw, user_name, user_email, user_phone, user_birth, user_gender, user_img, user_grade,user_date)
values ('user-1', '1234', '유저1', 'user1@itwill.com', '010-1234-1234', '19990101', 'M', 'defaultPro.png','H', '2022-01-01 00:00:00');

insert into user (user_id, user_pw, user_name, user_email, user_phone, user_birth, user_gender, user_img,user_grade, user_date)
values ('user-2', '1234', '유저2', 'user2@itwill.com', '010-1234-1235', '19980101', 'W', 'user2.jpg','H', '2022-04-01 00:00:00');

insert into user (user_id, user_pw, user_name, user_email, user_phone, user_birth, user_gender, user_img,  user_date)
values ('user-3', '1234', '유저3', 'user3@itwill.com', '010-1234-1236', '19970101', 'W', 'defaultPro.png',  '2022-07-01 00:00:00');

insert into user (user_id, user_pw, user_name, user_email, user_phone, user_birth, user_gender, user_img,user_grade, user_level, user_date)
values ('user-4', '1234', '유저4', 'user4@itwill.com', '010-1234-1237', '19960101', 'W', 'user4.jpg', 'H','A', '2022-07-14 00:00:00');

insert into user (user_id, user_pw, user_name, user_email, user_phone, user_birth, user_gender, user_img, user_status, user_date)
values ('user-5', '1234', '유저5', 'user5@itwill.com', '010-1234-1238', '19950101', 'M', 'defaultPro.png', 'X',  '2022-10-01 00:00:00');

insert into user (user_id, user_pw, user_name, user_email, user_phone, user_birth, user_gender, user_img, user_status, user_date)
values ('user-6', '1234', '유저6', 'user6@itwill.com', '010-1234-1239', '19940101', 'M', 'user6.jpg', 'N',  '2023-04-01 00:00:00');


# [호스트 테이블]
CREATE TABLE host (
    host_id        varchar(25)   NOT NULL  primary key,                  #호스트 아이디
    host_name      varchar(20)   NOT NULL,                               #호스트 닉네임
    host_phone     varchar(15)   NOT NULL,                               #호스트 전화번호
    host_intro     varchar(200)  NULL,                                   #소개글           초반가입시 기입하지 않아서
    host_email     varchar(40)   NOT NULL,                               #호스트 이메일
    host_img       varchar(100)  NOT NULL  DEFAULT 'defaulthostPro.png', #프로필 이미지
    host_account   varchar(50)       NULL,                                   #계좌번호          초반가입시 기입하지 않아서
    host_bank      varchar(15)   NULL,                                   #은행             초반가입시 기입하지 않아서
    host_acholder  varchar(15)   NULL,                                   #예금주            초반가입시 기입하지 않아서
    host_date      datetime      NOT NULL  DEFAULT now()                 #호스트 등록일
);

insert into host (host_id, host_name, host_phone, host_intro, host_email, host_account, host_bank, host_acholder, host_date)
values ('user-1', 'H1', '010-1234-1234', '안녕하세요 H1 입니다', 'user1@itwill.com', 123412123456, '해빗은행', '호스트1', '2022-01-05 00:00:00');

insert into host (host_id, host_name, host_phone, host_intro, host_email, host_img, host_account, host_bank, host_acholder, host_date)
values ('user-2', 'H2', '031-123-1234', '안녕하세요 H2 입니다', 'user2@gmail.com', 'host2.jpg', 123412123457, '해빗은행', '호스트2', '2022-04-06 00:00:00');

insert into host (host_id, host_name, host_phone, host_intro, host_email, host_img, host_account, host_bank, host_acholder, host_date)
values ('user-4', 'H3', '02-123-1234', '안녕하세요 H3 입니다', 'user4@naver.com', 'host3.jpg', 123412123458, '해빗은행', '호스트3', '2022-01-07 00:00:00');



# [에너지 테이블]
CREATE TABLE energy (
    energy_no       int	         NOT NULL  auto_increment  primary key, #에너지 번호
    user_id         varchar(25)	 NOT NULL,                              #회원 아이디
    energy_saveuse  int	         NOT NULL,                              #적립/사용에너지
    energy_date     datetime	 NOT NULL  DEFAULT now(),               #에너지 변경 날짜
    energy_sources  varchar(50)	 NOT NULL                               #에너지 출처
);

insert into energy (user_id, energy_saveuse, energy_date, energy_sources)
values ('user-1', 1000, '2022-01-01 00:00:00', '[회원가입]적립');

insert into energy (user_id, energy_saveuse, energy_date, energy_sources)
values ('user-2', 1000, '2022-04-01 00:00:00', '[회원가입]적립');

insert into energy (user_id, energy_saveuse, energy_date, energy_sources)
values ('user-2', -1000, '2022-04-13 02:02:03', '[결제]사용');

insert into energy (user_id, energy_saveuse, energy_date, energy_sources)
values ('user-2', 1490, '2022-04-13 02:02:04', '[결제]적립');

insert into energy (user_id, energy_saveuse, energy_date, energy_sources)
values ('user-2', 100, '2022-04-20 00:00:00', '[리뷰]적립');

insert into energy (user_id, energy_saveuse, energy_date, energy_sources)
values ('user-3', 1000, '2022-07-01 00:00:00', '[회원가입]적립');

insert into energy (user_id, energy_saveuse, energy_date, energy_sources)
values ('user-1', 180, '2022-07-22 01:01:01', '[결제]적립');

insert into energy (user_id, energy_saveuse, energy_date, energy_sources)
values ('user-1', -180, '2022-07-23 17:30:00', '[결제]취소');

insert into energy (user_id, energy_saveuse, energy_date, energy_sources)
values ('user-1', -1000, '2022-07-23 18:33:00', '[결제]사용');

insert into energy (user_id, energy_saveuse, energy_date, energy_sources)
values ('user-1', 230, '2022-07-23 18:34:00', '[결제]적립');

insert into energy (user_id, energy_saveuse, energy_date, energy_sources)
values ('user-1', 100, '2022-08-01 00:00:00', '[리뷰]적립');

insert into energy (user_id, energy_saveuse, energy_date, energy_sources)
values ('user-3', 840, '2022-08-01 18:36:00', '[결제]적립');

insert into energy (user_id, energy_saveuse, energy_date, energy_sources)
values ('user-3', 100, '2022-08-08 00:00:00', '[리뷰]적립');

insert into energy (user_id, energy_saveuse, energy_date, energy_sources)
values ('user-3', 100, '2022-08-11 00:00:00', '[리뷰]적립');

insert into energy (user_id, energy_saveuse, energy_date, energy_sources)
values ('user-4', 1000, '2022-07-14 00:00:00', '[회원가입]적립');

insert into energy (user_id, energy_saveuse, energy_date, energy_sources)
values ('user-4', 3000, '2022-08-02 12:03:00', '[결제]적립');

insert into energy (user_id, energy_saveuse, energy_date, energy_sources)
values ('user-5', 1000, '2022-10-01 00:00:00', '[회원가입]적립');

insert into energy (user_id, energy_saveuse, energy_date, energy_sources)
values ('user-6', 1000, '2023-04-01 00:00:00', '[회원가입]적립');

insert into energy (user_id, energy_saveuse, energy_date, energy_sources)
values ('user-3', 500, '2023-06-07 12:11:00', '[설문조사]적립');
