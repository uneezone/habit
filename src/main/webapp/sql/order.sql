# [장바구니 테이블]
CREATE TABLE cartlist (
                          cl_no    int          NOT NULL  auto_increment  primary key, #장바구니 코드
    user_id  varchar(25)  NOT NULL,                              #구매 회원 아이디
  pro_no   varchar(35)  NOT NULL,                              #상품 코드
    cl_qty   int          NOT NULL  DEFAULT 0,                   #수량
    cl_date  datetime     NOT NULL  DEFAULT now()                #장바구니 등록일
);

insert into cartlist(user_id, pro_no, cl_qty, cl_date)
values('user-2', 'o_no1', 5, '2022-04-13 00:00:00');

insert into cartlist(user_id, pro_no, cl_qty, cl_date)
values('user-1', 'p_no2', 1, '2022-07-22 00:00:00');

insert into cartlist(user_id, pro_no, cl_qty, cl_date)
values('user-1', 'p_no3', 1, '2022-07-23 18:30:00');


insert into cartlist(user_id, pro_no, cl_qty, cl_date)
values('user-3', 'p_no3', 1, '2022-08-01 18:30:00');

insert into cartlist(user_id, pro_no, cl_qty, cl_date)
values('user-3', 'o_no3', 2, '2022-08-01 18:33:00');


insert into cartlist(user_id, pro_no, cl_qty, cl_date)
values('user-4', 'o_no3', 10, '2022-08-02 11:03:00');



# [주문서 테이블]
CREATE TABLE pay (
                     pay_no      varchar(20)  NOT NULL  primary key,  #주문서 번호(식별코드 따로 만들어서 사용)
    user_id     varchar(25)  NOT NULL,               #회원아이디
    pay_total   int          NOT NULL	 DEFAULT 0,    #할인전 금액
    pay_point   int          NOT NULL	 DEFAULT 0,    #사용 에너지
    pay_method  char(1)      NOT NULL,               #결제 수단
    pay_status  char(1)      NOT NULL	 DEFAULT 'A',  #주문 상태
    pay_date    datetime     NOT NULL	 DEFAULT now() #주문 날짜
);

insert into pay (pay_no, user_id, pay_total, pay_point, pay_method, pay_date)
values ('P202204130202021', 'user-2', 150000, 1000, 'C','2022-04-13 02:02:02');

insert into pay (pay_no, user_id, pay_total, pay_point, pay_method, pay_date, pay_status)
values ('P202207220101011', 'user-1', 18000, 0, 'C', '2022-07-22 01:01:01', 'C');

insert into pay (pay_no, user_id, pay_total, pay_point, pay_method, pay_date)
values ('P202207231833001', 'user-1', 24000, 1000, 'C', '2022-07-23 18:33:00');

insert into pay (pay_no, user_id, pay_total, pay_point, pay_method, pay_date)
values ('P202208011835001', 'user-3', 84000, 0, 'C', '2022-08-01 18:35:00');

insert into pay (pay_no, user_id, pay_total, pay_point, pay_method, pay_date)
values ('P202208021203001', 'user-4', 300000, 0, 'C', '2022-08-02 12:03:00');




# [주문 상세 테이블]
CREATE TABLE payd (
                      payd_no      int          NOT NULL  auto_increment  primary key, #주문 상세 번호
                      user_id      varchar(25)  NOT NULL,                              #회원 아이디
    pay_no       varchar(20)  NOT NULL,                              #주문서 번호
    pro_no       varchar(35)  NOT NULL,                              #상품 코드
    payd_price   int          NOT NULL  DEFAULT 0,                   #상품 금액(1개단위)
  payd_qty     int          NOT NULL  DEFAULT 0,                   #주문 수량
    payd_status  char(1)      NOT NULL  DEFAULT 'R',                 #주문 상세 상태
  refn_status  char(4)      NOT NULL  DEFAULT 'RO',                #환불 상태
    payd_date    datetime     NOT NULL  DEFAULT now()                #주문 날짜
);

insert into payd (user_id, pay_no, pro_no, payd_price, payd_qty, payd_status, refn_status, payd_date)
values ('user-2', 'P202204130202021', 'o_no1', 30000, 5, 'Y', 'NRO', '2022-04-13 02:02:02');

insert into payd (user_id, pay_no, pro_no, payd_price, payd_qty, payd_status, refn_status, payd_date)
values ('user-1','P202207220101011', 'p_no2', 18000, 1, 'C', 'CFRO', '2022-07-22 01:01:01');

insert into payd (user_id, pay_no, pro_no, payd_price, payd_qty, payd_status, refn_status, payd_date)
values ('user-1','P202207231833001', 'p_no3', 24000, 1, 'Y', 'NRO', '2022-07-23 18:33:00');

insert into payd (user_id, pay_no, pro_no, payd_price, payd_qty, payd_status, refn_status, payd_date)
values ('user-3', 'P202208011835001', 'p_no3', 24000, 1, 'Y', 'NRO', '2022-08-01 18:35:00');

insert into payd (user_id, pay_no, pro_no, payd_price, payd_qty, payd_status, refn_status, payd_date)
values ('user-3', 'P202208011835001', 'o_no3', 30000, 2, 'Y', 'NRO', '2022-08-01 18:35:00');

insert into payd (user_id, pay_no, pro_no, payd_price, payd_qty, payd_status, refn_status, payd_date)
values ('user-4', 'P202208021203001', 'o_no3', 30000, 10, 'Y', 'NRO', '2022-08-02 12:03:00');



# [환불 테이블]
CREATE TABLE refn (
    refn_no      int          NOT NULL	auto_increment  primary key, #환불코드
    payd_no      int          NOT NULL,                              #주문상세번호
    user_id      varchar(25)  NOT NULL,                              #회원아이디
    pro_no       varchar(35)  NOT NULL,                              #상품코드
    refn_qty     int          NOT NULL	DEFAULT 0,                   #환불 수량
    refn_point   int          NOT NULL	DEFAULT 0,                   #환불 에너지
    refn_pay     int          NOT NULL	DEFAULT 0,                   #실 환불액
    refn_method  char(1)      NOT NULL,                              #환불 수단
    refn_date    datetime     NOT NULL	DEFAULT now()                #환불 날짜
);

insert into refn (payd_no, user_id, pro_no, refn_pay, refn_point, refn_method, refn_date, refn_qty)
values (2, 'user-1', 'p_no2', 18000, 0, 'C', '2022-07-23 17:30:00' , 1);

select * from refn;