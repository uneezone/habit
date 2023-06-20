insert into cont (cate_no, host_id, cont_name, cont_zip, cont_addr1, cont_addr2, cont_extaddr, cont_stdate, cont_endate, cont_img, cont_content, cont_hashtag1, cont_hashtag2, cont_hashtag3, cont_hashtag4, cont_hashtag5,cont_status)
values ('b1', 'user-2', '[베이킹] 스콘 만들기 원데이클래스', '06234', '서울 강남구 테헤란로 124', '4층', '(역삼동)', '2023-05-10 00:00:00', '2023-6-19 00:00:00', 'eat.jpg', '구워보자', 'N','20|30', 'IN', 'WC|WF|WA', 'P5','N' );
select * from one;
select * from cont;

insert into one(pro_no, cont_no, one_date, one_maxqty, one_price,one_status)
values(concat('o_no',4), 6, '2023-05-12 15:00:00', 20, 30000,'OC');

insert into one(pro_no, cont_no, one_date, one_maxqty, one_price,one_status)
values(concat('o_no',5), 6, '2023-05-16 16:00:00', 20, 30000,'OC');


insert into one(pro_no, cont_no, one_date, one_maxqty, one_price,one_status)
values(concat('o_no',6), 6, '2023-06-18 14:00:00', 20, 30000,'OC');

####################################################
select * from pay;

insert into pay (pay_no, user_id, pay_total, pay_point, pay_method, pay_date)
values ('P202305111500001', 'user-1', 60000, 0, 'C','2023-05-11 15:00:00');

insert into pay (pay_no, user_id, pay_total, pay_point, pay_method, pay_date)
values ('P202306021203002', 'user-4', 30000, 0, 'C','2023-06-02 12:03:00');


#######################################################
select * from payd p join one o on p.pro_no = o.pro_no;

insert into payd (user_id, pay_no, pro_no, payd_price, payd_qty, payd_status, refn_status, payd_date)
values ('user-1', 'P202305111500001', 'o_no4', 30000, 1, 'Y', 'NRO', '2023-05-11 15:00:00');

insert into payd (user_id, pay_no, pro_no, payd_price, payd_qty, payd_status, refn_status, payd_date)
values ('user-1', 'P202305111500001', 'o_no5', 30000, 1, 'C', 'CFRO', '2023-05-11 15:00:00');

insert into payd (user_id, pay_no, pro_no, payd_price, payd_qty, payd_status, refn_status, payd_date)
values ('user-4', 'P202306021203002', 'o_no6', 30000, 1, 'R', 'RO', '2023-06-02 12:03:00');

##########################6.20 테스트###############################
insert into cont (cate_no, host_id, cont_name, cont_zip, cont_addr1, cont_addr2, cont_extaddr, cont_img, cont_size, cont_content, cont_stdate
, cont_endate, cont_hashtag1, cont_hashtag2, cont_hashtag3, cont_hashtag4, cont_hashtag5)
values ("f1","user-4","[요가] 건강한 몸 만들기",'06234', '서울 강남구 테헤란로 124', '4층', '(역삼동)','yo.png',100,'건강한 몸 만들기','2023-04-20 12:30:00'
,'2023-06-30 0:00:00','N','20|30', 'IN', 'WC|WF|WA', 'P5');

####################################################################
insert into prod(pro_no, cont_no, prod_name, prod_qty, prod_price, prod_status)
values(concat('p_no',10), 7, '1회권', 15, 35000,'PO');
insert into prod(pro_no, cont_no, prod_name, prod_qty, prod_price, prod_status)
values(concat('p_no',11), 7, '3회권', 15, 100000,'PO');
insert into prod(pro_no, cont_no, prod_name, prod_qty, prod_price, prod_status)
values(concat('p_no',12), 7, '5회권', 15, 160000,'PO');
######################################################################
insert into pay (pay_no, user_id, pay_total, pay_point, pay_method, pay_date)
values ('P202304281600021', 'user-2', 70000, 1000, 'C','2023-04-28 16:00:02');

insert into energy(user_id, energy_saveuse, energy_date, energy_sources)
values ("user-2",-1000,"2023-04-28 16:00:02","[결제]사용");

insert into pay (pay_no, user_id, pay_total, pay_point, pay_method, pay_date)
values ('P202305011533221', 'user-1', 135000, 0, 'C','2023-05-01 15:33:22');
############################################################################
insert into payd (user_id, pay_no, pro_no, payd_price, payd_qty, payd_status, refn_status, payd_date)
values ('user-2', 'P202304281600021', 'p_no10', 35000, 2, 'Y', 'NRO', '2023-04-28 16:00:02');

insert into payd (user_id, pay_no, pro_no, payd_price, payd_qty, payd_status, refn_status, payd_date)
values ('user-1', 'P202305011533221', 'p_no10', 35000, 1, 'R', 'NRO', '2023-05-01 15:33:22');

insert into payd (user_id, pay_no, pro_no, payd_price, payd_qty, payd_status, refn_status, payd_date)
values ('user-1', 'P202305011533221', 'p_no11', 100000, 1, 'R', 'NRO', '2023-05-01 15:33:22');


###################################
insert into energy (user_id, energy_saveuse, energy_date, energy_sources)
values ("user-1",1350,'2023-05-01 15:33:22',"[결제]적립");

insert into energy (user_id, energy_saveuse, energy_date, energy_sources)
values ("user-1",600,'2023-05-11 15:00:00',"[결제]적립");

insert into energy (user_id, energy_saveuse, energy_date, energy_sources)
values ("user-4",1170,'2023-06-02 12:03:00',"[결제]적립");
insert into energy (user_id, energy_saveuse, energy_date, energy_sources)
values ("user-4",900,'2023-06-02 13:03:00',"[결제]적립");
insert into energy (user_id, energy_saveuse, energy_date, energy_sources)
values ("user-3",510,'2023-06-15 12:03:00',"[결제]적립");
