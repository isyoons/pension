drop DATABASE elunian;
create database elunian;
use elunian;

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
roomCode char(4) primary key comment '방코드',
roomName varchar(13) comment '방이름',
stdNum int(2) comment '기준 인원',
maxNum int(2) comment '최대인원',
coupleRoom BOOLEAN comment '커플룸여부',
doubleLayer BOOLEAN comment '복층형 여부',
spa BOOLEAN comment '스파 여부',
lowSeasonWeekdayPrice INT(7) comment '비성수기 주중요금',
lowSeasonFridayPrice INT(7) comment '비성수기 금요요금',
lowSeasonWeekendPrice INT(7) comment '비성수기 주말요금',
middleSeasonWeekdayPrice INT(7) comment '준성수기 주중요금',
middleSeasonWeekendPrice INT(7) comment '준성수기 주말요금',
highSeasonWeekdayPrice INT(7) comment '성수기 주중요금',
highSeasonWeekendPrice INT(7) comment '성수기 주말요금',
equipment text comment '비품'
)comment '방정보테이블';

insert into roomInfo values('a101','방이름','2','10',true,true,true,100000,150000,200000,300000,350000,350000,400000,'구비물품 업ㅆ다!');
insert into roomInfo values('a102','나날이','2','10',true,true,true,100000,150000,200000,300000,350000,350000,400000,'구비물품 업ㅆ다!');
insert into roomInfo values('a103','zzz','2','10',true,true,true,1,2,3,4,5,6,7,'구비물품 업ㅆ다!');

select * from roomInfo;

create table resveInfo(
resveCode int(4) primary key auto_increment comment '예약코드',
resveCtm varchar(20) comment '예약자명',
payCtm varchar(20) comment '입금주명',
phoneNumber varchar(20) comment '예약자 폰번호',
resveDay date comment '예약일',
resvePd int(2) comment '예약기간(x박)',
totalResveNum int(10) comment '총 예약인원',
payAmount int(10) comment '결제금액',
isDeposit int(1) comment '입금여부',
etc varchar(20) comment '기타사항'
)comment '예약정보';

create table resveRoomInfo(
resveCode int(4) comment '예약코드',
roomCode char(4) comment '방코드',
roomName varchar(10) comment '방이름',
resveNum int(10) comment '예약인원',
resvePd int(2) comment '예약기간(x박)',
stayBeginDay date comment '숙박 시작일',
stayEndDay date comment '숙박 종료일'
)comment '예약 방 정보';

create table resveStatusInfo(
resveDay date comment '예약일',
roomCode char(4) comment '방 코드',
resveStatus int(1) comment '예약정보 없으면 예약가능 1이면 예약 대기 2면 예약완료',
FOREIGN key(roomCode) REFERENCES roomInfo(roomCode)
)comment '일자별 예약현황';

create table roomImgInfo(
roomCode char(4) comment '방코드',
roomImg varchar(255) comment '방사진 이름',
FOREIGN key(roomCode) REFERENCES roomInfo(roomCode)
)comment '방사진 이름';