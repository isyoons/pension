create table gallery(
	no int not null primary key auto_increment comment 'auto index',
	title varchar(30) not null comment 'img title',
	contents text comment 'img comment',
	upload_date datetime not null comment 'upload date',
	upload_img varchar(100) not null comment 'img name',
	upload_type char(1) not null default 'W' comment 'upload type',
	click_count int not null default 0 comment 'click count'
) comment 'gallery';

create table tmember (
	t_tel char(11) not null primary key comment 'manager tel',
	t_name varchar(30) not null comment 'manager name',
	t_password varchar(50) not null comment 'manager password'
) comment 'pension manager';

insert into tmember values
('01049157241', 'mimars', md5('testtesttest'));
create table roomInfo(
roomCode char(4) primary key,
roomName varchar(13),
stdNum int(2),
maxNum int(2),
coupleRoom BOOLEAN,
doubleLayer BOOLEAN,
spa BOOLEAN,
lowSeasonWeekdayPrice INT(7),
lowSeasonFridayPrice INT(7),
lowSeasonWeekendPrice INT(7),
middleSeasonWeekdayPrice INT(7),
middleSeasonWeekendPrice INT(7),
highSeasonWeekdayPrice INT(7),
highSeasonWeekendPrice INT(7),
equipment text
);
insert into roomInfo values('a101','찜갓','2','10',true,true,true,100000,150000,200000,300000,350000,350000,400000,'여어~ 히사시부리!');
select *from roomInfo;
create table resveInfo(
resveCode char(4) primary key,
roomCode char(4),
resveCtm varchar(20),
phoneNumber char(11),
resveDay date,
resvePd int(2),
FOREIGN key(roomCode) REFERENCES roomInfo(roomCode)
);
insert into resveInfo values('b101','a101','갓','01000000000',20160211,20160213);
create table resveCtmInfo(
 resveCode char(4),
 resveNum int(2),
 birthday int(6),
 arrivalDate datetime,
 paymentPrice int(10),
 isDeposit boolean,
 isBarbecue boolean,
 isPool boolean,
 FOREIGN key(resveCode) REFERENCES resveInfo(resveCode) 
);
insert into resveCtmInfo values('b101',5,990111,20160211040000,350000,true,true,true);
select * from resveInfo s,resveCtmInfo b where s.resveCode=b.resveCode;
create table resveStatusInfo(
resveDay date,
roomcode char(4),
resveStatus int(1),
FOREIGN key(roomCode) REFERENCES roomInfo(roomCode)
);
 create table roomImgInfo(
 roomCode char(4),
 roomImg varchar(255),
 FOREIGN key(roomCode) REFERENCES roomInfo(roomCode)
 );

create table board(
	num int not null auto_increment, -- 글 번호
	dpassword int(10) not null,		 -- 글 패스워드(삭제나 수정시 필요)
	title varchar(20) not null,		 -- 글 제목
	bname varchar(10) not null,		 -- 글 게시자 명
	content text,					 -- 글 내용
	dob date not null,				 -- 글 작성일
	pic varchar(100),				 -- 사진파일 경로
	pictype char(1) default 'W',
	bsection varchar(5),			 -- 글 종류 구분(공지사항 : N, 질문 : Q, 여행후기 : E)
	bcount int,						 -- 조회수
	PRIMARY KEY(num)
);

create table bcomment(
	num int not null,
	cnum int not null auto_increment,
	cname varchar(10) not null,
	cpassword int(10) not null,
	commant varchar(1000) not null,
	cdob datetime not null,
	PRIMARY KEY(cnum),
	FOREIGN KEY(num) REFERENCES board(num)
);

drop table bcomment;

insert into bcomment (num, cnum, cname, cpassword, commant, cdob)
values(64, null, 'aa', 1, '내가 짱이다', now());

insert into board (num, dpassword, title, bname, content, dob, pic, bsection, bcount)
values (null, 1, 'test', '관리자', 'testtesttesttesttesttesttesttesttest', now(), null, 'N', 0);

insert into board VALUES(null, 1, '질문1', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'Q', 0);
insert into board VALUES(null, 1, '질문2', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'Q', 0);
insert into board VALUES(null, 1, '질문3', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'Q', 0);
insert into board VALUES(null, 1, '질문4', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'Q', 0);
insert into board VALUES(null, 1, '질문5', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'Q', 0);
insert into board VALUES(null, 1, '질문6', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'Q', 0);
insert into board VALUES(null, 1, '질문7', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'Q', 0);
insert into board VALUES(null, 1, '질문8', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'Q', 0);
insert into board VALUES(null, 1, '질문9', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'Q', 0);
insert into board VALUES(null, 1, '질문0', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'Q', 0);
insert into board VALUES(null, 1, '공지1', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지3', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지4', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지5', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지6', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지7', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지8', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지0', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지ㅇ', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지ㅇㅈ', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지ㄴㅇ', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지ㅇ', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지ㄴㅊ', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지ㄴㅇ', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '후기5', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'E', 0);
insert into board VALUES(null, 1, '후기1', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'E', 0);
insert into board VALUES(null, 1, '후기2', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'E', 0);
insert into board VALUES(null, 1, '후기3', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'E', 0);
insert into board VALUES(null, 1, '후기4', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'E', 0);
insert into board VALUES(null, 1, '후기6', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'E', 0);
insert into board VALUES(null, 1, '후기7', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'E', 0);
insert into board VALUES(null, 1, '후기8', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'E', 0);
insert into board VALUES(null, 1, '후기9', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'E', 0);
insert into board VALUES(null, 1, '후기0', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'E', 0);
insert into board VALUES(null, 1, '후기ㅕ', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'E', 0);
insert into board VALUES(null, 1, '후기ㅇ', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'E', 0);
insert into board VALUES(null, 1, '후기ㅈㄷ', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'E', 0);
insert into board VALUES(null, 1, '후기ㄴㅇ', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'E', 0);
insert into board VALUES(null, 1, '후기ㄴㅂ', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'E', 0);
insert into board VALUES(null, 1, '후기ㄴㅇ', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'E', 0);
insert into board VALUES(null, 1, '후기ㄴ', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'E', 0);
insert into board VALUES(null, 1, '후기ㄹㄹ', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'E', 0);

insert into board VALUES(null, 1, '공지1', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지3', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지4', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지5', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지6', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지7', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지8', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지0', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지ㅇ', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지ㅇㅈ', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지ㄴㅇ', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지ㅇ', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지ㄴㅊ', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지ㄴㅇ', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지1', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지3', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지4', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지5', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지6', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지7', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지8', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지0', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지ㅇ', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지ㅇㅈ', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지ㄴㅇ', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지ㅇ', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지ㄴㅊ', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지ㄴㅇ', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지1', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지3', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지4', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지5', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지6', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지7', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지8', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지0', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지ㅇ', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지ㅇㅈ', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지ㄴㅇ', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지ㅇ', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지ㄴㅊ', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지ㄴㅇ', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지1', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지3', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지4', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지5', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지6', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지7', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지8', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지0', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지ㅇ', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지ㅇㅈ', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지ㄴㅇ', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지ㅇ', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지ㄴㅊ', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지ㄴㅇ', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'N', 0);
insert into board VALUES(null, 1, '공지ㄴㅇ', '관리자', 'ㄱㄷㄱㅈㄷㄱㄷㄱㅈㄷㅅㅇㅎㅇㅀㅈㅇㅎㅈㅇㅀ', now(), null, null, 'E', 0);

update board set title='수정 제목', content='수정 된 내용', pic=null, dob=now() where num=393;

select count(num) from board where bsection='N';
select num, title, bname, dob, bcount   from board   where bsection='N'   order by num desc   limit 0, 10;

select
		*
		from bcomment
		where num=64
		order by
		cdob desc;
		
select count(num) from
		bcomment where num=64;
		
update bcomment
set commant='ㅗㅗㅗㅗㅗㅗ'
where cnum=23;

select num
from board
where bsection='Q';

select commant
from bcomment
where cnum=23;

select count(num)
from board
where num<10 and bsection='Q';

select num
from board
where bsection='Q'
limit 7, 3;