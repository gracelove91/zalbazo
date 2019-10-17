
-- 계정 5개 만들기
insert into ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, ADDRESS, NAME, JOIN_DATE, LAST_LOGIN, HOSPITAL_ID)
values ('doglover@daum.net', 1234, 'user', 01045671234, '서울 서초구 방배로33길 29', '박수진', sysdate, null, null);
insert into ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, ADDRESS, NAME, JOIN_DATE, LAST_LOGIN, HOSPITAL_ID)
values ('ilikecat@gmail.com', 1234, 'user', 01012347890, '경기 오산시 삼미로 34', '한성진', sysdate, null, null);
insert into ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, ADDRESS, NAME, JOIN_DATE, LAST_LOGIN, HOSPITAL_ID)
values ('bird1234@daum.net', 1234, 'user', 01011119923, '부산 해운대구 마린시티2로 33', '김성은', sysdate, null, null);
insert into ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, ADDRESS, NAME, JOIN_DATE, LAST_LOGIN, HOSPITAL_ID)
values ('puppylover@naver.com', 1234, 'user', 01045671234, '세종특별자치시 다정남로 22', 'mike', sysdate, null, null);
insert into ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, ADDRESS, NAME, JOIN_DATE, LAST_LOGIN, HOSPITAL_ID)
values ('nakta@daum.net', 1234, 'user', 01099991625, '경기 광명시 연서일로17번길 26', '김태완', sysdate, null, null);

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


-- 계정 5개로 커뮤니티, 지식동 글 각각 1개씩 작성
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (21,'강아지가 너무 몸을 긁어요','강아지가 저번주부터 몸을 너무 긁는데 병원에 데려가야 할까요?',to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),2,'doglover@daum.net');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (22,'아이를 분양보냈어요','너무너무 허전하네요
잘바조 회원님들은 이런 상황을 어떻게 극복하시나요?',to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),1,'ilikecat@gmail.com');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (23,'고양이가 좋아하는 음식은?','곧 아는 사람한테 고양이를 받게 되는데
고양이 사료만 챙겨주면 되나요? 간식도 따로 챙겨줘야 하나요?',to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),2,'ilikecat@gmail.com');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (24,'왕관앵무 키우고 싶은데 많이 비싼가요?','남들과 다른 동물을 키워보고 싶어서 왕관앵무에 관심이 생겼는데
많이 비싼가요? 그리고 어디서 데려와야 하나요? ',to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),2,'bird1234@daum.net');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (25,'곧 왕관앵무를 만나요','정말 어렵게 어렵게 데려오네요,,
이제 곧 만나는데 너무 기대되요!
앞으로 자주 소식 올리겠습니다.',to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),1,'bird1234@daum.net');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (26,'비글이 정말 소문만큼 지랄견인가요?','생긴게 너무 제 스타일이라서 키우고 싶은데
마당도 없는 집인데 좀 걱정되긴 하네요.
정말 소문만큼 지랄견인가요? ',to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),2,'puppylover@naver.com');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (27,'서초구 병원 추천해요!','최근에 우리 실버가 아파서 아무 병원이나 데려갔는데
너무 친절하고 실력도 좋아서 추천하고 싶어요!
서초구에 위치한 진진동물병원이구요,, 병원 검색하면 나올거에요!
시설도 깨끗하고 서비스도 너무 좋았어요~
',to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),1,'puppylover@naver.com');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (28,'패럿 잘 치료하는 병원 추천해주세요','패럿을 취급 안하는 병원이 많네요
패럿 치료 가능한 좋은 병원 추천 부탁드립니다.',to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),2,'nakta@daum.net');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (29,'우리집 패럿 보고가세요','처음엔 낯도 많이 가리고 저한테 안왔었는데
요즘은 저한테 애교도 부리네요
너무 귀여워요!!',to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),1,'nakta@daum.net');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (30,'강아지 간식 추천해요!','지마켓에서 육포를 샀는데 가격도 적당하고
우리집 애기가 너무 잘먹네요! 한번 도전해보세요~',to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),1,'doglover@daum.net');


-- 계정 1개마다 애완동물 1마리씩 등록
Insert into ZALBAZO.ANIMAL (ANIMAL_ID,TYPE,SEX,WEIGHT,AGE,ANAME,NOTE,LAST_TREAT_DATE,CREATED_DATE,UPDATED_DATE,USER_EMAIL)
values (1,'개','남',5,3,'실버','갈색푸들',to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),'puppylover@naver.com');
Insert into ZALBAZO.ANIMAL (ANIMAL_ID,TYPE,SEX,WEIGHT,AGE,ANAME,NOTE,LAST_TREAT_DATE,CREATED_DATE,UPDATED_DATE,USER_EMAIL)
values (2,'패럿','남',2,1,'밍밍',null,to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),'nakta@daum.net');
Insert into ZALBAZO.ANIMAL (ANIMAL_ID,TYPE,SEX,WEIGHT,AGE,ANAME,NOTE,LAST_TREAT_DATE,CREATED_DATE,UPDATED_DATE,USER_EMAIL)
values (3,'왕관앵무','여',2,3,'미미',null,to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),'bird1234@daum.net');
Insert into ZALBAZO.ANIMAL (ANIMAL_ID,TYPE,SEX,WEIGHT,AGE,ANAME,NOTE,LAST_TREAT_DATE,CREATED_DATE,UPDATED_DATE,USER_EMAIL)
values (4,'고양이','여',5,2,'뚠뚠','길고양이 출신',to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),'ilikecat@gmail.com');
Insert into ZALBAZO.ANIMAL (ANIMAL_ID,TYPE,SEX,WEIGHT,AGE,ANAME,NOTE,LAST_TREAT_DATE,CREATED_DATE,UPDATED_DATE,USER_EMAIL)
values (5,'개','중성',4,1,'쿠키','말티즈',to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),'doglover@daum.net');


-- 애완동물 1마리 당 예약 1개씩
Insert into ZALBAZO.RESERVE (RESERVE_ID,NOTE,RDATE,ANIMAL_ID,HOSPITAL_ID,STATUS,USER_EMAIL)
values (1,'요즘 힘이 없고 먹이를 잘 안먹어요',to_date('19/10/23','RR/MM/DD'),2,2,'진료 전','nakta@daum.net');
Insert into ZALBAZO.RESERVE (RESERVE_ID,NOTE,RDATE,ANIMAL_ID,HOSPITAL_ID,STATUS,USER_EMAIL)
values (2,'설사가 너무 심해요',to_date('19/11/01','RR/MM/DD'),1,1,'진료 전','puppylover@naver.com');
Insert into ZALBAZO.RESERVE (RESERVE_ID,NOTE,RDATE,ANIMAL_ID,HOSPITAL_ID,STATUS,USER_EMAIL)
values (3,'며칠 전부터 걸을 때 발을 절어요',to_date('19/10/18','RR/MM/DD'),3,3,'진료 전','bird1234@daum.net');
Insert into ZALBAZO.RESERVE (RESERVE_ID,NOTE,RDATE,ANIMAL_ID,HOSPITAL_ID,STATUS,USER_EMAIL)
values (4,'변에서 피가 나와요ㅠㅠ',to_date('19/10/22','RR/MM/DD'),4,1,'진료 전','ilikecat@gmail.com');
Insert into ZALBAZO.RESERVE (RESERVE_ID,NOTE,RDATE,ANIMAL_ID,HOSPITAL_ID,STATUS,USER_EMAIL)
values (5,'미용',to_date('19/10/31','RR/MM/DD'),5,1,'진료 전','doglover@daum.net');
