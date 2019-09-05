# zalbazo

## 0901
---
부트스트랩과 제이쿼리 의존성을 메이븐으로 관리하기 위해 pom.xml 에 webjar를 추가하고, 
정적 컨텐츠로 사용하기위해 servlet-context.xml 에 `v=<mvc:resources mapping="/webjars/**" location="/webjars/"/> ` 를 추가했습니다.

부트스트랩과 제이쿼리를 사용하기 위해 html에 코드를 추가합니다.
````html
<head>
  <link href="webjars/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
  
  ...

</body>
<script src="webjars/jquery/3.4.1/jquery.min.js"></script>
<script src="webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
````


## 0903
---
### CATEGORY TABLE
게시글의 카테고리를 나누기 위해,
데이터베이스 CATEGORY 테이블에 다음과 같은 값을 집어넣었습니다.

```SQL
insert into category(id, name) values(1, 'community');
insert into category(id, name) values(2, 'jisik');
insert into category(id, name) values(3, 'review');
insert into category(id, name) values(4, 'hqna');

```
### LABEL TABLE
병원의 라벨을 지정하기 위해
데이터베이스 LABEL 테이블에 다음과 같은 값을 집어넣었습니다.

```SQL
insert into label (code, name) values( 1, '24hr');
insert into label (code, name) values( 2, 'beauty');
insert into label (code, name) values( 3, 'parking');
insert into label (code, name) values( 4, 'rare');
```

## 0905
---
### src / main / resources / **mybatis-config.xml**
자바빈의 네이밍규칙인 카멜케이스와, 데이터베이스의 테이블 네이밍규칙인 언더스코어케이스를 서로 매핑시켜주기 위해 다음과 같은 설정파일 추가함.
```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE configuration
        PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>
    <settings>
        <setting name="mapUnderscoreToCamelCase" value="true"/>
    </settings>

</configuration>
```

### src / main  / java / kr / zalbazo / config / **DBConfig.java**
위 설정파일을 적용하기 위해 `SqlSessionFactory()`메서드 내에 다음과 같은 코드를 삽입한다.


`Resource configLocation =  new PathMatchingResourcePatternResolver().getResource("classpath:mybatis-config.xml");`

```java
    @Bean
    public SqlSessionFactory sqlSessionFactory() throws Exception {
        SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();
        sqlSessionFactory.setDataSource(dataSource());
        Resource configLocation =  new PathMatchingResourcePatternResolver().getResource("classpath:mybatis-config.xml");
        sqlSessionFactory.setConfigLocation(configLocation);
        
        return sqlSessionFactory.getObject();
    }
```
