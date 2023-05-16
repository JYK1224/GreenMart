-- 사원 --
create table employee(
    e_id varchar2(10) primary key,
    e_name varchar2(30) not null,
    e_passwd varchar2(30) not null,
    e_intro varchar2(100) ,
    e_indate date default sysdate ,
    j_id varchar2(10) not null references jumpo(j_id)
);

-- drop table employee cascade constraints;

-- 점포 --
create table jumpo (
    j_id varchar2(10) primary key ,
    j_name varchar2(30) not null

);

-- drop table jumpo;
-- 거래처 --
create table dept (
    d_id varchar2(10) primary key,
    d_name varchar2(30) not null,
    d_dam varchar2(30) not null,
    d_phone varchar2(30) 
);

-- drop table dept cascade constraints;
-- 고객 --
create table client (
    c_id varchar2(10) primary key,
    c_name varchar2(30) not null,
    c_phone varchar2(30) not null,
    c_mile varchar2(30) default 0
    
);

-- drop table client cascade constraints;

-- 상품분류 --
create table assortment (
    a_id varchar2(10) primary key,
    a_name varchar2(30) not null
);

-- 상품 --
CREATE SEQUENCE  p_seq;
create table product (
    p_seq NUMBER(10, 0) DEFAULT 0 primary key,
    p_name varchar2(30) not null,
    p_iprice number(20) not null,
    p_sprice number(20) not null,
    p_del number(1) default 0,
    d_id varchar2(10) not null references dept(d_id),
    a_id varchar2(10) not null references assortment(a_id),
    j_id varchar2(10) not null references jumpo(j_id)
       
);

--drop table product cascade constraints;

-- 주문 -- 
create table ordering (
    o_id varchar2(10) primary key,
    o_date date default sysdate,
    o_num number(20) not null,
    e_id varchar2(10) not null references employee(e_id),
    p_seq number(10,0) not null references product(p_seq),
    d_id varchar2(10) not null references dept(d_id)
);
-- drop table ordering cascade constraints;

-- 입고 --
create table input(
    in_id varchar2(10) primary key,
    in_date date default sysdate,
    in_num number(20) not null,
    e_id varchar2(10) not null references employee(e_id),
    p_seq number(10,0) not null references product(p_seq)
);
-- drop table input cascade constraints;

-- 출고 --
create table output(
    out_id varchar2(10) primary key,
    out_date date default sysdate,
    out_num number(20) not null,
    e_id varchar2(10) not null references employee(e_id),
    p_seq number(10,0) references product(p_seq)
);
-- drop table output cascade constraints;

-- 판매 --
create table sale(
    s_id varchar2(10) primary key,
    s_date date default sysdate,
    s_num number(20) not null,
    c_id varchar2(10) not null references client(c_id),
    e_id varchar2(10) not null references employee(e_id),
    p_seq number(10,0) not null references product(p_seq)

);
--drop table sale cascade constraints;

-- 폐기 --
create table disuse(
    dis_id varchar2(10) primary key,
    dis_date date default sysdate,
    dis_num number(20) not null,
    e_id varchar2(10) not null references employee(e_id),
    p_seq number(10,0) not null references product(p_seq)
);
-- drop table disuse cascade constraints;

-- 재고 -- 
create table stock(
    st_id varchar(10) primary key,
    st_num number(20) not null,
    d_id varchar2(10) not null references dept(d_id),
    p_seq number(10,0) not null references product(p_seq)
);
-- drop table stock cascade constraints;

commit;
