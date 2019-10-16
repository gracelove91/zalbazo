-- 기존 sql
Insert into ZALBAZO.CATEGORY (CATEGORY_ID,NAME) values (1,'community');
Insert into ZALBAZO.CATEGORY (CATEGORY_ID,NAME) values (2,'jisik');
Insert into ZALBAZO.CATEGORY (CATEGORY_ID,NAME) values (3,'review');
Insert into ZALBAZO.CATEGORY (CATEGORY_ID,NAME) values (4,'hqna');
Insert into ZALBAZO.CATEGORY (CATEGORY_ID,NAME) values (5,'message');

INSERT into ZALBAZO.ZALBAZO_USER(USER_EMAIL, PASSWORD, ROLE, TEL, ADDRESS, NAME, JOIN_DATE, LAST_LOGIN, ENABLED)
values('dummy@gmail.com', '{noop}1234', 'admin', '01000000000', '서울시 서초구', '관리자', sysdate, sysdate, 'enabled');


INSERT into ZALBAZO.ZALBAZO_USER(USER_EMAIL, PASSWORD, ROLE, TEL, ADDRESS, NAME, JOIN_DATE, LAST_LOGIN, ENABLED)
values('zalbazo@zalbazo.kr', '{noop}1234', 'admin', '01000000000', '서울시 서초구', '관리자', sysdate, sysdate, 'enabled');


Insert into ZALBAZO.HOSPITAL (HOSPITAL_ID,NAME,ADDRESS,TREAT_START,TREAT_END,TEL,INFO)
values (HOSPITAL_SEQ.nextval,'돌봄 동물병원','서울특별시 강동구 암사동 414-18 롯데캐슬상가 2층','08:00','21:00','024262775',
        '가족을 돌보는 마음으로 반려동물을 진료하는 돌봄 동물병원입니다.');

Insert into ZALBAZO.HOSPITAL (HOSPITAL_ID,NAME,ADDRESS,TREAT_START,TREAT_END,TEL,INFO)
values (HOSPITAL_SEQ.nextval,'고덕24시동물병원','서울 강동구 동남로 877 106호','00:00','24:00','0262278275',
        '고덕동/명일동에 위치한 24시간 동물병원입니다.
        언제 발생할지 모르는 응급한 아이들을 위한 응급진료.
        대부분의 외과수술이 가능한 호흡마취기, 환자감시기, 수술장비.
        아픈 아이의 혈액상태를 바로 볼 수 있는 혈액검사기.
        철저한 입원관리를 위한 수액펌프, 실린지 펌프, 집중치료실.
        병원으로서 최선을 다하기 위해 장비를 갖추기위해 노력하고 있으며 앞으로도 더 발전시켜나가겠습니다.
        그 외 서비스로는 고양이를 위한 전용 캣타워 호텔. 고양이 미용.
        기존 케이지보다 넓게 제작된 강아지 호텔, 강아지 미용이 있으며
        캣타워와 캣로드로 고양이를 위한 공간을 할애했습니다. 많은 관심 바랍니다.');

Insert into ZALBAZO.HOSPITAL (HOSPITAL_ID,NAME,ADDRESS,TREAT_START,TREAT_END,TEL,INFO)
values (HOSPITAL_SEQ.nextval,'스마트동물병원 강동암사점','서울특별시 강동구 암사동 452-31 서원빌딩 1층','10:00','21:00','024428875',
        '원훈 :: 우리집 아이처럼 같이 기뻐하고 같이 고민하는 스마트 가족이 되자
        안녕하세요 스마트동물병원 강동암사지점입니다~!
        강남 신사본원, 강남 대치지점, 울산지점, 동탄지점, 강동구지점 총 5 개의 지점에
        총 36 명의 수의사가 심도깊은 협진으로 가장 안전하고 완벽을 추구하는 의료환경을 추구합니다
        원훈처럼 반려동물들이 가장 편안해 할 수 있는 환경을 조성하여, 반려동물들의 건강과 보호자분 모두의
        행복감을 드리고자 항상 최선을 다한 의료 서비스를 제공해 드리겠습니다.');


Insert into ZALBAZO.LABEL (CODE,NAME) values (1,'24시간');
Insert into ZALBAZO.LABEL (CODE,NAME) values (2,'미용');
Insert into ZALBAZO.LABEL (CODE,NAME) values (3,'주차');
Insert into ZALBAZO.LABEL (CODE,NAME) values (4,'특수동물');
Insert into ZALBAZO.LABEL (CODE,NAME) values (5,'수술전문');


Insert into ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (1,1);
Insert into ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (2,1);
Insert into ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (3,1);
Insert into ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (3,2);
Insert into ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (4,2);
Insert into ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (1,3);
Insert into ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (3,3);
Insert into ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (5,3);


insert into pic_lib(uuid, upload_path, file_name)
values(UUID_SEQ.nextval, 'resources/img', '1-1.jpg');
insert into pic_lib_rel_hospital(uuid, hospital_id)
values(UUID_SEQ.currval, 1);
insert into pic_lib(uuid, upload_path, file_name)
values(UUID_SEQ.nextval, 'resources/img', '1-2.jpg');
insert into pic_lib_rel_hospital(uuid, hospital_id)
values(UUID_SEQ.currval, 1);
insert into pic_lib(uuid, upload_path, file_name)
values(UUID_SEQ.nextval, 'resources/img', '1-3.jpg');
insert into pic_lib_rel_hospital(uuid, hospital_id)
values(UUID_SEQ.currval, 1);
insert into pic_lib(uuid, upload_path, file_name)
values(UUID_SEQ.nextval, 'resources/img', '1-4.jpg');
insert into pic_lib_rel_hospital(uuid, hospital_id)
values(UUID_SEQ.currval, 1);
insert into pic_lib(uuid, upload_path, file_name)
values(UUID_SEQ.nextval, 'resources/img', '2-1.jpg');
insert into pic_lib_rel_hospital(uuid, hospital_id)
values(UUID_SEQ.currval, 2);
insert into pic_lib(uuid, upload_path, file_name)
values(UUID_SEQ.nextval, 'resources/img', '3-1.jpg');
insert into pic_lib_rel_hospital(uuid, hospital_id)
values(UUID_SEQ.currval, 3);



insert all
    into content (CONTENT_ID, BODY, CREATED_DATE, CATEGORY_ID, USER_EMAIL)
values (CONTENT_SEQ.nextval,
        '우리 집 어르신 뽀삐(10세)도 만족해하더군요,, 잊지 말자 돌봄 동물병원,,,', sysdate, 3, 'dummy@gmail.com')
into review (review_id, hospital_id, content_id, star_point)
values(REVIEW_SEQ.NEXTVAL, 1, CONTENT_SEQ.currval, 4)
select * from dual;

insert all
    into content (CONTENT_ID, BODY, CREATED_DATE, CATEGORY_ID, USER_EMAIL)
values (CONTENT_SEQ.nextval,
        '우리 집 어르신 뽀삐(10세)도 만족해하더군요,, 잊지 말자 돌봄 동물병원,,,', sysdate, 3, 'dummy@gmail.com')
into review (review_id, hospital_id, content_id, star_point)
values(REVIEW_SEQ.NEXTVAL, 1, CONTENT_SEQ.currval, 1)
select * from dual;

insert all
    into content (CONTENT_ID, BODY, CREATED_DATE, CATEGORY_ID, USER_EMAIL)
values (CONTENT_SEQ.nextval,
        '우리 집 어르신 뽀삐(10세)도 만족해하더군요,, 잊지 말자 돌봄 동물병원,,,', sysdate, 3, 'dummy@gmail.com')
into review (review_id, hospital_id, content_id, star_point)
values(REVIEW_SEQ.NEXTVAL, 1, CONTENT_SEQ.currval, 2)
select * from dual;

insert all
    into content (CONTENT_ID, BODY, CREATED_DATE, CATEGORY_ID, USER_EMAIL)
values (CONTENT_SEQ.nextval,
        '우리 집 어르신 뽀삐(10세)도 만족해하더군요,, 잊지 말자 돌봄 동물병원,,,', sysdate, 3, 'dummy@gmail.com')
into review (review_id, hospital_id, content_id, star_point)
values(REVIEW_SEQ.NEXTVAL, 1, CONTENT_SEQ.currval, 2)
select * from dual;

insert all
    into content (CONTENT_ID, BODY, CREATED_DATE, CATEGORY_ID, USER_EMAIL)
values (CONTENT_SEQ.nextval,
        '우리 집 어르신 뽀삐(10세)도 만족해하더군요,, 잊지 말자 돌봄 동물병원,,,', sysdate, 3, 'dummy@gmail.com')
into review (review_id, hospital_id, content_id, star_point)
values(REVIEW_SEQ.NEXTVAL, 1, CONTENT_SEQ.currval, 3)
select * from dual;

commit;

-- USER INSER --
Insert into ZALBAZO.ZALBAZO_USER (USER_EMAIL,PASSWORD,ROLE,TEL,ADDRESS,NAME,JOIN_DATE,LAST_LOGIN,ENABLED,EMAIL_AUTH_KEY,HOSPITAL_ID)
values ('upwyy123@gmail.com','1234','user','444','서울특별시 동작구 동작대로 121-4,(사당동)','메메',to_date('19/10/14','RR/MM/DD'),null,'enabled',null,null);

Insert into ZALBAZO.ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, ADDRESS, NAME, JOIN_DATE, LAST_LOGIN, enabled)
Values('jjlee@gmail.com', '{noop}1234', 'user', '01097946214', '인천시 부평구', '이재이', to_date('19/10/14','RR/MM/DD'), sysdate, 'enabled');

Insert into ZALBAZO.ZALBAZO_USER (USER_EMAIL,PASSWORD,ROLE,TEL,ADDRESS,NAME,JOIN_DATE,LAST_LOGIN,ENABLED,EMAIL_AUTH_KEY,HOSPITAL_ID)
values ('iceice@gmail.com','{noop}1234','user','01012340987','서울시 서초구','아이스베어',to_date('19/10/14','RR/MM/DD'),sysdate,'enabled',null,null);

insert into ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, ADDRESS, NAME, JOIN_DATE, LAST_LOGIN, HOSPITAL_ID)
values ('baba1234@gmail.com', '{noop}1234', 'user', '01012341234', '서울시 서초구', '바바', to_date('19/10/14','RR/MM/DD'), null, null);

insert into ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, ADDRESS, NAME, JOIN_DATE, LAST_LOGIN, HOSPITAL_ID)
values ('doglover@daum.net', 1234, 'user', 01045671234, '서울 서초구 방배로33길 29', '박수진', to_date('19/10/14','RR/MM/DD'), null, null);
insert into ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, ADDRESS, NAME, JOIN_DATE, LAST_LOGIN, HOSPITAL_ID)
values ('ilikecat@gmail.com', 1234, 'user', 01012347890, '경기 오산시 삼미로 34', '한성진', to_date('19/10/14','RR/MM/DD'), null, null);
insert into ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, ADDRESS, NAME, JOIN_DATE, LAST_LOGIN, HOSPITAL_ID)
values ('bird1234@daum.net', 1234, 'user', 01011119923, '부산 해운대구 마린시티2로 33', '김성은', to_date('19/10/14','RR/MM/DD'), null, null);
insert into ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, ADDRESS, NAME, JOIN_DATE, LAST_LOGIN, HOSPITAL_ID)
values ('puppylover@naver.com', 1234, 'user', 01045671234, '세종특별자치시 다정남로 22', 'mike', to_date('19/10/14','RR/MM/DD'), null, null);
insert into ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, ADDRESS, NAME, JOIN_DATE, LAST_LOGIN, HOSPITAL_ID)
values ('nakta@daum.net', 1234, 'user', 01099991625, '경기 광명시 연서일로17번길 26', '김태완', to_date('19/10/14','RR/MM/DD'), null, null);

UPDATE ZALBAZO_USER
SET ENABLED = 'enabled',
    PASSWORD = '{noop}1234'
WHERE USER_EMAIL = 'doglover@daum.net';
UPDATE ZALBAZO_USER
SET ENABLED = 'enabled',
    PASSWORD = '{noop}1234'
WHERE USER_EMAIL = 'ilikecat@gmail.com';
UPDATE ZALBAZO_USER
SET ENABLED = 'enabled',
    PASSWORD = '{noop}1234'
WHERE USER_EMAIL = 'bird1234@daum.net';
UPDATE ZALBAZO_USER
SET ENABLED = 'enabled',
    PASSWORD = '{noop}1234'
WHERE USER_EMAIL = 'puppylover@naver.com';
UPDATE ZALBAZO_USER
SET ENABLED = 'enabled',
    PASSWORD = '{noop}1234'
WHERE USER_EMAIL = 'nakta@daum.net';

-------------------- CONTENT INSERT




Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (CONTENT_SEQ.nextval,'고양이 입양시키려고 하는데 준비물!!','고양이를 드디어 입양시키게되었습니다 이름도 정해놨어요 뇸뇸이 라고 우리 뇸뇸이 입양시키려는데 준비물이 뭐가 필요한지 궁금합니다~~',sysdate,sysdate,2,'upwyy123@gmail.com');


Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL) values (CONTENT_SEQ.nextval,'강아지 옷 추천 부탁드립니다ㅠㅠㅠ','이제 날이 쌀쌀해져서 강아지 옷을 입힐까 하는데

추위를 많이 타서 몸을 전체 덮을 수 있고 목줄 거는 거 까지 있는걸로 추천해주세요ㅠㅠ!

반려동물을 처음 키우다보니 어디가 좋을지 감이 안 와요ㅠㅠㅠ',to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),2,'iceice@gmail.com');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (CONTENT_SEQ.nextval,'에휴 강아지 배변훈련 도와주세요','왈왈이가 누굴닮았는지 진짜 똥을 아무곳에서나 싸지르고 다녀요. 요즘그것때문에 스트레스가 이만저만이 아니네요 배변훈련 어떻게 시켜야할까요?? 처음엔 귀여웠는데 점점 얄밉네요',sysdate,sysdate,2,'upwyy123@gmail.com');

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (CONTENT_SEQ.nextval,'중성화 수술~~!~!','제가 왈왈이 중성화 수술을 시키려고하는데 어디 괜찮은 병원 추천해주실수있나요?? 그리고 비용은 얼마정도 할지 궁금해요 ㅠ~',sysdate,sysdate,2,'upwyy123@gmail.com');

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (CONTENT_SEQ.nextval,'우리집 왈왈이가 최고얌','제일 귀여워용 ㅎㅎㅎㅎㅎㅎㅎㅎ 하하하ㅏ하하하하하하 짱짱',sysdate,sysdate,1,'upwyy123@gmail.com');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (CONTENT_SEQ.nextval,'구운고기 먹여도될까요???','우리 왈왈이가 생고기를 안먹는데 구운고기를 먹여도 될지 모르겠어요 알려주세용~~',sysdate,sysdate,2,'upwyy123@gmail.com');

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (CONTENT_SEQ.nextval,'와 이건 진짜 꿀템 진짜진짜 안보면 후회','애들이 진짜 난리입니다 편하게 밥먹일수있어요',sysdate,sysdate,1,'upwyy123@gmail.com');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (CONTENT_SEQ.nextval,'제가 아이들을 잘 키울수있을까요??','아직 취업도 안했는데 강아지와 고양이를 키우고있습니다... 제가 능력도 안되면서 애들을 키우고있는게 아닌지 문득 생각이 드는군요.',sysdate,sysdate,1,'upwyy123@gmail.com');

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (CONTENT_SEQ.nextval,'인생쓰다...','대체 요즘 제가 뭘하고있는지 ... 잘하고있는지... 정말 많은 생각을 하게되네요',sysdate,sysdate,1,'upwyy123@gmail.com');

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (CONTENT_SEQ.nextval,'집사가 되는 길이란..','하... 우리집 뇸뇸이가(고양이) 무럭무럭 잘자랐으면  하는 바람인데제가 잘키우고있는건지 모르겠네요 좀더 공부를 많이해서 좋은 집사가 되겠습니당! 집사님들 화이팅!',sysdate,sysdate,1,'upwyy123@gmail.com');


Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (CONTENT_SEQ.nextval,'고양이 기대수명 30년.. 가능할까요?','고령의 고양이는 거의 신장병으로 생을 마감하는데 신장병을 고칠 수 있는 특효약이 일본에서 개발 되었다는 뉴스를 봤어요. pkd 판정받은 냥이 데리고 살고 있는데 확실하진 않으나 이런 소식이 있어 기대가 되기도 하네요!',sysdate,sysdate,1,'jjlee@gmail.com');

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (CONTENT_SEQ.nextval,'댕댕이분들! 인스타맞팔해요~','강아지를 너무 좋아해서 맨날 인스타로 다른 분들의 댕댕이만 보다가 우리집 댕댕이도 인스타를 시작하고 싶어 만들게 됐습니다!
푸들을 비롯해서 인스타 맞팔해용^>^ @mumu32 입니다~!! 친구해요~!!',sysdate,sysdate,1,'jjlee@gmail.com');

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (CONTENT_SEQ.nextval,'고슴도치용 프라이멀 오리 구매했어요!','호불호 없이 잘먹는다고 소문난 프라이멀 오리를 여기저기 뒤져보다보니 쿠팡에서 판매하길래 드디어 구매했네요 다음주 화요일에 오지만 그때까지 좀 기다려야죠 뭐 ㅎㅎ 구매 하실 분들 참고해주세요~',sysdate,sysdate,1,'jjlee@gmail.com');

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (CONTENT_SEQ.nextval,'기다리고 기다리던 캣타워가 왔어요~~','내년에 이사가면 바꿔주리라 마음 먹었지만 유즈가 우다다 할 때마다 심하게 흔들리는게 마음에 걸려 큰맘먹고 지르고 말았습니다.
길고긴 기다림 끝에 오늘 드디어 도착했네요. 조립을 끝내고 보니 생각 이상으로 크기가 어마어마 합니다. 튼튼함도 만족스럽네요. 아직은 탐색하면서 계속 우는데ㅠㅠ 적응이 되면 차차 나아지겠지요ㅠㅠ',sysdate,sysdate,1,'jjlee@gmail.com');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (CONTENT_SEQ.nextval,'아기 강아지 이름 추천 받아요','스트릿 출신 믹스 아가입니다 ㅋㅋ',to_date('19/10/13','RR/MM/DD'),to_date('19/10/13','RR/MM/DD'),1,'baba1234@gmail.com');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL) values (CONTENT_SEQ.nextval,'우리집 1살 애기 보고가세요~','넘나리 귀엽다!!!! 이름은 투슬리스입니다

래브라도리트리버라 친화력도 좋아요ㅎㅎ

투슬리스야 사랑해!',to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),1,'iceice@gmail.com');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (CONTENT_SEQ.nextval,'저희 냥이는 캣파푸 필렛 기호성 대박이에요ㅋㅋ','오늘 캣파푸 필렛 하나 까서 줬는데.. 이브는 아무거나 가리지 않고 먹는 아이인걸 감안해도 환장하고 먹더라구요ㅋㅋ 담달에는 무조건 캣파푸 필렛 사서 쟁여야겠습니다',sysdate,sysdate,1,'jjlee@gmail.com');


Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (CONTENT_SEQ.nextval,'강아지 산책 훈련 방법 도와주세요','강아지가 목줄을 너무 불편해 하네요. 목줄에 익숙하게 산책 시킬 수 있는 방법이 있을까요?',sysdate,sysdate,2,'jjlee@gmail.com');

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (CONTENT_SEQ.nextval,'견주 여러분들 이런 경우 있으신가요?','9살 포메와 생활하고 있습니다. 이번 슬개골 탈구 수술하고 퇴원 후 사료를 주는데 전혀 먹지 않습니다. 사료 샘플 수십개를 가져와
기호성 테스트를 했는데 습식 사료만 먹더군요..펠리쿠치나?? 계속 습식 사료를 급여해야 하는지?? 습식 사료를 급여할 때 주의점 이라든지.. 알려주세요!',sysdate,sysdate,2,'jjlee@gmail.com');

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (CONTENT_SEQ.nextval,'강아지 심리 아시는 분 계십니까??','우리 아롱이는 항상 제 옆에 와서 등돌리고 앉아있어요 삐친건 아니에요. 꼭 옆에 붙어서 저렇게 앉아있는데
왜 그런지 아시는 분 계세요?',sysdate,sysdate,2,'jjlee@gmail.com');

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (CONTENT_SEQ.nextval,'강아지들 평균 몇 시간 정도 놀아주는 게 좋나요?','취준 대학생이고 집에서 강아지를 동생과 저만 돌보는 편이라 미안하게도 놀이시간이 많지 않아요ㅠㅠ
평소에 삑삑이나 노즈워크 30분씩 2번, 밤에 산책 20~30분 하고 있습니다. 놀아주는 방법이나 시간 등 자세히 알려주시면 정말 감사하겠습니다',sysdate,sysdate,2,'jjlee@gmail.com');

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (CONTENT_SEQ.nextval,'고슴도치 환절기 보습','방에 가습기로 습도 5-60%를 유지하고 있지만 치원이를 아직 목욕을 안시켜서 각질이...엄청납니다. 아마 이번주에 조금이나마 핸들링에 성공하면 목욕을 시켜보려고 해요 제가 사용하는 호호바 100% 제품 같이 사용해도 괜찮을까요...?',sysdate,sysdate,2,'jjlee@gmail.com');



Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL) values (CONTENT_SEQ.nextval,'왕관앵무도 말을 할 수 있나요?','안녕하세요! 저는 왕관앵무를 기르고 싶은 사람입니다.

그런데 왕관앵무도 다른 앵무새처럼 말을 할 수 있나요?

저는 왕관앵무를 기르면 왕관앵무랑 같이 노래를 부르고 싶습니다.

답변 부탁드려요!!!',to_date('19/09/05','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),2,'iceice@gmail.com');

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL) values (CONTENT_SEQ.nextval,'친칠라 키우시는 분 없으신가요?','친칠라가 제일 좋아하는 간식 뭐 있나요? 궁금합니다!

동물병원에서도 팔까요??',to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),2,'iceice@gmail.com');

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL) values (CONTENT_SEQ.nextval,'라쿤하고 수달중에 뭐가 더 키우기 쉽나요?','라쿤하고 수달중에 집에서 키우기 더 쉬운, 쉽게 말해 활동성이 좀더 적고 사람을 잘 따르는 동물은 뭐에요?

광고 사절합니다!',to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),2,'iceice@gmail.com');


INSERT into ZALBAZO.animal(ANIMAL_ID, TYPE, SEX, WEIGHT, AGE, ANAME, NOTE, LAST_TREAT_DATE, CREATED_DATE, UPDATED_DATE, USER_EMAIL)
values (ANIMAL_SEQ.nextval, '고양이', '남', 2, 5, '춘배', '주사를 많이 무서워 합니다.', sysdate, sysdate, sysdate, 'baba1234@gmail.com');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL) values (CONTENT_SEQ.nextval,'동물자유연대 글들을 보니 마음이 아프네요ㅠㅠ','오전에 동물자유연대에서 올린 유기견 실태 글을 읽었는데 마음이 아프네요ㅠㅠㅠ

저렇게 천사같은 아이들을 버리다니 동물 유기하는 사람들은 정말 천벌 받아야해요',to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),1,'iceice@gmail.com');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (CONTENT_SEQ.nextval,'국산 사료는 위험한가요?','아무래도 성분이 별로인가요?',to_date('19/10/11','RR/MM/DD'),to_date('19/10/11','RR/MM/DD'),2,'baba1234@gmail.com');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL) values (CONTENT_SEQ.nextval,'반려동물 동반 가능 카페는 사랑입니다','집 근처에 반려동물 동반 가능한 카페가 새로 생겼습니다.

산책하다 보이길래 들어가봤더니 주인분이 강아지 간식도 직접 만들어서 판매도 하시더라구요~~♥



앞으로도 자주 가야겠어요



',to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),1,'iceice@gmail.com');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (CONTENT_SEQ.nextval,'고양이 몸의 벼룩과 진드기 제거하는 방법','우리 뇸뇸이가 몸에 벼룩과 진드기가 너무 많은데 어떻게 제거해야할지 모르겠어요 너무 가려워하는거같아요~',sysdate,sysdate,2,'upwyy123@gmail.com');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (CONTENT_SEQ.nextval,'마트에서 파는 간식은 안전한 건가요?','종종 사주는데.. 걱정 되네요...',to_date('19/10/11','RR/MM/DD'),to_date('19/10/11','RR/MM/DD'),2,'baba1234@gmail.com');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL) values (CONTENT_SEQ.nextval,'너구리랑 라쿤이랑은 다른건가요??','제가 얼마전에 가디언즈오브갤럭시를 봤는데요, 거기에 나오는 로켓라쿤이 너무 귀엽더군요.



라쿤이 미국너구리이고 너구리가 영어로 라쿤인걸로 알고있는데 제가맞게알고있는건가요??

동물박사 잘바조님들 알려주세요.갑자기 궁금해지네요',to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),2,'iceice@gmail.com');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (CONTENT_SEQ.nextval,'고양이에게 디퓨저는 많이 해로운가요?','특히 시트러스 향 계열이 위험하다던데.. 이유가 뭔가요?',to_date('19/10/11','RR/MM/DD'),to_date('19/10/11','RR/MM/DD'),2,'baba1234@gmail.com');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL) values (CONTENT_SEQ.nextval,'고양이간식 츄르대신 대체할 간식 추천합니다!','''쮸르쮸르''라는 제품입니다.

일본제품 불매운동 하는중이라ㅠㅠㅜ 친구가 대체품을 찾던도중 발견한 간식입니다.

츄르 아니면 안 먹던 친구네 고양이도 맛있게 먹는 걸 보니 맛도 비슷한 거 같아요!!!



맛도 퀄리티도 일본제품에 지지 않는 국산품 애용하려구요. 잘바조 유저님들도 쮸르쮸르 드셔보세요!

광고 아닙니다ㅜㅜㅜㅜ

',to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),1,'iceice@gmail.com');

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (CONTENT_SEQ.nextval,'혹시 조류 진료도 가능한 병원 있을까요?','저희 할머니가 키우시는 닭이 아픈 것 같아서요.',to_date('19/10/11','RR/MM/DD'),to_date('19/10/11','RR/MM/DD'),2,'baba1234@gmail.com');


Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (CONTENT_SEQ.nextval,'잘바조 좋네요ㅎ 검색도 잘되고','덕분에 예약도 간편하게 할 수 있게 됐네요',to_date('19/10/12','RR/MM/DD'),to_date('19/10/12','RR/MM/DD'),1,'baba1234@gmail.com');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL) values (CONTENT_SEQ.nextval,'우리집 투슬리스랑 수변공원 다녀왔습니다','밖에 나가기 좋은 날이라 투슬리스가 산책가자고 난리에요 요즘ㅎㅎ

근처 수변공원에 나가서 산책하는데 얼마나 좋아하던지ㅎㅎ

산책나온 멍멍이들도 많고 자주 가야겠습니다!',to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),1,'iceice@gmail.com');


Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (CONTENT_SEQ.nextval,'노견 강아지 사료 추천합니다~','로얄캐닌에서 갈아탔어요~ 정보 원하시는 분은 댓글!',to_date('19/10/10','RR/MM/DD'),to_date('19/10/10','RR/MM/DD'),1,'baba1234@gmail.com');



Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (CONTENT_SEQ.nextval,'길냥이를 갑자기 마주치게 된다면, 어떤 걸 줘야 할까요?','편의점에서 파는 캔도 괜찮은가요...',to_date('19/10/11','RR/MM/DD'),to_date('19/10/11','RR/MM/DD'),2,'baba1234@gmail.com');


Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (CONTENT_SEQ.nextval,'혹시 햄스터 보호자 분 계신가요?','간식 추천 좀 해주세요~',to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),1,'baba1234@gmail.com');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (CONTENT_SEQ.nextval,'코숏 아기 길냥이 임보중입니다.','너무너무 귀여운데 데려가실 분? ㅎㅎ',to_date('19/10/10','RR/MM/DD'),to_date('19/10/10','RR/MM/DD'),1,'baba1234@gmail.com');



----------------ANIMAL INSERT

Insert into ZALBAZO.ANIMAL (ANIMAL_ID,TYPE,SEX,WEIGHT,AGE,ANAME,NOTE,LAST_TREAT_DATE,CREATED_DATE,UPDATED_DATE,USER_EMAIL)
values (ANIMAL_SEQ.nextval,'래브라도리트리버','중성',13,2,'투슬리스','눈이 참 맑습니다',to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),'iceice@gmail.com');

Insert into ZALBAZO.ANIMAL (ANIMAL_ID,TYPE,SEX,WEIGHT,AGE,ANAME,NOTE,LAST_TREAT_DATE,CREATED_DATE,UPDATED_DATE,USER_EMAIL)
values (ANIMAL_SEQ.nextval,'그리즐리베어','남',30,2,'그리즐리','미국에서 온 그리즐리 베어입니다',to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),'iceice@gmail.com');

Insert into ZALBAZO.ANIMAL (ANIMAL_ID,TYPE,SEX,WEIGHT,AGE,ANAME,NOTE,LAST_TREAT_DATE,CREATED_DATE,UPDATED_DATE,USER_EMAIL)
values (ANIMAL_SEQ.nextval,'고양이','남',4,1,'뇸뇸이','너무 이쁨',sysdate,sysdate,sysdate,'upwyy123@gmail.com');

Insert into ZALBAZO.ANIMAL (ANIMAL_ID,TYPE,SEX,WEIGHT,AGE,ANAME,NOTE,LAST_TREAT_DATE,CREATED_DATE,UPDATED_DATE,USER_EMAIL)
values (ANIMAL_SEQ.nextval,'강아지','남',6,1,'왈왈이','귀여움',sysdate,sysdate,sysdate,'upwyy123@gmail.com');

INSERT into ZALBAZO.animal(ANIMAL_ID, TYPE, SEX, WEIGHT, AGE, ANAME, NOTE, LAST_TREAT_DATE, CREATED_DATE, UPDATED_DATE, USER_EMAIL)
values (ANIMAL_SEQ.nextval, '푸들', '여', 3, 2, '쿠쿠', '호기심이 많아요', sysdate, sysdate, sysdate, 'jjlee@gmail.com');

INSERT into ZALBAZO.animal(ANIMAL_ID, TYPE, SEX, WEIGHT, AGE, ANAME, NOTE, LAST_TREAT_DATE, CREATED_DATE, UPDATED_DATE, USER_EMAIL)
values (ANIMAL_SEQ.nextval, '골든 리트리버', '남', 5, 1, '두치', '겁이 많아요', sysdate, sysdate, sysdate, 'jjlee@gmail.com');

INSERT into ZALBAZO.animal(ANIMAL_ID, TYPE, SEX, WEIGHT, AGE, ANAME, NOTE, LAST_TREAT_DATE, CREATED_DATE, UPDATED_DATE, USER_EMAIL)
values (ANIMAL_SEQ.nextval, '강아지', '중성', 3, 6, '단오', '피부병이 있으니 미용시 주의해주세요.', sysdate, sysdate, sysdate, 'baba1234@gmail.com');




-- INSERT RESERVE

Insert into ZALBAZO.RESERVE (RESERVE_ID,NOTE,RDATE,ANIMAL_ID,HOSPITAL_ID,STATUS,USER_EMAIL)
values (RESERVE_SEQ.nextval,'투슬리스 왼쪽 발에 상처가 나서 드레싱 부탁드려요!',to_date('19/10/25','RR/MM/DD'), 1,1,'진료 전','iceice@gmail.com');

Insert into ZALBAZO.RESERVE (RESERVE_ID,NOTE,RDATE,ANIMAL_ID,HOSPITAL_ID,STATUS,USER_EMAIL)
values (RESERVE_SEQ.nextval,'진료 끝나면 전화주세요!',to_date('19/10/31','RR/MM/DD'),2,1,'진료 전','iceice@gmail.com');

Insert into ZALBAZO.RESERVE (RESERVE_ID,NOTE,RDATE,ANIMAL_ID,HOSPITAL_ID,STATUS,USER_EMAIL)
values (RESERVE_SEQ.nextval,null,to_date('19/10/29','RR/MM/DD'),2,1,'진료 전','iceice@gmail.com');

Insert into ZALBAZO.RESERVE (RESERVE_ID,NOTE,RDATE,ANIMAL_ID,HOSPITAL_ID,STATUS,USER_EMAIL)
values (RESERVE_SEQ.nextval,'우리아이 잘부탁드려요',to_date('19/10/18','RR/MM/DD'),3,2,'진료 전','upwyy123@gmail.com');

insert into ZALBAZO.RESERVE (RESERVE_ID, NOTE, RDATE, ANIMAL_ID, HOSPITAL_ID, STATUS,USER_EMAIL)
values (RESERVE_SEQ.nextval, '알레르기가 있어서 눈꼽이 계속 껴서 눈을 제대로 못 뜹니다.', to_date('19/11/10','RR/MM/DD'), 5, 1, '진료 전', 'jjlee@gmail.com');

insert into ZALBAZO.RESERVE (RESERVE_ID, NOTE, RDATE, ANIMAL_ID, HOSPITAL_ID, STATUS,USER_EMAIL)
values (RESERVE_SEQ.nextval, '심장사상충 예방접종', to_date('19/10/24','RR/MM/DD'), 7, 2, '진료 전', 'baba1234@gmail.com');





insert into zalbazo.FAQ values(1, '가입은 어떻게 하나요?', '우측 상단 sign-up 버튼을 클릭하세요');
insert into zalbazo.FAQ values(2, '예약은 언제부터 가능한가요?', '   방문일 한달 전부터 가능합니다');
insert into zalbazo.FAQ values(3, '파충류도 치료 받을 수 있나요?', '특수동물 치료 가능 병원을 검색 해 주세요');
insert into zalbazo.FAQ values(4, '동물병원을 개원했습니다. 병원 등록을 하고 싶은데 어떻게 해야 하나요?', '   병원 등록 전용 페이지에서 가입 해 주세요');


commit;




