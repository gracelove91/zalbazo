insert into ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, ADDRESS, NAME, JOIN_DATE, LAST_LOGIN, HOSPITAL_ID)
values ('baba1234@gmail.com', '{noop}1234', 'user', '01012341234', '서울시 서초구', '바바', sysdate, null, null);

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (CONTENT_SEQ.nextval,'노견 강아지 사료 추천합니다~','로얄캐닌에서 갈아탔어요~ 정보 원하시는 분은 댓글!',to_date('19/10/10','RR/MM/DD'),to_date('19/10/10','RR/MM/DD'),1,'baba1234@gmail.com');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (CONTENT_SEQ.nextval,'아기 강아지 이름 추천 받아요','스트릿 출신 믹스 아가입니다 ㅋㅋ',to_date('19/10/13','RR/MM/DD'),to_date('19/10/13','RR/MM/DD'),1,'baba1234@gmail.com');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (CONTENT_SEQ.nextval,'잘바조 좋네요ㅎ 검색도 잘되고','덕분에 예약도 간편하게 할 수 있게 됐네요',to_date('19/10/12','RR/MM/DD'),to_date('19/10/12','RR/MM/DD'),1,'baba1234@gmail.com');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (CONTENT_SEQ.nextval,'혹시 햄스터 보호자 분 계신가요?','간식 추천 좀 해주세요~',to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),1,'baba1234@gmail.com');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (CONTENT_SEQ.nextval,'코숏 아기 길냥이 임보중입니다.','너무너무 귀여운데 데려가실 분? ㅎㅎ',to_date('19/10/10','RR/MM/DD'),to_date('19/10/10','RR/MM/DD'),1,'baba1234@gmail.com');

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (CONTENT_SEQ.nextval,'혹시 조류 진료도 가능한 병원 있을까요?','저희 할머니가 키우시는 닭이 아픈 것 같아서요.',to_date('19/10/11','RR/MM/DD'),to_date('19/10/11','RR/MM/DD'),2,'baba1234@gmail.com');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (CONTENT_SEQ.nextval,'길냥이를 갑자기 마주치게 된다면, 어떤 걸 줘야 할까요?','편의점에서 파는 캔도 괜찮은가요...',to_date('19/10/11','RR/MM/DD'),to_date('19/10/11','RR/MM/DD'),2,'baba1234@gmail.com');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (CONTENT_SEQ.nextval,'국산 사료는 위험한가요?','아무래도 성분이 별로인가요?',to_date('19/10/11','RR/MM/DD'),to_date('19/10/11','RR/MM/DD'),2,'baba1234@gmail.com');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (CONTENT_SEQ.nextval,'마트에서 파는 간식은 안전한 건가요?','종종 사주는데.. 걱정 되네요...',to_date('19/10/11','RR/MM/DD'),to_date('19/10/11','RR/MM/DD'),2,'baba1234@gmail.com');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL)
values (CONTENT_SEQ.nextval,'고양이에게 디퓨저는 많이 해로운가요?','특히 시트러스 향 계열이 위험하다던데.. 이유가 뭔가요?',to_date('19/10/11','RR/MM/DD'),to_date('19/10/11','RR/MM/DD'),2,'baba1234@gmail.com');

INSERT into animal(ANIMAL_ID, TYPE, SEX, WEIGHT, AGE,
                   ANAME, NOTE, LAST_TREAT_DATE, CREATED_DATE, UPDATED_DATE, USER_EMAIL)
values (ANIMAL_SEQ.nextval, '강아지', '중성', 3, 6, '단오', '피부병이 있으니 미용시 주의해주세요.', sysdate, sysdate, sysdate, 'baba1234@gmail.com');
INSERT into animal(ANIMAL_ID, TYPE, SEX, WEIGHT, AGE,
                   ANAME, NOTE, LAST_TREAT_DATE, CREATED_DATE, UPDATED_DATE, USER_EMAIL)
values (ANIMAL_SEQ.nextval, '고양이', '남', 2, 5, '춘배', '주사를 많이 무서워 합니다.', sysdate, sysdate, sysdate, 'baba1234@gmail.com');

insert into RESERVE (RESERVE_ID, NOTE, RDATE, ANIMAL_ID, HOSPITAL_ID, STATUS,USER_EMAIL)
values (RESERVE_SEQ.nextval, '심장사상충 예방접종', '19/10/24', 7, 2, '진료 전', 'baba1234@gmail.com');
commit;