# [정산 테이블]
CREATE TABLE calc (
    calc_no        varchar(35)	  NOT NULL  primary key,   #정산 코드(식별코드 따로 만들어서 사용)
    host_id        varchar(25)	  NOT NULL,                #호스트 아이디
    calc_date      varchar(50)	  NOT NULL,                #정산 기간
    calc_title     varchar(100)   NOT NULL,                #정산서 제목
    calc_ttlprice  int	          NOT NULL  DEFAULT 0,     #총 지급액(수수료 전)
    calc_fee       int	          NOT NULL  DEFAULT 0,     #총 수수료 액
    calc_status    char(1)	      NOT NULL  DEFAULT 'N',   #지급 상태
    calc_addate    datetime	      NOT NULL  DEFAULT now(), #정산 등록일
    cont_no        int            NOT NULL,                #콘텐츠 번호      //insert에 조금더 유용하게 활용하기 위해 추가
    host_account   bigint         NOT NULL,                #정산계좌번호     //추가 (계좌번호 변동시 이미 정산된 기록에도 바뀌어서)
    host_bank      varchar(15)    NOT NULL,                #은행이름        //추가 (계좌번호 변동시 이미 정산된 기록에도 바뀌어서)
    host_acholder  varchar(15)    NOT NULL                 #예금주          //추가 (계좌번호 변동시 이미 정산된 기록에도 바뀌어서)
);

insert into calc (calc_no, host_id, calc_date, calc_title, calc_ttlprice, calc_fee, calc_addate, calc_status, cont_no, host_account, host_bank, host_acholder)
values ('C202205100000001', 'uesr-1', '2022.04.10 - 2022.05.09', '[서핑]원데이클래스 정산총액', 150000, 30000, '2022-05-10 00:00:00','Y', 1, 123412123456, '해빗은행', '호스트1');

insert into calc (calc_no, host_id, calc_date, calc_title, calc_ttlprice, calc_fee, calc_addate, calc_status, cont_no, host_account, host_bank, host_acholder)
values ('C202208200000001', 'uesr-2', '2022.07.20 - 2022.08.19', '[심리상담] 1:1 상담 회차권 판매', 48000, 9600, '2022-08-20 00:00:00','Y', 2, 123412123457, '해빗은행', '호스트2');

insert into calc (calc_no, host_id, calc_date, calc_title, calc_ttlprice, calc_fee, calc_addate, calc_status, cont_no, host_account, host_bank, host_acholder)
values ('C202209010000001', 'uesr-2', '2022.08.01 - 2022.08.31', '[베이킹] 휘낭시에 만들기 원데이클래스 정산총액', 360000, 72000, '2022-09-01 00:00:00','Y', 3, 123412123457, '해빗은행', '호스트2');



# [정산 상세 테이블]
CREATE TABLE calcd (
    calcd_no      int	         NOT NULL  auto_increment  primary key, #정산 상세 코드
    calc_no       varchar(35)	 NOT NULL,                              #정산 코드
    payd_no       int	         NOT NULL,                              #주문 상세 번호
    pro_no        varchar(35)	 NOT NULL,                              #상품 코드
    calcd_price   int	         NOT NULL,                              #금액
    calcd_qty     int	         NOT NULL,                              #수량
    calcd_status  char(1)	     NOT NULL,                              #주문상세상태
    calcd_date    varchar(35)	 NOT NULL                               #결제 날짜
);

insert into calcd (calc_no, payd_no, pro_no, calcd_price, calcd_qty, calcd_status, calcd_date)
values ('C202205100000001', 1, 'o_no1', 30000, 5, 'Y', '2022-04-13 02:02:02');

insert into calcd (calc_no, payd_no, pro_no, calcd_price, calcd_qty, calcd_status, calcd_date)
values ('C202208200000001', 2, 'p_no2', 18000, 1, 'R', '2022-07-22 01:01:01');

insert into calcd (calc_no, payd_no, pro_no, calcd_price, calcd_qty, calcd_status, calcd_date)
values ('C202208200000001', 3, 'p_no3', 24000, 1, 'Y', '2022-07-23 18:33:00');

insert into calcd (calc_no, payd_no, pro_no, calcd_price, calcd_qty, calcd_status, calcd_date)
values ('C202208200000001', 4, 'p_no3', 24000, 1, 'Y', '2022-08-01 18:35:00');

insert into calcd (calc_no, payd_no, pro_no, calcd_price, calcd_qty, calcd_status, calcd_date)
values ('C202209010000001', 5, 'o_no3', 30000, 2, 'Y', '2022-08-01 18:35:00');

insert into calcd (calc_no, payd_no, pro_no, calcd_price, calcd_qty, calcd_status, calcd_date)
values ('C202209010000001', 6, 'o_no3', 30000, 10, 'Y', '2022-08-02 12:03:00');
