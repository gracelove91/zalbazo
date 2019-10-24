Insert into ZALBAZO.CATEGORY (CATEGORY_ID,NAME) values (1,'community');
Insert into ZALBAZO.CATEGORY (CATEGORY_ID,NAME) values (2,'jisik');
Insert into ZALBAZO.CATEGORY (CATEGORY_ID,NAME) values (3,'review');
Insert into ZALBAZO.CATEGORY (CATEGORY_ID,NAME) values (4,'hqna');
Insert into ZALBAZO.CATEGORY (CATEGORY_ID,NAME) values (5,'message');


Insert into ZALBAZO.ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, ADDRESS, NAME, JOIN_DATE, LAST_LOGIN)
Values('dummy@gmail.com', '{noop}1234', 'user', '01033499440', '서울시 서초구', '홍길동', sysdate, sysdate);


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