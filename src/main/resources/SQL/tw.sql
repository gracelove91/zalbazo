Insert into ZALBAZO.ZALBAZO_USER (USER_EMAIL,PASSWORD,ROLE,TEL,ADDRESS,NAME,JOIN_DATE,LAST_LOGIN,ENABLED,EMAIL_AUTH_KEY,HOSPITAL_ID) values ('upwyy123@gmail.com','1234','user','444','서울특별시 동작구 동작대로 121-4,(사당동)',null,sysdate,null,'enabled',null,null);

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL) values (CONTENT_SEQ.nextval,'구운고기 먹여도될까요???','우리 왈왈이가 생고기를 안먹는데 구운고기를 먹여도 될지 모르겠어요

알려주세용~~',sysdate,sysdate,2,'upwyy123@gmail.com');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL) values (CONTENT_SEQ.nextval,'고양이 입양시키려고 하는데 준비물!!','고양이를 드디어 입양시키게되었습니다

이름도 정해놨어요 뇸뇸이 라고

우리 뇸뇸이 입양시키려는데 준비물이 뭐가 필요한지 궁금합니다~~',sysdate,sysdate,2,'upwyy123@gmail.com');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL) values (CONTENT_SEQ.nextval,'고양이 몸의 벼룩과 진드기 제거하는 방법','우리 뇸뇸이가 몸에 벼룩과 진드기가 너무 많은데 어떻게 제거해야할지 모르겠어요

너무 가려워하는거같아요~',sysdate,sysdate,2,'upwyy123@gmail.com');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL) values (CONTENT_SEQ.nextval,'에휴 강아지 배변훈련 도와주세요','왈왈이가 누굴닮았는지 진짜 똥을 아무곳에서나 싸지르고 다녀요

요즘그것때문에 스트레스가 이만저만이 아니네요 배변훈련 어떻게 시켜야할까요??

처음엔 귀여웠는데 점점 얄밉네요',sysdate,sysdate,2,'upwyy123@gmail.com');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL) values (CONTENT_SEQ.nextval,'중성화 수술~~!~!','제가 왈왈이 중성화 수술을 시키려고하는데 어디 괜찮은 병원 추천해주실수있나요??

그리고 비용은 얼마정도 할지 궁금해요 ㅠ~',sysdate,sysdate,2,'upwyy123@gmail.com');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL) values (CONTENT_SEQ.nextval,'우리집 왈왈이가 최고얌','제일 귀여워용 ㅎㅎㅎㅎㅎㅎㅎㅎ 하하하ㅏ하하하하하하 짱짱',sysdate,sysdate,1,'upwyy123@gmail.com');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL) values (CONTENT_SEQ.nextval,'와 이건 진짜 꿀템 진짜진짜 안보면 후회','애들이 진짜 난리입니다 편하게 밥먹일수있어요',sysdate,sysdate,1,'upwyy123@gmail.com');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL) values (CONTENT_SEQ.nextval,'제가 아이들을 잘 키울수있을까요??','아직 취업도 안했는데 강아지와 고양이를 키우고있습니다...

제가 능력도 안되면서 애들을 키우고있는게 아닌지 문득 생각이 드는군요.',sysdate,sysdate,1,'upwyy123@gmail.com');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL) values (CONTENT_SEQ.nextval,'인생쓰다...','대체 요즘 제가 뭘하고있는지 ... 잘하고있는지... 정말 많은 생각을 하게되네요',sysdate,sysdate,1,'upwyy123@gmail.com');
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL) values (CONTENT_SEQ.nextval,'집사가 되는 길이란..','하... 우리집 뇸뇸이가(고양이) 무럭무럭 잘자랐으면  하는 바람인데

제가 잘키우고있는건지 모르겠네요

좀더 공부를 많이해서 좋은 집사가 되겠습니당!
집사님들 화이팅!',sysdate,sysdate,1,'upwyy123@gmail.com');


Insert into ZALBAZO.ANIMAL (ANIMAL_ID,TYPE,SEX,WEIGHT,AGE,ANAME,NOTE,LAST_TREAT_DATE,CREATED_DATE,UPDATED_DATE,USER_EMAIL) values (ANIMAL_SEQ.nextval,'고양이','남',4,1,'뇸뇸이','너무 이쁨',sysdate,sysdate,sysdate,'upwyy123@gmail.com');
Insert into ZALBAZO.ANIMAL (ANIMAL_ID,TYPE,SEX,WEIGHT,AGE,ANAME,NOTE,LAST_TREAT_DATE,CREATED_DATE,UPDATED_DATE,USER_EMAIL) values (ANIMAL_SEQ.nextval,'강아지','남',6,1,'왈왈이','귀여움',sysdate,sysdate,sysdate,'upwyy123@gmail.com');

Insert into ZALBAZO.RESERVE (RESERVE_ID,NOTE,RDATE,ANIMAL_ID,HOSPITAL_ID,STATUS,USER_EMAIL) values (RESERVE_SEQ.nextval,'우리아이 잘부탁드려요',to_date('19/10/18','RR/MM/DD'),13,2,'진료 전','upwyy123@gmail.com');

commit;