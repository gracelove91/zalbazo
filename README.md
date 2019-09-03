# zalbazo

## 0901
---
부트스트랩과 제이쿼리 의존성을 메이븐으로 관리하기 위해 pom.xml 에 webjar를 추가하고, 
정적 컨텐츠로 사용하기위해 servlet-context.xml 에 `v=<mvc:resources mapping="/webjars/**" location="/webjars/"/> ` 를 추가했습니다.

부트스트랩과 제이쿼리를 사용하기 위해 html에 코드를 추가합니다.
````html
<head>
  <link href="webjars/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
  
  ...

</body>
<script src="webjars/jquery/3.4.1/jquery.min.js"></script>
<script src="webjars/bootstrap/3.4.1/js/bootstrap.min.js"></script>
````
