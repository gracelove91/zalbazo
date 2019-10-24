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

Insert into ZALBAZO.LABEL (CODE,NAME) values (1,'24시간');
Insert into ZALBAZO.LABEL (CODE,NAME) values (2,'미용');
Insert into ZALBAZO.LABEL (CODE,NAME) values (3,'주차');
Insert into ZALBAZO.LABEL (CODE,NAME) values (4,'특수동물');
Insert into ZALBAZO.LABEL (CODE,NAME) values (5,'수술전문');



--병원
INSERT ALL
    INTO hospital (hospital_id, name, address, treat_start, treat_end, tel, info)
values (HOSPITAL_SEQ.nextval, '돌봄동물병원', '서울특별시 강동구 암사동 414-18 롯데캐슬상가 2층',
        '08:00','21:00','024262775',
        '가족을 돌보는 마음으로 반려동물을 진료하는 돌봄 동물병원입니다.')
INTO ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, NAME, ADDRESS, JOIN_DATE, LAST_LOGIN, ENABLED, HOSPITAL_ID)
values ('hospital'||HOSPITAL_SEQ.currval||'@gmail.com', '{noop}1234', 'hospital', '024262775', '돌봄동물병원', '서울특별시 강동구 암사동 414-18 롯데캐슬상가 2층', sysdate, null, 'enabled', HOSPITAL_SEQ.currval)

INTO ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (1,HOSPITAL_SEQ.currval)
INTO ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (2,HOSPITAL_SEQ.currval)
INTO ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (3,HOSPITAL_SEQ.currval)

INTO PIC_LIB (UUID, UPLOAD_PATH, FILE_NAME)
VALUES (UUID_SEQ.nextval, 'resources/img', '1.jpg')
INTO PIC_LIB_REL_HOSPITAL (UUID, HOSPITAL_ID)
VALUES (UUID_SEQ.currval, HOSPITAL_SEQ.currval)
SELECT * FROM DUAL;

show escape;
set escape on;

INSERT ALL
    INTO hospital (hospital_id, name, address, treat_start, treat_end, tel, info)
values (HOSPITAL_SEQ.nextval, '아이윌24시동물병원', '서울 강남구 학동로 437',
        '00:00', '24:00', '0269257021',
        '강아지 고관절(LCPD) \& 슬개골 수술 전문
        고양이 전문 동물병원')
INTO ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, NAME, ADDRESS, JOIN_DATE, LAST_LOGIN, ENABLED, HOSPITAL_ID)
values ('hospital'||HOSPITAL_SEQ.currval||'@gmail.com', '{noop}1234', 'hospital', '0269257021', '아이윌24시동물병원', '서울 강남구 학동로 437', sysdate, null, 'enabled', HOSPITAL_SEQ.currval)
INTO ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (3,HOSPITAL_SEQ.currval)
INTO ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (5,HOSPITAL_SEQ.currval)
INTO PIC_LIB (UUID, UPLOAD_PATH, FILE_NAME)
VALUES (uuid_SEQ.nextval, 'resources/img', '1.jpg')
INTO PIC_LIB_REL_HOSPITAL (UUID, HOSPITAL_ID)
VALUES (uuid_SEQ.currval, HOSPITAL_SEQ.currval)
SELECT * FROM DUAL;
COMMIT;

INSERT ALL
    INTO hospital (hospital_id, name, address, treat_start, treat_end, tel, info)
values (HOSPITAL_SEQ.nextval, '자이언츠동물병원', '부산광역시 동래구 사직북로 26', '00:00', '24:00', '0515127582', '')
INTO ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, ADDRESS, NAME, JOIN_DATE, LAST_LOGIN, ENABLED, HOSPITAL_ID)
values ('hospital'||HOSPITAL_SEQ.currval||'@gmail.com', '{noop}1234', 'hospital', '0515127582', '부산광역시 동래구 사직북로 26', '자이언츠동물병원', sysdate, null, 'enabled', HOSPITAL_SEQ.currval)
INTO ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (1,HOSPITAL_SEQ.currval)
INTO ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (5,HOSPITAL_SEQ.currval)
INTO PIC_LIB (UUID, UPLOAD_PATH, FILE_NAME)
VALUES (uuid_SEQ.nextval, 'resources/img', '1.jpg')
INTO PIC_LIB_REL_HOSPITAL (UUID, HOSPITAL_ID)
VALUES (uuid_SEQ.currval, HOSPITAL_SEQ.currval)
SELECT * FROM DUAL;
COMMIT;

INSERT ALL
    INTO hospital (hospital_id, name, address, treat_start, treat_end, tel, info)
values (HOSPITAL_SEQ.nextval, '정서동물병원', '인천 남동구 주안로 234 풍림아이원 주상가 112호',
        '10:00', '20:00', '0324225399', '[남동구 주안로 234 ] , 풍림아이원 상가 112호에 위치하여 있습니다. 도로명주소로 검색을 하시면
보다 쉽게 새로 이사한 병원 위치를 찾으실 수 있습니다~^^ [인천 정서동물병원]')
INTO ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, NAME, ADDRESS, JOIN_DATE, LAST_LOGIN, ENABLED, HOSPITAL_ID)
values ('hospital'||HOSPITAL_SEQ.currval||'@gmail.com', '{noop}1234', 'hospital', '0324225399', '정서동물병원', '인천 남동구 주안로 234 풍림아이원 주상가 112호', sysdate, null, 'enabled', HOSPITAL_SEQ.currval)
INTO ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (2,HOSPITAL_SEQ.currval)
INTO ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (3,HOSPITAL_SEQ.currval)
INTO PIC_LIB (UUID, UPLOAD_PATH, FILE_NAME)
VALUES (uuid_SEQ.nextval, 'resources/img', '1.jpg')
INTO PIC_LIB_REL_HOSPITAL (UUID, HOSPITAL_ID)
VALUES (uuid_SEQ.currval, HOSPITAL_SEQ.currval)
SELECT * FROM DUAL;
COMMIT;

INSERT ALL
    INTO hospital (hospital_id, name, address, treat_start, treat_end, tel, info)
values (HOSPITAL_SEQ.nextval, '고양이병원 백산동물병원', '서울 강남구 논현로86길 22',
        '00:00', '24:00', '16445653',
        '저희 백산동물병원은 서울 강남구 역삼동에 위치하고 있으며, 고양이만 진료하는 고양이병원입니다.
        국제 고양이 학회(ISFM)병원으로서 수의사 선생님들에게도 많은 강의를 통해 국내는 물론 세계적인 고양이 전문병원이 되고자 항상 노력하고 있습니다.

        앞으로도 저희 백산가족은 반려동물과 보호자분들을 위한 최상의 의료서비스가 가능하도록 더욱 노력하겠습니다.')
INTO ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, NAME, ADDRESS, JOIN_DATE, LAST_LOGIN, ENABLED, HOSPITAL_ID)
values ('hospital'||HOSPITAL_SEQ.currval||'@gmail.com', '{noop}1234', 'hospital', '16445653', '고양이병원 백산동물병원', '서울 강남구 논현로86길 22', sysdate, null, 'enabled', HOSPITAL_SEQ.currval)
INTO ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (1,HOSPITAL_SEQ.currval)
INTO ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (3,HOSPITAL_SEQ.currval)
INTO PIC_LIB (UUID, UPLOAD_PATH, FILE_NAME)
VALUES (uuid_SEQ.nextval, 'resources/img', '1.jpg')
INTO PIC_LIB_REL_HOSPITAL (UUID, HOSPITAL_ID)
VALUES (uuid_SEQ.currval, HOSPITAL_SEQ.currval)
SELECT * FROM DUAL;
COMMIT;

INSERT ALL
    INTO hospital (hospital_id, name, address, treat_start, treat_end, tel, info)
values (HOSPITAL_SEQ.nextval, '동수동물병원', '인천광역시 부평구 경원대로 1422 부평대덕아크로존',
        '10:00', '20:00', '0325115338',
        '진찰과 검사를 통해 정확하게 진단을 하고 따뜻한 보살핌과 적절한 치료를 해야한다고 생각합니다.
        저희 병원은 항상 밝은 웃음과 청결을 위해 노력하고 있습니다. 강아지와 고양이의 멋과 피부 건강을 위해서 미용실을 운영하고 있으며, 사랑과 따뜻한 손길로 미용을 하고 있습니다.
        고객님들이 찾아 주시면 만족을 드리겠습니다.')
INTO ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, NAME, ADDRESS, JOIN_DATE, LAST_LOGIN, ENABLED, HOSPITAL_ID)
values ('hospital'||HOSPITAL_SEQ.currval||'@gmail.com', '{noop}1234', 'hospital', '0325115338', '동수동물병원', '인천광역시 부평구 경원대로 1422 부평대덕아크로존', sysdate, null, 'enabled', HOSPITAL_SEQ.currval)
INTO ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (3,HOSPITAL_SEQ.currval)
INTO PIC_LIB (UUID, UPLOAD_PATH, FILE_NAME)
VALUES (uuid_SEQ.nextval, 'resources/img', '1.jpg')
INTO PIC_LIB_REL_HOSPITAL (UUID, HOSPITAL_ID)
VALUES (uuid_SEQ.currval, HOSPITAL_SEQ.currval)
SELECT * FROM DUAL;
COMMIT;

INSERT ALL
    INTO hospital (hospital_id, name, address, treat_start, treat_end, tel, info)
values (HOSPITAL_SEQ.nextval, '청라라임동물병원', '인천광역시 서구 청라라임로 102',
        '09:00', '20:00', '0325631900', ' ')
INTO ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, NAME, ADDRESS, JOIN_DATE, LAST_LOGIN, ENABLED, HOSPITAL_ID)
values ('hospital'||HOSPITAL_SEQ.currval||'@gmail.com', '{noop}1234', 'hospital', '0325631900', '청라라임동물병원', '인천광역시 서구 청라라임로 102', sysdate, null, 'enabled', HOSPITAL_SEQ.currval)
INTO PIC_LIB (UUID, UPLOAD_PATH, FILE_NAME)
VALUES (uuid_SEQ.nextval, 'resources/img', '1.jpg')
INTO PIC_LIB_REL_HOSPITAL (UUID, HOSPITAL_ID)
VALUES (uuid_SEQ.currval, HOSPITAL_SEQ.currval)
SELECT * FROM DUAL;
COMMIT;

INSERT ALL
    INTO hospital (hospital_id, name, address, treat_start, treat_end, tel, info)
values (HOSPITAL_SEQ.nextval, '24시독스동물병원', '인천광역시 남동구 남동대로 912 유진빌딩', '00:00', '24:00', '0324330075',
        '400평 규모의 동물병원으로서 최첨단의료장비를 다수 보유하고, 실력과 경력이 검증된 7명의 수의사 및 30여명의 근무자가 365일 24시간 서비스하고 있습니다.')
INTO ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, NAME, ADDRESS, JOIN_DATE, LAST_LOGIN, ENABLED, HOSPITAL_ID)
values ('hospital'||HOSPITAL_SEQ.currval||'@gmail.com', '{noop}1234', 'hospital', '0324330075', '24시독스동물병원', '인천광역시 남동구 남동대로 912 유진빌딩', sysdate, null, 'enabled', HOSPITAL_SEQ.currval)
INTO ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (1,HOSPITAL_SEQ.currval)
INTO ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (3,HOSPITAL_SEQ.currval)
INTO PIC_LIB (UUID, UPLOAD_PATH, FILE_NAME)
VALUES (uuid_SEQ.nextval, 'resources/img', '1.jpg')
INTO PIC_LIB_REL_HOSPITAL (UUID, HOSPITAL_ID)
VALUES (uuid_SEQ.currval, HOSPITAL_SEQ.currval)
SELECT * FROM DUAL;
COMMIT;

INSERT ALL
    INTO hospital (hospital_id, name, address, treat_start, treat_end, tel, info)
values (HOSPITAL_SEQ.nextval, '부산동물메디컬센터', '부산광역시 연제구 거제대로 278', '09:00', '18:00', '0518687591',
        '석, 박사 의료진을 비롯한 40여명의 스텝들 간의 상호 체계적이고 전문화된 진료 시스템')
INTO ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, ADDRESS, NAME, JOIN_DATE, LAST_LOGIN, ENABLED, HOSPITAL_ID)
values ('hospital'||HOSPITAL_SEQ.currval||'@gmail.com', '{noop}1234', 'hospital', '0518687591', '부산광역시 연제구 거제대로 278', '부산동물메디컬센터', sysdate, null, 'enabled', HOSPITAL_SEQ.currval)
INTO ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (2,HOSPITAL_SEQ.currval)
INTO PIC_LIB (UUID, UPLOAD_PATH, FILE_NAME)
VALUES (uuid_SEQ.nextval, 'resources/img', '1.jpg')
INTO PIC_LIB_REL_HOSPITAL (UUID, HOSPITAL_ID)
VALUES (uuid_SEQ.currval, HOSPITAL_SEQ.currval)
SELECT * FROM DUAL;
COMMIT;

INSERT ALL
    INTO hospital (hospital_id, name, address, treat_start, treat_end, tel, info)
values (HOSPITAL_SEQ.nextval, '24시부평종합동물의료센터', '인천 부평구 부평대로 138 신일유스테이션 2층',
        '00:00', '24:00', '0325116836', '건물 지하에 무료주차장이 준비되어 있습니다.')
INTO ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, NAME, ADDRESS, JOIN_DATE, LAST_LOGIN, ENABLED, HOSPITAL_ID)
values ('hospital'||HOSPITAL_SEQ.currval||'@gmail.com', '{noop}1234', 'hospital', '0325116836', '24시부평종합동물의료센터', '인천 부평구 부평대로 138 신일유스테이션 2층', sysdate, null, 'enabled', HOSPITAL_SEQ.currval)
INTO ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (1,HOSPITAL_SEQ.currval)
INTO ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (3,HOSPITAL_SEQ.currval)
INTO PIC_LIB (UUID, UPLOAD_PATH, FILE_NAME)
VALUES (uuid_SEQ.nextval, 'resources/img', '1.jpg')
INTO PIC_LIB_REL_HOSPITAL (UUID, HOSPITAL_ID)
VALUES (uuid_SEQ.currval, HOSPITAL_SEQ.currval)
SELECT * FROM DUAL;
COMMIT;

INSERT ALL
    INTO hospital (hospital_id, name, address, treat_start, treat_end, tel, info)
values (HOSPITAL_SEQ.nextval, '동물병원산책', '부산광역시 금정구 수림로 25 쌍용아파트', '10:00', '19:00', '0517140209', '산책하듯 가볍게 들릴수 있는 동물병원입니다^^')
INTO ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, ADDRESS, NAME, JOIN_DATE, LAST_LOGIN, ENABLED, HOSPITAL_ID)
values ('hospital'||HOSPITAL_SEQ.currval||'@gmail.com', '{noop}1234', 'hospital', '0517140209', '부산광역시 금정구 수림로 25 쌍용아파트', '동물병원산책', sysdate, null, 'enabled', HOSPITAL_SEQ.currval)
INTO ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (3,HOSPITAL_SEQ.currval)
INTO PIC_LIB (UUID, UPLOAD_PATH, FILE_NAME)
VALUES (uuid_SEQ.nextval, 'resources/img', '1.jpg')
INTO PIC_LIB_REL_HOSPITAL (UUID, HOSPITAL_ID)
VALUES (uuid_SEQ.currval, HOSPITAL_SEQ.currval)
SELECT * FROM DUAL;
COMMIT;

INSERT ALL
    INTO hospital (hospital_id, name, address, treat_start, treat_end, tel, info)
values (HOSPITAL_SEQ.nextval, '금오동물병원', '경기 의정부시 청사로 37', '09:00', '21:00', '0318267582',
        '저희 동물병원은 최신의 의료장비와 쾌적한 환경을 갖추고 있어 반려 동물들이 최선의 진료를 받을 수 있도록 노력하고 있습니다.
        항상 새로운 지식을 습득하며 공부해 나가는 병원입니다.
        본원의 진료 여부와 상관없이 전화로 반려동물의 문제를 상담해 드리며 가족 같은 편안함으로 맞이합니다. 감사합니다.')
INTO ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, ADDRESS, NAME, JOIN_DATE, LAST_LOGIN, ENABLED, HOSPITAL_ID)
values ('hospital'||HOSPITAL_SEQ.currval||'@gmail.com', '{noop}1234', 'hospital', '0318267582', '경기 의정부시 청사로 37', '금오동물병원', sysdate, null, 'enabled', HOSPITAL_SEQ.currval)
INTO PIC_LIB (UUID, UPLOAD_PATH, FILE_NAME)
VALUES (uuid_SEQ.nextval, 'resources/img', '1.jpg')
INTO PIC_LIB_REL_HOSPITAL (UUID, HOSPITAL_ID)
VALUES (uuid_SEQ.currval, HOSPITAL_SEQ.currval)
SELECT * FROM DUAL;
COMMIT;

INSERT ALL
    INTO hospital (hospital_id, name, address, treat_start, treat_end, tel, info)
values (HOSPITAL_SEQ.nextval, 'UN동물의료센터', '부산광역시 남구 대연동 1745-9', '00:00', '24:00', '0516242475',
        '1,2,3층 160여평의 단독병원으로 기계,장비에 대한 투자를 끊임없이 하고 있으며
        내과센터,외과(수술)센터,고양이의료센터,특수동물센터, 재활센터,줄기세포센터, 영상진단센터, 24시야간응급센터를 갖추고 있습니다.')
INTO ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, ADDRESS, NAME, JOIN_DATE, LAST_LOGIN, ENABLED, HOSPITAL_ID)
values ('hospital'||HOSPITAL_SEQ.currval||'@gmail.com', '{noop}1234', 'hospital', '0516242475', '부산광역시 남구 대연동 1745-9', 'UN동물의료센터', sysdate, null, 'enabled', HOSPITAL_SEQ.currval)
INTO ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (1,HOSPITAL_SEQ.currval)
INTO ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (4,HOSPITAL_SEQ.currval)
INTO ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (5,HOSPITAL_SEQ.currval)
INTO PIC_LIB (UUID, UPLOAD_PATH, FILE_NAME)
VALUES (uuid_SEQ.nextval, 'resources/img', '1.jpg')
INTO PIC_LIB_REL_HOSPITAL (UUID, HOSPITAL_ID)
VALUES (uuid_SEQ.currval, HOSPITAL_SEQ.currval)
SELECT * FROM DUAL;
COMMIT;

INSERT ALL
    INTO hospital (hospital_id, name, address, treat_start, treat_end, tel, info)
values (HOSPITAL_SEQ.nextval, '캐비어 동물메디컬센터', '경기도 성남시 중원구 금광2동 4614', '00:00', '24:00', '0317411799',
        '2차 진료 병원인 캐비어 동물메디컬센터는 TV와 잡지 학술지에 자주 소개되는 병원으로, 수의사단체의 강사진으로 구성된 전문 의료진과 전문 수의간호사의 스텝으로 한차원 높은 진료의 질을 추구하였으며,
        서울대학교와 충남대학교 교수진과 긴밀한 진료협조관계를 통해 정확한 진단과 최선의 처치를 받으실 수 있습니다.')
INTO ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, ADDRESS, NAME, JOIN_DATE, LAST_LOGIN, ENABLED, HOSPITAL_ID)
values ('hospital'||HOSPITAL_SEQ.currval||'@gmail.com', '{noop}1234', 'hospital', '0317411799', '경기도 성남시 중원구 금광2동 4614', '캐비어 동물메디컬센터', sysdate, null, 'enabled', HOSPITAL_SEQ.currval)
INTO ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (1,HOSPITAL_SEQ.currval)
INTO PIC_LIB (UUID, UPLOAD_PATH, FILE_NAME)
VALUES (uuid_SEQ.nextval, 'resources/img', '1.jpg')
INTO PIC_LIB_REL_HOSPITAL (UUID, HOSPITAL_ID)
VALUES (uuid_SEQ.currval, HOSPITAL_SEQ.currval)
SELECT * FROM DUAL;
COMMIT;

INSERT ALL
    INTO hospital (hospital_id, name, address, treat_start, treat_end, tel, info)
values (HOSPITAL_SEQ.nextval, '라온동물병원', '부산광역시 사하구 낙동대로 5118', '09:00', '18:00', '0512917900',
        '시끄럽고 낯선 환경에 예민할 수 있는 고양이를 배려한 고양이 전용 대기실, 고양이 전용 진료실, 고양이 전용 입원실, 격리 입원실을 분리 운영하여
        고양이와 보호자분 편안하게 진료를 받을 수 있습니다.')
INTO ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, ADDRESS, NAME, JOIN_DATE, LAST_LOGIN, ENABLED, HOSPITAL_ID)
values ('hospital'||HOSPITAL_SEQ.currval||'@gmail.com', '{noop}1234', 'hospital', '0512917900', '부산광역시 사하구 낙동대로 5118', '라온동물병원', sysdate, null, 'enabled', HOSPITAL_SEQ.currval)
INTO ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (3,HOSPITAL_SEQ.currval)
INTO PIC_LIB (UUID, UPLOAD_PATH, FILE_NAME)
VALUES (uuid_SEQ.nextval, 'resources/img', '1.jpg')
INTO PIC_LIB_REL_HOSPITAL (UUID, HOSPITAL_ID)
VALUES (uuid_SEQ.currval, HOSPITAL_SEQ.currval)
SELECT * FROM DUAL;
COMMIT;

INSERT ALL
    INTO hospital (hospital_id, name, address, treat_start, treat_end, tel, info)
values (HOSPITAL_SEQ.nextval, '바른동물병원', '의정부동 210-1', '09:00', '24:00', '0318427582',
        '- 수술비용 문의는 진료 후 상담 부탁드립니다.
        - 입원한 동물 면회, 전화상담은 일반 진료시간을 이용 부탁드립니다.
        - 야간응급진료 내원시에는 내원 전에 전화 부탁드립니다. ( 응급상황에 좀 더 신속히 대비하기 위해서입니다)
        - 지역 주민, 반려동물과 함께 하는 동물병원을 만들기 위해 노력하고 있습니다.
        - 차량이용시에는 본원 건물 측면에 있는 동물병원 전용 주차장을 이용하시면 됩니다. (타워에 주차하지 않아도 됨)')
INTO ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, ADDRESS, NAME, JOIN_DATE, LAST_LOGIN, ENABLED, HOSPITAL_ID)
values ('hospital'||HOSPITAL_SEQ.currval||'@gmail.com', '{noop}1234', 'hospital', '0318427582', '의정부동 210-1', '바른동물병원', sysdate, null, 'enabled', HOSPITAL_SEQ.currval)
INTO ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (3,HOSPITAL_SEQ.currval)
INTO PIC_LIB (UUID, UPLOAD_PATH, FILE_NAME)
VALUES (uuid_SEQ.nextval, 'resources/img', '1.jpg')
INTO PIC_LIB_REL_HOSPITAL (UUID, HOSPITAL_ID)
VALUES (uuid_SEQ.currval, HOSPITAL_SEQ.currval)
SELECT * FROM DUAL;
COMMIT;

INSERT ALL
    INTO hospital (hospital_id, name, address, treat_start, treat_end, tel, info)
values (HOSPITAL_SEQ.nextval, '군포굿닥터동물병원', '경기도 군포시 당동 922-25 1층', '10:00', '18:00', '0313917533', '')
INTO ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, ADDRESS, NAME, JOIN_DATE, LAST_LOGIN, ENABLED, HOSPITAL_ID)
values ('hospital'||HOSPITAL_SEQ.currval||'@gmail.com', '{noop}1234', 'hospital', '0313917533', '경기도 군포시 당동 922-25 1층', '군포굿닥터동물병원', sysdate, null, 'enabled', HOSPITAL_SEQ.currval)
INTO ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (2,HOSPITAL_SEQ.currval)
INTO PIC_LIB (UUID, UPLOAD_PATH, FILE_NAME)
VALUES (uuid_SEQ.nextval, 'resources/img', '1.jpg')
INTO PIC_LIB_REL_HOSPITAL (UUID, HOSPITAL_ID)
VALUES (uuid_SEQ.currval, HOSPITAL_SEQ.currval)
SELECT * FROM DUAL;
COMMIT;

INSERT ALL
    INTO hospital (hospital_id, name, address, treat_start, treat_end, tel, info)
values (HOSPITAL_SEQ.nextval, '다솜동물메디컬센터', '부산 남구 수영로13번길 3', '00:00', '24:00', '0516327580',
        '반려동물복합문화센터를 운영하여 강아지 호텔 / 애견 유치원, 놀이터 / 반려동물 미용, 스파, 용품샵 등이 운영되고 있습니다.')
INTO ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, ADDRESS, NAME, JOIN_DATE, LAST_LOGIN, ENABLED, HOSPITAL_ID)
values ('hospital'||HOSPITAL_SEQ.currval||'@gmail.com', '{noop}1234', 'hospital', '0516327580', '부산 남구 수영로13번길 3', '다솜동물메디컬센터', sysdate, null, 'enabled', HOSPITAL_SEQ.currval)
INTO ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (1,HOSPITAL_SEQ.currval)
INTO ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (2,HOSPITAL_SEQ.currval)
INTO PIC_LIB (UUID, UPLOAD_PATH, FILE_NAME)
VALUES (uuid_SEQ.nextval, 'resources/img', '1.jpg')
INTO PIC_LIB_REL_HOSPITAL (UUID, HOSPITAL_ID)
VALUES (uuid_SEQ.currval, HOSPITAL_SEQ.currval)
SELECT * FROM DUAL;
COMMIT;

INSERT ALL
    INTO hospital (hospital_id, name, address, treat_start, treat_end, tel, info)
values (HOSPITAL_SEQ.nextval, '마리동물병원', '부산광역시 해운대구 해운대로 794 삼정엘리움', '09:00', '19:00', '0517025750',
        '')
INTO ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, ADDRESS, NAME, JOIN_DATE, LAST_LOGIN, ENABLED, HOSPITAL_ID)
values ('hospital'||HOSPITAL_SEQ.currval||'@gmail.com', '{noop}1234', 'hospital', '0517025750', '부산광역시 해운대구 해운대로 794 삼정엘리움', '마리동물병원', sysdate, null, 'enabled', HOSPITAL_SEQ.currval)
INTO ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (2,HOSPITAL_SEQ.currval)
INTO PIC_LIB (UUID, UPLOAD_PATH, FILE_NAME)
VALUES (uuid_SEQ.nextval, 'resources/img', '1.jpg')
INTO PIC_LIB_REL_HOSPITAL (UUID, HOSPITAL_ID)
VALUES (uuid_SEQ.currval, HOSPITAL_SEQ.currval)
SELECT * FROM DUAL;
COMMIT;

INSERT ALL
    INTO hospital (hospital_id, name, address, treat_start, treat_end, tel, info)
values (HOSPITAL_SEQ.nextval, '서울동물심장병원', '서울 강남구 언주로 542 ENP타워 1층',
        '09:00', '21:00', '0262037588',
        '안녕하세요. 저희 병원은 고양이와 개를 포함한 동물의 심장질환의 진단과 치료에 특화된 병원입니다.
        주요 진료과목은
        1) 일반 심장질환의 진단과 치료 (고양이 비대성 심근병증, 개의 이첨판 폐쇄 부전증 등)
        2) 노령성 중요 내과 질환 (신장기능부전, 췌장염, 쿠싱 증후군 등 호르몬 질환, 간장 부전 등)
        3) 선천성 혹은 후천성 심장병의 심장중재술(interventional cardiology)에 의한 동맥관 개존증 (PDA), 폐동맥판막 협착증 등 수술
        4) 각종 부정맥 시술 ( 페이스 메이커 장착, 심방세동의 제세동 등 ) 입니다.
        5) 심혈관계 건강상태에 대한 건강검진 등 입니다.


        감사합니다.')
INTO ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, NAME, ADDRESS, JOIN_DATE, LAST_LOGIN, ENABLED, HOSPITAL_ID)
values ('hospital'||HOSPITAL_SEQ.currval||'@gmail.com', '{noop}1234', 'hospital', '0262037588', '서울동물심장병원', '서울 강남구 언주로 542 ENP타워 1층', sysdate, null, 'enabled', HOSPITAL_SEQ.currval)
INTO ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (3,HOSPITAL_SEQ.currval)
INTO ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (5,HOSPITAL_SEQ.currval)
INTO PIC_LIB (UUID, UPLOAD_PATH, FILE_NAME)
VALUES (uuid_SEQ.nextval, 'resources/img', '1.jpg')
INTO PIC_LIB_REL_HOSPITAL (UUID, HOSPITAL_ID)
VALUES (uuid_SEQ.currval, HOSPITAL_SEQ.currval)
SELECT * FROM DUAL;
COMMIT;

INSERT ALL
    INTO hospital (hospital_id, name, address, treat_start, treat_end, tel, info)
values (HOSPITAL_SEQ.nextval, '국제동물병원', '부산 강서구 명지국제8로 243', '10:00', '20:00', '0512047588',
        '사랑과 정성으로 최선을다해 치료하겠습니다.')
INTO ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, ADDRESS, NAME, JOIN_DATE, LAST_LOGIN, ENABLED, HOSPITAL_ID)
values ('hospital'||HOSPITAL_SEQ.currval||'@gmail.com', '{noop}1234', 'hospital', '0512047588', '부산 강서구 명지국제8로 243', '국제동물병원', sysdate, null, 'enabled', HOSPITAL_SEQ.currval)
INTO ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (3,HOSPITAL_SEQ.currval)
INTO PIC_LIB (UUID, UPLOAD_PATH, FILE_NAME)
VALUES (uuid_SEQ.nextval, 'resources/img', '1.jpg')
INTO PIC_LIB_REL_HOSPITAL (UUID, HOSPITAL_ID)
VALUES (uuid_SEQ.currval, HOSPITAL_SEQ.currval)
SELECT * FROM DUAL;
COMMIT;

INSERT ALL
    INTO hospital (hospital_id, name, address, treat_start, treat_end, tel, info)
values (HOSPITAL_SEQ.nextval, '가나24시동물병원', '경기도 안산시 단원구 고잔동 537-4 롯데프라자 1층', '00:00', '24:00', '0314024060',
        '가나동물병원은 24시진료 뿐만아니라 애견용품,분양,미용,호텔,유치원,카페에 이르기까지 반려동물의 원스톱 서비스를 한곳에서 누릴수 있습니다.')
INTO ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, ADDRESS, NAME, JOIN_DATE, LAST_LOGIN, ENABLED, HOSPITAL_ID)
values ('hospital'||HOSPITAL_SEQ.currval||'@gmail.com', '{noop}1234', 'hospital', '0314024060', '경기도 안산시 단원구 고잔동 537-4 롯데프라자 1층', '가나24시동물병원', sysdate, null, 'enabled', HOSPITAL_SEQ.currval)
INTO ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (1,HOSPITAL_SEQ.currval)
INTO ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (2,HOSPITAL_SEQ.currval)
INTO PIC_LIB (UUID, UPLOAD_PATH, FILE_NAME)
VALUES (uuid_SEQ.nextval, 'resources/img', '1.jpg')
INTO PIC_LIB_REL_HOSPITAL (UUID, HOSPITAL_ID)
VALUES (uuid_SEQ.currval, HOSPITAL_SEQ.currval)
SELECT * FROM DUAL;
COMMIT;

INSERT ALL
    INTO hospital (hospital_id, name, address, treat_start, treat_end, tel, info)
values (HOSPITAL_SEQ.nextval, '아크리스동물의료센터', '서울 강남구 봉은사로104길 10 동화빌딩 3층',
        '09:00', '21:00', '025837582',
        'ACRIS Animal Medical Center는 1998년 개원부터 현재까지 항상 낮은 자세로 기본에 충실하며 최고의 의료진과 첨단장비를 기반으로 하여 반려동물 복합문화공간확립에 이바지하고자 노력을 아끼지 않고 있습니다. 30명 이상의 스탭진으로 구성된, 실평수 220평 이상의 규모로 만들어진 반려동물 복합 문화 공간 입니다. 강아지, 고양이, 토끼, 친칠라, 햄스터, 이구아나, 조류, 거북, 고슴도치, 페럿, 뱀, 거북이 등을 진료하며, 작은 생명도 소중히 생각합니다 라는 병원의 원훈을 바탕으로, 최선의 진료와 최적의 시설로 꾸며 놓았습니다. 아크리스 동물의료센터에서는 개,고양이,페럿,앵무새,토끼,고슴도치 등의 다양한 종에 대해 ? 차별화된 진료편성으로 최상의 진료서비스를 제공합니다. ? 보호자와 행복한 복합문화공간을 함께합니다.

        *주차안내 : 건물 후면 기계식주차장 이용, 주변 공영주차장/유료주차장 이용시 1시간 주차비 제공')
INTO ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, NAME, ADDRESS, JOIN_DATE, LAST_LOGIN, ENABLED, HOSPITAL_ID)
values ('hospital'||HOSPITAL_SEQ.currval||'@gmail.com', '{noop}1234', 'hospital', '025837582', '아크리스동물의료센터', '서울 강남구 봉은사로104길 10 동화빌딩 3층', sysdate, null, 'enabled', HOSPITAL_SEQ.currval)
INTO ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (3,HOSPITAL_SEQ.currval)
INTO PIC_LIB (UUID, UPLOAD_PATH, FILE_NAME)
VALUES (uuid_SEQ.nextval, 'resources/img', '1.jpg')
INTO PIC_LIB_REL_HOSPITAL (UUID, HOSPITAL_ID)
VALUES (uuid_SEQ.currval, HOSPITAL_SEQ.currval)
SELECT * FROM DUAL;
COMMIT;

INSERT ALL
    INTO hospital (hospital_id, name, address, treat_start, treat_end, tel, info)
values (HOSPITAL_SEQ.nextval, '고덕24시동물병원', '서울 강동구 동남로 877 106호',
        '00:00','24:00','0262278275',
        '고덕동/명일동에 위치한 24시간 동물병원입니다.
        언제 발생할지 모르는 응급한 아이들을 위한 응급진료.
        대부분의 외과수술이 가능한 호흡마취기, 환자감시기, 수술장비.
        아픈 아이의 혈액상태를 바로 볼 수 있는 혈액검사기.
        철저한 입원관리를 위한 수액펌프, 실린지 펌프, 집중치료실.
        병원으로서 최선을 다하기 위해 장비를 갖추기위해 노력하고 있으며 앞으로도 더 발전시켜나가겠습니다.
        그 외 서비스로는 고양이를 위한 전용 캣타워 호텔. 고양이 미용.
        기존 케이지보다 넓게 제작된 강아지 호텔, 강아지 미용이 있으며
        캣타워와 캣로드로 고양이를 위한 공간을 할애했습니다. 많은 관심 바랍니다.')
INTO ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, NAME, ADDRESS, JOIN_DATE, LAST_LOGIN, ENABLED, HOSPITAL_ID)
values ('hospital'||HOSPITAL_SEQ.currval||'@gmail.com', '{noop}1234', 'hospital', '0262278275', '고덕24시동물병원', '서울 강동구 동남로 877 106호', sysdate, null, 'enabled', HOSPITAL_SEQ.currval)

INTO ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (3,HOSPITAL_SEQ.currval)
INTO ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (4,HOSPITAL_SEQ.currval)

INTO PIC_LIB (UUID, UPLOAD_PATH, FILE_NAME)
VALUES (UUID_SEQ.nextval, 'resources/img', '1.jpg')
INTO PIC_LIB_REL_HOSPITAL (UUID, HOSPITAL_ID)
VALUES (UUID_SEQ.currval, HOSPITAL_SEQ.currval)
SELECT * FROM DUAL;


INSERT ALL
    INTO hospital (hospital_id, name, address, treat_start, treat_end, tel, info)
values (HOSPITAL_SEQ.nextval, '스마트동물병원 강동암사점', '서울특별시 강동구 암사동 452-31 서원빌딩 1층',
        '10:00','21:00','024428875',
        '원훈 :: 우리집 아이처럼 같이 기뻐하고 같이 고민하는 스마트 가족이 되자
        안녕하세요 스마트동물병원 강동암사지점입니다~!
        강남 신사본원, 강남 대치지점, 울산지점, 동탄지점, 강동구지점 총 5 개의 지점에
        총 36 명의 수의사가 심도깊은 협진으로 가장 안전하고 완벽을 추구하는 의료환경을 추구합니다
        원훈처럼 반려동물들이 가장 편안해 할 수 있는 환경을 조성하여, 반려동물들의 건강과 보호자분 모두의
        행복감을 드리고자 항상 최선을 다한 의료 서비스를 제공해 드리겠습니다.')
INTO ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, NAME, ADDRESS, JOIN_DATE, LAST_LOGIN, ENABLED, HOSPITAL_ID)
values ('hospital'||HOSPITAL_SEQ.currval||'@gmail.com', '{noop}1234', 'hospital', '024428875', '스마트동물병원 강동암사점', '서울특별시 강동구 암사동 452-31 서원빌딩 1층', sysdate, null, 'enabled', HOSPITAL_SEQ.currval)

INTO ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (1,HOSPITAL_SEQ.currval)
INTO ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (3,HOSPITAL_SEQ.currval)
INTO ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (5,HOSPITAL_SEQ.currval)

INTO PIC_LIB (UUID, UPLOAD_PATH, FILE_NAME)
VALUES (UUID_SEQ.nextval, 'resources/img', '1.jpg')
INTO PIC_LIB_REL_HOSPITAL (UUID, HOSPITAL_ID)
VALUES (UUID_SEQ.currval, HOSPITAL_SEQ.currval)
SELECT * FROM DUAL;



-- USER INSER --
Insert into ZALBAZO.ZALBAZO_USER (USER_EMAIL,PASSWORD,ROLE,TEL,ADDRESS,NAME,JOIN_DATE,LAST_LOGIN,ENABLED,EMAIL_AUTH_KEY,HOSPITAL_ID)
values ('upwyy123@gmail.com','{noop}1234','user','444','서울특별시 동작구 동작대로 121-4,(사당동)','메메',to_date('19/09/14','RR/MM/DD'),null,'enabled',null,null);

Insert into ZALBAZO.ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, ADDRESS, NAME, JOIN_DATE, LAST_LOGIN, enabled)
Values('jjlee@gmail.com', '{noop}1234', 'user', '01097946214', '인천시 부평구', '이재이', to_date('19/09/29','RR/MM/DD'), sysdate, 'enabled');

Insert into ZALBAZO.ZALBAZO_USER (USER_EMAIL,PASSWORD,ROLE,TEL,ADDRESS,NAME,JOIN_DATE,LAST_LOGIN,ENABLED,EMAIL_AUTH_KEY,HOSPITAL_ID)
values ('iceice@gmail.com','{noop}1234','user','01012340987','서울시 서초구','아이스베어',to_date('19/10/01','RR/MM/DD'),sysdate,'enabled',null,null);

insert into ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, ADDRESS, NAME, JOIN_DATE, LAST_LOGIN, HOSPITAL_ID)
values ('baba1234@gmail.com', '{noop}1234', 'user', '01012341234', '서울시 서초구', '바바', to_date('19/10/11','RR/MM/DD'), null, null);


-- 계정 5개 만들기
insert into ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, ADDRESS, NAME, JOIN_DATE, LAST_LOGIN, HOSPITAL_ID, ENABLED)
values ('doglover@daum.net', '{noop}1234', 'user', 01045671234, '서울 서초구 방배로33길 29', '박수진', to_date('19/09/01','RR/MM/DD'),null, null, 'enabled');
insert into ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, ADDRESS, NAME, JOIN_DATE, LAST_LOGIN, HOSPITAL_ID, ENABLED)
values ('ilikecat@gmail.com', '{noop}1234', 'user', 01012347890, '경기 오산시 삼미로 34', '한성진', to_date('19/09/22','RR/MM/DD'),null, null, 'enabled');
insert into ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, ADDRESS, NAME, JOIN_DATE, LAST_LOGIN, HOSPITAL_ID, ENABLED)
values ('bird1234@daum.net', '{noop}1234', 'user', 01011119923, '부산 해운대구 마린시티2로 33', 'jin', to_date('19/10/10','RR/MM/DD'),null, null, 'enabled');
insert into ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, ADDRESS, NAME, JOIN_DATE, LAST_LOGIN, HOSPITAL_ID, ENABLED)
values ('puppylover@naver.com', '{noop}1234', 'user', 01045671234, '세종특별자치시 다정남로 22', 'mike', to_date('19/10/07','RR/MM/DD'),null, null, 'enabled');
insert into ZALBAZO_USER (USER_EMAIL, PASSWORD, ROLE, TEL, ADDRESS, NAME, JOIN_DATE, LAST_LOGIN, HOSPITAL_ID, ENABLED)
values ('nakta@daum.net', '{noop}1234', 'user', 01099991625, '경기 광명시 연서일로17번길 26', '태수', sysdate,null, null, 'enabled');





Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL,name)
values (CONTENT_SEQ.nextval,'혹시 햄스터 보호자 분 계신가요?','간식 추천 좀 해주세요~',to_date('19/08/17','RR/MM/DD'),1,'baba1234@gmail.com', (select name from zalbazo_user where user_email = 'baba1234@gmail.com'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL,name)
values (CONTENT_SEQ.nextval,'왕관앵무도 말을 할 수 있나요?','안녕하세요! 저는 왕관앵무를 기르고 싶은 사람입니다.
그런데 왕관앵무도 다른 앵무새처럼 말을 할 수 있나요?
저는 왕관앵무를 기르면 왕관앵무랑 같이 노래를 부르고 싶습니다.
답변 부탁드려요!!!',to_date('19/08/17','RR/MM/DD'),2,'iceice@gmail.com', (select name from zalbazo_user where user_email = 'iceice@gmail.com'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL,name)
values (CONTENT_SEQ.nextval,'고양이 입양시키려고 하는데 준비물!!','고양이를 드디어 입양시키게되었습니다 이름도 정해놨어요 뇸뇸이 라고 우리 뇸뇸이 입양시키려는데 준비물이 뭐가 필요한지 궁금합니다~~',to_date('19/08/22','RR/MM/DD'),2,'upwyy123@gmail.com'
       , (select name from zalbazo_user where user_email = 'upwyy123@gmail.com'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL,name)
values (CONTENT_SEQ.nextval,'고슴도치용 프라이멀 오리 구매했어요!','호불호 없이 잘먹는다고 소문난 프라이멀 오리를 여기저기 뒤져보다보니 쿠팡에서 판매하길래 드디어 구매했네요.
다음주 화요일에 오지만 그때까지 좀 기다려야죠 뭐 ㅎㅎ 구매 하실 분들 참고해주세요~',to_date('19/08/30','RR/MM/DD'),1,'jjlee@gmail.com'
       , (select name from zalbazo_user where user_email = 'jjlee@gmail.com'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL,name)
values (CONTENT_SEQ.nextval,'강아지 옷 추천 부탁드립니다ㅠㅠㅠ','이제 날이 쌀쌀해져서 강아지 옷을 입힐까 하는데
추위를 많이 타서 몸을 전체 덮을 수 있고 목줄 거는 거 까지 있는걸로 추천해주세요ㅠㅠ!
반려동물을 처음 키우다보니 어디가 좋을지 감이 안 와요ㅠㅠㅠ',to_date('19/08/30','RR/MM/DD'),2,'iceice@gmail.com', (select name from zalbazo_user where user_email = 'iceice@gmail.com'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'강아지 간식 추천해요!','지마켓에서 육포를 샀는데 가격도 적당하고
우리집 애기가 너무 잘먹네요! 한번 도전해보세요~',to_date('19/09/01','RR/MM/DD'),1,'doglover@daum.net', (select name from zalbazo_user where user_email = 'doglover@daum.net'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'우리집 왈왈이가 최고얌','제일 귀여워용 ㅎㅎㅎㅎㅎㅎㅎㅎ 하하하ㅏ하하하하하하 짱짱',to_date('19/09/04','RR/MM/DD'),1,'upwyy123@gmail.com'
       , (select name from zalbazo_user where user_email = 'upwyy123@gmail.com'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'우리집 패럿 보고가세요','처음엔 낯도 많이 가리고 저한테 안왔었는데
요즘은 저한테 애교도 부리네요
너무 귀여워요!!',to_date('19/09/09','RR/MM/DD'),1,'nakta@daum.net', (select name from zalbazo_user where user_email = 'nakta@daum.net'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'고양이 기대수명 30년.. 가능할까요?','고령의 고양이는 거의 신장병으로 생을 마감하는데 신장병을 고칠 수 있는 특효약이 일본에서 개발 되었다는 뉴스를 봤어요.
pkd 판정받은 냥이 데리고 살고 있는데 확실하진 않으나 이런 소식이 있어 기대가 되기도 하네요!',to_date('19/09/13','RR/MM/DD'),1,'jjlee@gmail.com'
       , (select name from zalbazo_user where user_email = 'jjlee@gmail.com'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'구운고기 먹여도될까요???','우리 왈왈이가 생고기를 안먹는데 구운고기를 먹여도 될지 모르겠어요 알려주세용~~',to_date('19/09/12','RR/MM/DD'),2,'upwyy123@gmail.com'
       , (select name from zalbazo_user where user_email = 'upwyy123@gmail.com'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'고슴도치 환절기 보습','방에 가습기로 습도 5-60%를 유지하고 있지만 치원이를 아직 목욕을 안시켜서 각질이...엄청납니다.
아마 이번주에 조금이나마 핸들링에 성공하면 목욕을 시켜보려고 해요 제가 사용하는 호호바 100% 제품 같이 사용해도 괜찮을까요...?',to_date('19/09/14','RR/MM/DD'),2,'jjlee@gmail.com'
       , (select name from zalbazo_user where user_email = 'jjlee@gmail.com'));


Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'인생쓰다...','대체 요즘 제가 뭘하고있는지 ... 잘하고있는지... 정말 많은 생각을 하게되네요',to_date('19/09/16','RR/MM/DD'),1,'upwyy123@gmail.com'
       , (select name from zalbazo_user where user_email = 'upwyy123@gmail.com'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'집사가 되는 길이란..','하... 우리집 뇸뇸이가(고양이) 무럭무럭 잘자랐으면  하는 바람인데제가 잘키우고있는건지 모르겠네요 좀더 공부를 많이해서 좋은 집사가 되겠습니당!
집사님들 화이팅!',to_date('19/09/20','RR/MM/DD'),1,'upwyy123@gmail.com', (select name from zalbazo_user where user_email = 'upwyy123@gmail.com'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'댕댕이분들! 인스타맞팔해요~','강아지를 너무 좋아해서 맨날 인스타로 다른 분들의 댕댕이만 보다가 우리집 댕댕이도 인스타를 시작하고 싶어 만들게 됐습니다!
푸들을 비롯해서 인스타 맞팔해용^>^ @mumu32 입니다~!! 친구해요~!!',to_date('19/09/22','RR/MM/DD'),1,'jjlee@gmail.com', (select name from zalbazo_user where user_email = 'jjlee@gmail.com'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'기다리고 기다리던 캣타워가 왔어요~~','내년에 이사가면 바꿔주리라 마음 먹었지만 유즈가 우다다 할 때마다 심하게 흔들리는게 마음에 걸려 큰맘먹고 지르고 말았습니다.
길고긴 기다림 끝에 오늘 드디어 도착했네요. 조립을 끝내고 보니 생각 이상으로 크기가 어마어마 합니다. 튼튼함도 만족스럽네요. 아직은 탐색하면서 계속 우는데ㅠㅠ 적응이 되면 차차 나아지겠지요ㅠㅠ',to_date('19/09/22','RR/MM/DD'),1
       ,'jjlee@gmail.com', (select name from zalbazo_user where user_email = 'jjlee@gmail.com'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'아기 강아지 이름 추천 받아요','스트릿 출신 믹스 아가입니다 ㅋㅋ',to_date('19/09/27','RR/MM/DD'),1,'baba1234@gmail.com'
       , (select name from zalbazo_user where user_email = 'baba1234@gmail.com'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'우리집 1살 애기 보고가세요~','넘나리 귀엽다!!!! 이름은 투슬리스입니다
래브라도리트리버라 친화력도 좋아요ㅎㅎ
투슬리스야 사랑해!',to_date('19/09/27','RR/MM/DD'),1,'iceice@gmail.com', (select name from zalbazo_user where user_email = 'iceice@gmail.com'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'친칠라 키우시는 분 없으신가요?','친칠라가 제일 좋아하는 간식 뭐 있나요? 궁금합니다!
동물병원에서도 팔까요??',to_date('19/09/28','RR/MM/DD'),2,'iceice@gmail.com', (select name from zalbazo_user where user_email = 'iceice@gmail.com'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'국산 사료는 위험한가요?','아무래도 성분이 별로인가요?',to_date('19/09/29','RR/MM/DD'),2,'baba1234@gmail.com', (select name from zalbazo_user where user_email = 'baba1234@gmail.com'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'반려동물 동반 가능 카페는 사랑입니다','집 근처에 반려동물 동반 가능한 카페가 새로 생겼습니다.
산책하다 보이길래 들어가봤더니 주인분이 강아지 간식도 직접 만들어서 판매도 하시더라구요~~♥
앞으로도 자주 가야겠어요',to_date('19/09/30','RR/MM/DD'),1,'iceice@gmail.com', (select name from zalbazo_user where user_email = 'iceice@gmail.com'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'고양이 몸의 벼룩과 진드기 제거하는 방법',
        '우리 뇸뇸이가 몸에 벼룩과 진드기가 너무 많은데 어떻게 제거해야할지 모르겠어요 너무 가려워하는거같아요~',to_date('19/09/30','RR/MM/DD'),2,'upwyy123@gmail.com'
           , (select name from zalbazo_user where user_email = 'upwyy123@gmail.com'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'마트에서 파는 간식은 안전한 건가요?','종종 사주는데.. 걱정 되네요...',to_date('19/09/30','RR/MM/DD'),2,'baba1234@gmail.com'
       , (select name from zalbazo_user where user_email = 'baba1234@gmail.com'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'너구리랑 라쿤이랑은 다른건가요??','제가 얼마전에 가디언즈오브갤럭시를 봤는데요, 거기에 나오는 로켓라쿤이 너무 귀엽더군요.
라쿤이 미국너구리이고 너구리가 영어로 라쿤인걸로 알고있는데 제가맞게알고있는건가요??
동물박사 잘바조님들 알려주세요.갑자기 궁금해지네요',to_date('19/10/01','RR/MM/DD'),2,'iceice@gmail.com'
       , (select name from zalbazo_user where user_email = 'iceice@gmail.com'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'고양이에게 디퓨저는 많이 해로운가요?','특히 시트러스 향 계열이 위험하다던데.. 이유가 뭔가요?',to_date('19/10/01','RR/MM/DD'),2
       ,'baba1234@gmail.com', (select name from zalbazo_user where user_email = 'baba1234@gmail.com'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'고양이간식 츄르대신 대체할 간식 추천합니다!','''쮸르쮸르''라는 제품입니다.
일본제품 불매운동 하는중이라ㅠㅠㅜ 친구가 대체품을 찾던도중 발견한 간식입니다.
츄르 아니면 안 먹던 친구네 고양이도 맛있게 먹는 걸 보니 맛도 비슷한 거 같아요!!!
맛도 퀄리티도 일본제품에 지지 않는 국산품 애용하려구요. 잘바조 유저님들도 쮸르쮸르 드셔보세요!
광고 아닙니다ㅜㅜㅜㅜ
',to_date('19/10/02','RR/MM/DD'),1,'iceice@gmail.com', (select name from zalbazo_user where user_email = 'iceice@gmail.com'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'혹시 조류 진료도 가능한 병원 있을까요?','저희 할머니가 키우시는 닭이 아픈 것 같아서요.',to_date('19/10/03','RR/MM/DD'),2
       ,'baba1234@gmail.com', (select name from zalbazo_user where user_email = 'baba1234@gmail.com'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'강아지들 평균 몇 시간 정도 놀아주는 게 좋나요?','취준 대학생이고 집에서 강아지를 동생과 저만 돌보는 편이라 미안하게도 놀이시간이 많지 않아요ㅠㅠ
평소에 삑삑이나 노즈워크 30분씩 2번, 밤에 산책 20~30분 하고 있습니다. 놀아주는 방법이나 시간 등 자세히 알려주시면 정말 감사하겠습니다',to_date('19/10/03','RR/MM/DD'),2
       ,'jjlee@gmail.com', (select name from zalbazo_user where user_email = 'jjlee@gmail.com'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'우리집 투슬리스랑 수변공원 다녀왔습니다','밖에 나가기 좋은 날이라 투슬리스가 산책가자고 난리에요 요즘ㅎㅎ
근처 수변공원에 나가서 산책하는데 얼마나 좋아하던지ㅎㅎ
산책나온 멍멍이들도 많고 자주 가야겠습니다!',to_date('19/10/03','RR/MM/DD'),1,'iceice@gmail.com'
       , (select name from zalbazo_user where user_email = 'iceice@gmail.com'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'길냥이를 갑자기 마주치게 된다면, 어떤 걸 줘야 할까요?','편의점에서 파는 캔도 괜찮은가요...',to_date('19/10/04','RR/MM/DD'),2
       ,'baba1234@gmail.com', (select name from zalbazo_user where user_email = 'baba1234@gmail.com'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'강아지가 너무 몸을 긁어요','강아지가 저번주부터 몸을 너무 긁는데 병원에 데려가야 할까요?',to_date('19/10/04','RR/MM/DD'),2,'doglover@daum.net'
       , (select name from zalbazo_user where user_email = 'doglover@daum.net'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'아이를 분양보냈어요','너무너무 허전하네요
잘바조 회원님들은 이런 상황을 어떻게 극복하시나요?',to_date('19/10/05','RR/MM/DD'),1,'ilikecat@gmail.com', (select name from zalbazo_user where user_email = 'ilikecat@gmail.com'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'고양이가 좋아하는 음식은?','곧 아는 사람한테 고양이를 받게 되는데
고양이 사료만 챙겨주면 되나요? 간식도 따로 챙겨줘야 하나요?',to_date('19/10/05','RR/MM/DD'),2,'ilikecat@gmail.com', (select name from zalbazo_user where user_email = 'ilikecat@gmail.com'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'중성화 수술~~!~!','제가 왈왈이 중성화 수술을 시키려고하는데 어디 괜찮은 병원 추천해주실수있나요?? 그리고 비용은 얼마정도 할지 궁금해요 ㅠ~',to_date('19/10/07','RR/MM/DD'),2
       ,'upwyy123@gmail.com', (select name from zalbazo_user where user_email = 'upwyy123@gmail.com'));


Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'왕관앵무 키우고 싶은데 많이 비싼가요?','남들과 다른 동물을 키워보고 싶어서 왕관앵무에 관심이 생겼는데
많이 비싼가요? 그리고 어디서 데려와야 하나요? ',to_date('19/10/07','RR/MM/DD'),2,'bird1234@daum.net', (select name from zalbazo_user where user_email = 'bird1234@daum.net'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'견주 여러분들 이런 경우 있으신가요?','9살 포메와 생활하고 있습니다. 이번 슬개골 탈구 수술하고 퇴원 후 사료를 주는데 전혀 먹지 않습니다. 사료 샘플 수십개를 가져와
기호성 테스트를 했는데 습식 사료만 먹더군요..펠리쿠치나?? 계속 습식 사료를 급여해야 하는지?? 습식 사료를 급여할 때 주의점 이라든지.. 알려주세요!',to_date('19/10/07','RR/MM/DD'),2
       ,'jjlee@gmail.com', (select name from zalbazo_user where user_email = 'jjlee@gmail.com'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'곧 왕관앵무를 만나요','정말 어렵게 어렵게 데려오네요,,
이제 곧 만나는데 너무 기대되요!
앞으로 자주 소식 올리겠습니다.',to_date('19/10/08','RR/MM/DD'),1,'bird1234@daum.net', (select name from zalbazo_user where user_email = 'bird1234@daum.net'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'제가 아이들을 잘 키울수있을까요??','아직 취업도 안했는데 강아지와 고양이를 키우고있습니다...
제가 능력도 안되면서 애들을 키우고있는게 아닌지 문득 생각이 드는군요.',to_date('19/10/08','RR/MM/DD'),1,'upwyy123@gmail.com'
       , (select name from zalbazo_user where user_email = 'upwyy123@gmail.com'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'노견 강아지 사료 추천합니다~','로얄캐닌에서 갈아탔어요~ 정보 원하시는 분은 댓글!',to_date('19/10/08','RR/MM/DD'),1
       ,'baba1234@gmail.com', (select name from zalbazo_user where user_email = 'baba1234@gmail.com'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'비글이 정말 소문만큼 지랄견인가요?','생긴게 너무 제 스타일이라서 키우고 싶은데
마당도 없는 집인데 좀 걱정되긴 하네요.
정말 소문만큼 지랄견인가요? ',to_date('19/10/10','RR/MM/DD'),2,'puppylover@naver.com', (select name from zalbazo_user where user_email = 'puppylover@naver.com'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'라쿤하고 수달중에 뭐가 더 키우기 쉽나요?','라쿤하고 수달중에 집에서 키우기 더 쉬운, 쉽게 말해 활동성이 좀더 적고 사람을 잘 따르는 동물은 뭐에요?
광고 사절합니다!',to_date('19/10/10','RR/MM/DD'),2,'iceice@gmail.com', (select name from zalbazo_user where user_email = 'iceice@gmail.com'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'서초구 병원 추천해요!','최근에 우리 실버가 아파서 아무 병원이나 데려갔는데
너무 친절하고 실력도 좋아서 추천하고 싶어요!
서초구에 위치한 진진동물병원이구요,, 병원 검색하면 나올거에요!
시설도 깨끗하고 서비스도 너무 좋았어요~
',to_date('19/10/11','RR/MM/DD'),1,'puppylover@naver.com', (select name from zalbazo_user where user_email = 'puppylover@naver.com'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'와 이건 진짜 꿀템 진짜진짜 안보면 후회','애들이 진짜 난리입니다 편하게 밥먹일수있어요',to_date('19/10/11','RR/MM/DD'),1
       ,'upwyy123@gmail.com', (select name from zalbazo_user where user_email = 'upwyy123@gmail.com'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'패럿 잘 치료하는 병원 추천해주세요','패럿을 취급 안하는 병원이 많네요
패럿 치료 가능한 좋은 병원 추천 부탁드립니다.',to_date('19/10/12','RR/MM/DD'),2,'nakta@daum.net', (select name from zalbazo_user where user_email = 'nakta@daum.net'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'강아지 심리 아시는 분 계십니까??','우리 아롱이는 항상 제 옆에 와서 등돌리고 앉아있어요 삐친건 아니에요. 꼭 옆에 붙어서 저렇게 앉아있는데
왜 그런지 아시는 분 계세요?',to_date('19/10/13','RR/MM/DD'),2,'jjlee@gmail.com', (select name from zalbazo_user where user_email = 'jjlee@gmail.com'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'코숏 아기 길냥이 임보중입니다.','너무너무 귀여운데 데려가실 분? ㅎㅎ',to_date('19/10/13','RR/MM/DD'),1
       ,'baba1234@gmail.com', (select name from zalbazo_user where user_email = 'baba1234@gmail.com'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'에휴 강아지 배변훈련 도와주세요','왈왈이가 누굴닮았는지 진짜 똥을 아무곳에서나 싸지르고 다녀요. 요즘그것때문에 스트레스가 이만저만이 아니네요 배변훈련 어떻게 시켜야할까요??
처음엔 귀여웠는데 점점 얄밉네요',to_date('19/10/13','RR/MM/DD'),2,'upwyy123@gmail.com', (select name from zalbazo_user where user_email = 'upwyy123@gmail.com'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'잘바조 좋네요ㅎ 검색도 잘되고','덕분에 예약도 간편하게 할 수 있게 됐네요',to_date('19/10/14','RR/MM/DD'),1,'baba1234@gmail.com'
       , (select name from zalbazo_user where user_email = 'baba1234@gmail.com'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL, name)
values (CONTENT_SEQ.nextval,'저희 냥이는 캣파푸 필렛 기호성 대박이에요ㅋㅋ','오늘 캣파푸 필렛 하나 까서 줬는데..
이브는 아무거나 가리지 않고 먹는 아이인걸 감안해도 환장하고 먹더라구요ㅋㅋ 담달에는 무조건 캣파푸 필렛 사서 쟁여야겠습니다',to_date('19/10/15','RR/MM/DD')
       ,1,'jjlee@gmail.com', (select name from zalbazo_user where user_email = 'jjlee@gmail.com'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL,name)
values (CONTENT_SEQ.nextval,'동물자유연대 글들을 보니 마음이 아프네요ㅠㅠ','오전에 동물자유연대에서 올린 유기견 실태 글을 읽었는데 마음이 아프네요ㅠㅠㅠ
저렇게 천사같은 아이들을 버리다니 동물 유기하는 사람들은 정말 천벌 받아야해요',to_date('19/10/16','RR/MM/DD'),1,'iceice@gmail.com','아이스베어');

Insert into ZALBAZO.CONTENT(CONTENT_ID, TITLE, BODY, CREATED_DATE,CATEGORY_ID,USER_EMAIL,name)
values (CONTENT_SEQ.nextval,'강아지 산책 훈련 방법 도와주세요','강아지가 목줄을 너무 불편해 하네요. 목줄에 익숙하게 산책 시킬 수 있는 방법이 있을까요?',to_date('19/10/18','RR/MM/DD'),2,'jjlee@gmail.com',
        (select name from zalbazo_user where user_email = 'jjlee@gmail.com'));

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,CATEGORY_ID,USER_EMAIL,name)
values (CONTENT_SEQ.nextval,'강아지들 평균 몇 시간 정도 놀아주는 게 좋나요?','오전에 동물자유연대에서 올린 유기견 실태 글을 읽었는데 마음이 아프네요ㅠㅠㅠ
저렇게 천사같은 아이들을 버리다니 동물 유기하는 사람들은 정말 천벌 받아야해요',to_date('19/10/08','RR/MM/DD'),2,'scienceos@daum.net',(select name from zalbazo_user where user_email = 'scienceos@daum.net'));



commit;

