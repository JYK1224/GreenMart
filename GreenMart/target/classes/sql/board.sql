-- 게시판 --
-- 메뉴 --
CREATE SEQUENCE  m_seq;
create  table  menus (
      m_id    varchar2(10)   not  null  primary key       
    , m_name   varchar2(120)   not  null
    , m_seq    number(5, 0)    default  0
);    


create   table   gongji
(
      g_idx number(10) primary key
    , g_title varchar2( 30  ) not null
    , g_cont varchar2( 4000 )  
    , g_regdate date default sysdate 
    , g_readcount      number( 6, 0 )      default  0
    , m_id varchar2(10) not null references   menus (m_id)
    , e_id varchar2(10) not null references employee (e_id)
);

create   table   workpage
(
      w_idx number(10) primary key
    , w_title varchar2( 30  ) not null
    , w_cont varchar2( 4000 )  
    , w_regdate date default sysdate 
    , w_readcount      number( 6, 0 )      default  0
    , m_id varchar2(10) not null references   menus (m_id)
    , e_id varchar2(10) not null references employee (e_id)
);

create   table   contgrats
(
      cg_idx number(10) primary key
    , cg_title varchar2( 30  ) not null
    , cg_cont varchar2( 4000 )  
    , cg_regdate date default sysdate 
    , cg_readcount      number( 6, 0 )      default  0
    , m_id varchar2(10) not null references   menus (m_id)
    , e_id varchar2(10) not null references employee (e_id)
    , cg_bnum number( 5, 0 )      default  0
    , cg_lvl  number( 5, 0 )      default  0
    , cg_step number( 5, 0 )      default  0
    , cg_nref number( 5, 0 )      default  0
    , cg_del  number(1) default 0
    , cg_pnum number(10) default 0 
);



create   table   dataroom
(
      da_idx number(10) primary key
    , da_title varchar2( 30  ) not null
    , da_cont varchar2( 4000 )  
    , da_regdate date default sysdate 
    , da_readcount      number( 6, 0 )      default  0
    , m_id varchar2(10) not null references   menus (m_id)
    , e_id varchar2(10) not null references employee (e_id)
    , da_bnum number( 5, 0 )      default  0
    , da_lvl  number( 5, 0 )      default  0
    , da_step number( 5, 0 )      default  0
    , da_nref number( 5, 0 )      default  0
    , da_del  number(1) default 0
    , da_pnum number(10) default 0 
);

-- 시퀀스
create sequence  f_seq;

delete function get_f_num;

-- oracle 함수 생성
create  or replace  function   get_f_num  
return
   number
as  
   num  number;
begin
   select   f_seq.nextval
     into   num
     from   dual;
     return  num;
end;
   
-- 파일 --   
create table    files
(
      f_seq      number(10, 0) default 0 primary key   -- 파일 번호   
    , f_idx      number(10)               -- 게시글 번호
    , f_board    varchar2(10) 
    , f_name     varchar2(300)   not null    -- 파일명
    , f_ext      varchar2(300)   not null    -- 파일 확장자
    , f_sname    varchar2(300)   not null    -- 자장된 실제 파일명
    
);

   
-- 파일 --   
create table    files
(
      f_seq      number(10, 0) default 0 primary key   -- 파일 번호   
    , idx        number(10) not null references board(idx)               -- 게시글 번호
    , f_name     varchar2(300)   not null    -- 파일명
    , f_ext      varchar2(300)   not null    -- 파일 확장자
    , f_sname    varchar2(300)   not null    -- 자장된 실제 파일명
    
);

-- 게시판 --

create table board (
      idx     number(10, 0)    primary key
    , m_id   varchar2( 6 )       not null  references   menus ( m_id  )
    , title  varchar2( 300  )    not null
    , cont   varchar2( 4000 )  
    , e_id   varchar2( 10 ) not null references employee (e_id)
    , regdate date default  sysdate 
    , readcount number( 6, 0 )      default  0
    
    , bnum number( 5, 0 )      default  0
    , lvl  number( 5, 0 )      default  0
    , step number( 5, 0 )      default  0
    , nref number( 5, 0 )      default  0
    , del number(1)            default  0
    , pnum number (10)         default  0
);





