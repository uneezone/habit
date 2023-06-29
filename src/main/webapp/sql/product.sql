# [카테고리 테이블]
CREATE TABLE cate (
    cate_no      varchar(10)  NOT NULL  primary key,
    cate_large   varchar(50)  NOT NULL,
    cate_middle  varchar(50)  NOT NULL
);

select cate_large
from cate
group by cate_large
order by cate_large;

# o 아웃도어 (서핑, 등산, 캠핑),
insert into cate (cate_no, cate_large, cate_middle)
values ('o1','아웃도어', '서핑');

insert into cate (cate_no, cate_large, cate_middle)
values ('o2', '아웃도어', '등산');

insert into cate (cate_no, cate_large, cate_middle)
values ('o3', '아웃도어', '캠핑');

# s 스포츠 (댄스, 클라이밍, 실내다이빙),
insert into cate (cate_no, cate_large, cate_middle)
values ('s1','스포츠', '댄스');

insert into cate (cate_no, cate_large, cate_middle)
values ('s2', '스포츠', '클라이밍');

insert into cate (cate_no, cate_large, cate_middle)
values ('s3', '스포츠', '실내다이빙');

# f 피트니스 (요가, 필라테스, 헬스),
insert into cate (cate_no, cate_large, cate_middle)
values ('f1','피트니스', '요가');

insert into cate (cate_no, cate_large, cate_middle)
values ('f2', '피트니스', '필라테스');

insert into cate (cate_no, cate_large, cate_middle)
values ('f3', '피트니스', '헬스');

# c 공예DIY (가죽, 도자기, 플라워),
insert into cate (cate_no, cate_large, cate_middle)
values ('c1','공예DIY', '가죽');

insert into cate (cate_no, cate_large, cate_middle)
values ('c2', '공예DIY', '도자기');

insert into cate (cate_no, cate_large, cate_middle)
values ('c3', '공예DIY', '플라워');

# b 베이킹 (휘낭시에, 스콘, 케이크),
insert into cate (cate_no, cate_large, cate_middle)
values ('b1','베이킹', '휘낭시에');

insert into cate (cate_no, cate_large, cate_middle)
values ('b2', '베이킹', '스콘');

insert into cate (cate_no, cate_large, cate_middle)
values ('b3', '베이킹', '케이크');

# a 문화예술 (미술, 연기, 공연),
insert into cate (cate_no, cate_large, cate_middle)
values ('a1','문화예술', '미술');

insert into cate (cate_no, cate_large, cate_middle)
values ('a2', '문화예술', '연기');

insert into cate (cate_no, cate_large, cate_middle)
values ('a3', '문화예술', '공연');

# d 자기계발 (투잡, 재테크),
insert into cate (cate_no, cate_large, cate_middle)
values ('d1', '자기계발', '투잡');

insert into cate (cate_no, cate_large, cate_middle)
values ('d2', '자기계발', '재테크');

# l 상담 (사주, 심리상담, 성격심리검사)
insert into cate (cate_no, cate_large, cate_middle)
values ('l1','상담', '사주');

insert into cate (cate_no, cate_large, cate_middle)
values ('l2', '상담', '심리상담');

insert into cate (cate_no, cate_large, cate_middle)
values ('l3', '상담', '성격심리검사');

# o 아웃도어 (서핑, 등산, 캠핑),
# s 스포츠 (댄스, 클라이밍, 실내다이빙),
# f 피트니스 (요가, 필라테스, 헬스),
# c 공예DIY (가죽, 도자기, 플라워),
# b 베이킹 (휘낭시에, 스콘, 케이크),
# a 문화예술 (미술, 연기, 공연),
# d 자기계발 (투잡, 재테크),
# l 상담 (사주, 심리상담, 성격심리검사)

select *
from cate a join cont b on a.cate_no = b.cate_no
where cate_large = '베이킹';


# [콘텐츠 테이블]
CREATE TABLE cont (
    cont_no        int	         NOT NULL	 auto_increment  primary key, #콘텐츠 코드
    cate_no        varchar(10) 	 NOT NULL,                                #카테고리 코드
    host_id        varchar(25)	 NOT NULL,                                #호스트 아이디
    cont_name      varchar(50)	 NOT NULL,                                #콘텐츠 명
    cont_zip       varchar(30)	 NOT NULL,                                #콘텐츠 장소 zip
    cont_addr1     varchar(30)   NOT NULL,                                #콘텐츠 장소1
    cont_addr2     varchar(30)   NULL,                                    #콘텐츠 장소2
    cont_extaddr   varchar(30)   NULL,                                    #콘텐츠 장소 참고항목
    cont_img       varchar(200)	 NOT NULL,                                #대표이미지
    cont_content   Text(6500)    NOT NULL,                                #콘텐츠 설명
    cont_view      int	         NOT NULL	 DEFAULT 0,                   #조회수
    cont_stdate    datetime	     NOT NULL    DEFAULT now(),              #콘텐츠 등록일
    cont_endate    datetime	     NOT NULL,                                #콘텐츠 종료일
    cont_hashtag1  varchar(35)	 NOT NULL,                                #해시태그1
    cont_hashtag2  varchar(35)	 NOT NULL,                                #해시태그2
    cont_hashtag3  varchar(35)	 NOT NULL,                                #해시태그3
    cont_hashtag4  varchar(35)	 NOT NULL,                                #해시태그4
    cont_hashtag5  varchar(35)	 NOT NULL,                                #해시태그5
    cont_status    char(1)	     NOT NULL  DEFAULT 'Y'                    #콘텐츠 판매 상태
);//이미지 사이즈 제거

insert into cont (cate_no, host_id, cont_name, cont_zip, cont_addr1, cont_addr2, cont_extaddr, cont_stdate, cont_endate, cont_img, cont_content, cont_hashtag1, cont_hashtag2, cont_hashtag3, cont_hashtag4, cont_hashtag5,cont_status)
values ('o1', 'user-1', '[서핑]원데이클래스', '06234', '서울 강남구 테헤란로 124', '4층', '(역삼동)', '2022-04-10 14:00:00', '2022-05-10 00:00:00', 'surfing.jpg', '서핑가보자고', 'N','20|30', 'OUT', 'WC|WF|WA', 'P5','N');

insert into cont (cate_no, host_id, cont_name, cont_zip, cont_addr1, cont_addr2, cont_extaddr, cont_stdate, cont_endate, cont_img, cont_content, cont_hashtag1, cont_hashtag2, cont_hashtag3, cont_hashtag4, cont_hashtag5,cont_status)
values ('l2', 'user-2', '[심리상담] 1:1 상담 회차권 판매', '06234', '서울 강남구 테헤란로 124', '4층', '(역삼동)', '2022-07-20 12:00:00', '2022-08-20 00:00:00', 'talk.jpg', '너의 마음 건강 체크', 'N','20|30|40|50', 'IN', 'WA', 'P3' ,'N');

insert into cont (cate_no, host_id, cont_name, cont_zip, cont_addr1, cont_addr2, cont_extaddr, cont_stdate, cont_endate, cont_img, cont_content, cont_hashtag1, cont_hashtag2, cont_hashtag3, cont_hashtag4, cont_hashtag5,cont_status)
values ('b1', 'user-2', '[베이킹] 휘낭시에 만들기 원데이클래스', '06234', '서울 강남구 테헤란로 124', '4층', '(역삼동)', '2022-08-01 00:00:00', '2022-09-01 00:00:00', 'eat.jpg', '구워보자', 'N','20|30', 'IN', 'WC|WF|WA', 'P5','N' );



# [원데이클래스 테이블]
CREATE TABLE one (
    pro_no      varchar(35)	 NOT NULL  primary key, #상품코드
    cont_no     int	         NOT NULL,              #콘텐츠 코드
    one_date    varchar(35)	 NOT NULL,              #상품명(수업일시)
    one_maxqty  int	         NOT NULL  DEFAULT 0,   #최대모집인원(총수량)
    one_price   int	         NOT NULL  DEFAULT 0,   #가격
    one_status  char(2)	     NOT NULL  DEFAULT 'OO' #상품 상태(OO:예약가능, OC:예약불가, OS:품절)
);
# 원데이 클래스 시퀀스(상품코드에 사용)
create sequence habit.sq_one
start with 1
increment by 1
maxvalue 999999
cycle;

insert into one(pro_no, cont_no, one_date, one_maxqty, one_price,one_status)
values(concat('o_no',nextval(habit.sq_one)), 1, '2022-04-17 14:00:00', 5, 30000,'OS');

insert into one(pro_no, cont_no, one_date, one_maxqty, one_price,one_status)
values(concat('o_no',nextval(habit.sq_one)), 1, '2022-04-24 14:00:00', 5, 30000,'OC');

insert into one(pro_no, cont_no, one_date, one_maxqty, one_price,one_status)
values(concat('o_no',nextval(habit.sq_one)), 3, '2022-08-10 15:00:00', 20, 30000,'OC');




# [회원권/회차권 테이블]
CREATE TABLE prod (
    pro_no       varchar(35)  NOT NULL  primary key, #상품코드
    cont_no      int          NOT NULL,              #콘텐츠 코드
    prod_name    varchar(50)  NOT NULL,              #상품명
    prod_qty     int          NOT NULL  DEFAULT 0,   #판매수량
    prod_price   int          NOT NULL  DEFAULT 0,   #가격
    prod_status  char(2)      NOT NULL  DEFAULT 'PO' #상품상태(PO:구매가능, PC:구매불가, PS:품절)
);
# 회원권/회차권 시퀀스(상품코드에 사용)
create sequence habit.sq_prod
start with 1
increment by 1
maxvalue 999999
cycle;

insert into prod(pro_no, cont_no, prod_name, prod_qty, prod_price,prod_status)
values(concat('p_no',nextval(habit.sq_prod)), 2, '1회권', 10, 10000, 'PC');

insert into prod(pro_no, cont_no, prod_name, prod_qty, prod_price,prod_status)
values(concat('p_no',nextval(habit.sq_prod)), 2, '2회권', 10, 18000, 'PC');

insert into prod(pro_no, cont_no, prod_name, prod_qty, prod_price,prod_status)
values(concat('p_no',nextval(habit.sq_prod)), 2, '3회권', 10, 24000, 'PC');

select *
from prod c join
     (select b.*
      from cate a join cont b
                       on a.cate_no = b.cate_no) d
 on c.cont_no = d.cont_no;