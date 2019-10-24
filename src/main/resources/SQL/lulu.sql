--------------------------------------------------------

--  파일이 생성됨 - 수요일-10월-16-2019

--------------------------------------------------------

commit;

-- 유저

Insert into ZALBAZO.ZALBAZO_USER (USER_EMAIL,PASSWORD,ROLE,TEL,ADDRESS,NAME,JOIN_DATE,LAST_LOGIN,ENABLED,EMAIL_AUTH_KEY,HOSPITAL_ID) values ('iceice@gmail.com','{noop}1234','user','01012340987','서울시 서초구','아이스베어',to_date('19/10/14','RR/MM/DD'),to_date('19/10/14','RR/MM/DD'),'enabled',null,null);



-- 동물등록

Insert into ZALBAZO.ANIMAL (ANIMAL_ID,TYPE,SEX,WEIGHT,AGE,ANAME,NOTE,LAST_TREAT_DATE,CREATED_DATE,UPDATED_DATE,USER_EMAIL) values (2,'래브라도리트리버','중성',13,2,'투슬리스','눈이 참 맑습니다',to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),'iceice@gmail.com');

Insert into ZALBAZO.ANIMAL (ANIMAL_ID,TYPE,SEX,WEIGHT,AGE,ANAME,NOTE,LAST_TREAT_DATE,CREATED_DATE,UPDATED_DATE,USER_EMAIL) values (3,'그리즐리베어','남',30,2,'그리즐리','미국에서 온 그리즐리 베어입니다',to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),'iceice@gmail.com');



-- 예약

Insert into ZALBAZO.RESERVE (RESERVE_ID,NOTE,RDATE,ANIMAL_ID,HOSPITAL_ID,STATUS,USER_EMAIL) values (6,'투슬리스 왼쪽 발에 상처가 나서 드레싱 부탁드려요!',to_date('19/10/25','RR/MM/DD'),2,1,'진료 전','iceice@gmail.com');

Insert into ZALBAZO.RESERVE (RESERVE_ID,NOTE,RDATE,ANIMAL_ID,HOSPITAL_ID,STATUS,USER_EMAIL) values (7,null,to_date('19/10/29','RR/MM/DD'),2,1,'진료 전','iceice@gmail.com');

Insert into ZALBAZO.RESERVE (RESERVE_ID,NOTE,RDATE,ANIMAL_ID,HOSPITAL_ID,STATUS,USER_EMAIL) values (8,'진료 끝나면 전화주세요!',to_date('19/10/31','RR/MM/DD'),2,1,'진료 전','iceice@gmail.com');



-- 게시판(커뮤, 지식동)

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL) values (1,'왕관앵무도 말을 할 수 있나요?','안녕하세요! 저는 왕관앵무를 기르고 싶은 사람입니다.

그런데 왕관앵무도 다른 앵무새처럼 말을 할 수 있나요?

저는 왕관앵무를 기르면 왕관앵무랑 같이 노래를 부르고 싶습니다.

답변 부탁드려요!!!',to_date('19/09/05','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),2,'iceice@gmail.com');

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL) values (14,'친칠라 키우시는 분 없으신가요?','친칠라가 제일 좋아하는 간식 뭐 있나요? 궁금합니다!

동물병원에서도 팔까요??',to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),2,'iceice@gmail.com');

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL) values (15,'라쿤하고 수달중에 뭐가 더 키우기 쉽나요?','라쿤하고 수달중에 집에서 키우기 더 쉬운, 쉽게 말해 활동성이 좀더 적고 사람을 잘 따르는 동물은 뭐에요?

광고 사절합니다!',to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),2,'iceice@gmail.com');

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL) values (16,'우리집 1살 애기 보고가세요~','넘나리 귀엽다!!!! 이름은 투슬리스입니다

래브라도리트리버라 친화력도 좋아요ㅎㅎ

투슬리스야 사랑해!',to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),1,'iceice@gmail.com');

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL) values (17,'동물자유연대 글들을 보니 마음이 아프네요ㅠㅠ','오전에 동물자유연대에서 올린 유기견 실태 글을 읽었는데 마음이 아프네요ㅠㅠㅠ

저렇게 천사같은 아이들을 버리다니 동물 유기하는 사람들은 정말 천벌 받아야해요',to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),1,'iceice@gmail.com');

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL) values (22,'반려동물 동반 가능 카페는 사랑입니다','집 근처에 반려동물 동반 가능한 카페가 새로 생겼습니다.

산책하다 보이길래 들어가봤더니 주인분이 강아지 간식도 직접 만들어서 판매도 하시더라구요~~♥



앞으로도 자주 가야겠어요



',to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),1,'iceice@gmail.com');

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL) values (19,'너구리랑 라쿤이랑은 다른건가요??','제가 얼마전에 가디언즈오브갤럭시를 봤는데요, 거기에 나오는 로켓라쿤이 너무 귀엽더군요.



라쿤이 미국너구리이고 너구리가 영어로 라쿤인걸로 알고있는데 제가맞게알고있는건가요??

동물박사 잘바조님들 알려주세요.갑자기 궁금해지네요',to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),2,'iceice@gmail.com');

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL) values (20,'고양이간식 츄르대신 대체할 간식 추천합니다!','''쮸르쮸르''라는 제품입니다.

일본제품 불매운동 하는중이라ㅠㅠㅜ 친구가 대체품을 찾던도중 발견한 간식입니다.

츄르 아니면 안 먹던 친구네 고양이도 맛있게 먹는 걸 보니 맛도 비슷한 거 같아요!!!



맛도 퀄리티도 일본제품에 지지 않는 국산품 애용하려구요. 잘바조 유저님들도 쮸르쮸르 드셔보세요!

광고 아닙니다ㅜㅜㅜㅜ

',to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),1,'iceice@gmail.com');

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL) values (21,'강아지 옷 추천 부탁드립니다ㅠㅠㅠ','이제 날이 쌀쌀해져서 강아지 옷을 입힐까 하는데

추위를 많이 타서 몸을 전체 덮을 수 있고 목줄 거는 거 까지 있는걸로 추천해주세요ㅠㅠ!

반려동물을 처음 키우다보니 어디가 좋을지 감이 안 와요ㅠㅠㅠ',to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),2,'iceice@gmail.com');

Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL) values (23,'우리집 투슬리스랑 수변공원 다녀왔습니다','밖에 나가기 좋은 날이라 투슬리스가 산책가자고 난리에요 요즘ㅎㅎ

근처 수변공원에 나가서 산책하는데 얼마나 좋아하던지ㅎㅎ

산책나온 멍멍이들도 많고 자주 가야겠습니다!',to_date('19/10/16','RR/MM/DD'),to_date('19/10/16','RR/MM/DD'),1,'iceice@gmail.com');