# koitt3JDP

한국아이티인재개발원 3조 개발문서입니다. :rocket:

팀원: 송민석, 나동수, 이준희, 조미선



### Coding Guide

----

* **File naming**: snake_case (<span style="color:red">**html, css , jsp**</span> 파일만 해당합니다. )
* **default naming**: CamelCase (java class, method, javascript ...... )



 :star: <u>코드는 각자 브랜치에서 작업해주세요!!!</u>

 :star: ​master로 바로 push를 자제합시다!!



#### Method 규칙

1. DAO 클래스에 선언하는 메소드명은 DML(**select, insert, delete, update**)을 메소드명에 포함시킵니다.

   (https://www.oracle.com/java/technologies/dataaccessobject.html 참고)

   <span style="color:green">void <u>**insert**</u>Member(MemberDto mDto);</span>

   ​       List<MemberDto> <u>**select**</u>Member();



2. Service 인터페이스에 선언하는 메소드명은 수행하는 기능을 메소드명에 포함시킵니다.

   <span style="color:green">void addMember(MemberDto mDto);</span>

   ​      List<MemberDto> getAllMember();            

####  Contoller path 규칙

모든 경로는 폴더(패키지)이름으로 시작합니다

예) localhost:8181/**event**/.. **/mypage/** **/membership/**



* gitkeep 파일은 폴더보존용이니 폴더에 다른 파일 있으면 지우셔도 됩니다
* 파일 위에 작성자 주석으로 입력해주시면 감사하겠습니다.




### Structure

-----

#### Directory

```java
koitt03_JDP/src
    /test
    /main
	/java
	    /com
    		/koitt
    		    /tim
    			/dto
    			/dao
    			/controller
    			/service
	/resources
	    /mapper
	/webapp
	    /resources
		/css
		/js
		/images
		/WEB-INF
		    ㄴweb.xml
		    /spring
			/appServlet
			    ㄴ servlet-context.xml
			    ㄴroot-context.xml
		    /views
 ㄴpom.xml                    

```

#### Data

* DTO - DAO - Service - ServiceImpl - Contoller 구조 사용합니다.

  * DTO : **class**

  * DAO : **interface**

     :arrow_backward: ?Mapper.xml   (*경로는 src/main/resources/mapper 입니다.*)

  * Service: **interface**

     :arrow_backward: ServiceImpl : **class**

  * Controller: **class**



### Devlopment Environment

-----

* 개발 OS: Windows7, Windows10
* 개발 언어: Java , JavaScript, JSP, HTML5 , CSS ..
* 개발 IDE: Eclipse 2019, Intellij
* DB: Oracle database 11g
* 개발/빌드 도구  : JDK 1.8, Spring Framework, Sql Developer, Maven



### Setting Guide

----

> 사용 라이브러리

* **Hikari CP**: DB Connection Pool 라이브러리

* **Oracle ojdbc6**: Oracle jdbc 라이브러리

* **MyBatis**: DB Mapping 라이브러리

* **Spring Framwork**: 5.2.4 RELEASE

* **Jackson** : JSON 데이터 구조 처리 라이브러리

* **logback**: log 라이브러리 ( System.out.println() 대신 쓰는걸 권장함. logger.debug() )



>  pom.xml 설정

```xml
<!-- 스프링 프레임워크 -->
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-core</artifactId>
    <version>5.2.4.RELEASE</version>
</dependency>

<!-- 서블릿 -->
<dependency>
    <groupId>javax.servlet</groupId>
    <artifactId>javax.servlet-api</artifactId>
    <version>3.1.0</version>
    <scope>provided</scope>
</dependency>

<!-- JSP -->
<dependency>
    <groupId>javax.servlet.jsp</groupId>
    <artifactId>javax.servlet.jsp-api</artifactId>
    <version>2.3.3</version>
    <scope>provided</scope>
</dependency>

<!--JUnit -->
<dependency>
    <groupId>junit</groupId>
    <artifactId>junit</artifactId>
    <version>4.12</version>
    <scope>test</scope>
</dependency>

<!-- maven complier plugin -->
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-compiler-plugin</artifactId>
    <version>3.8.1</version>
    <configuration>
        <source>${java-version}</source>
        <target>${java-version}</target>
        <compilerArgument>-Xlint:all</compilerArgument>
        <showWarnings>true</showWarnings>
        <showDeprecation>true</showDeprecation>
    </configuration>
</plugin>

<!-- logback -->
<dependency>
    <groupId>ch.qos.logback</groupId>
    <artifactId>logback-classic</artifactId>
    <version>1.2.3</version>
</dependency>

<dependency>
    <groupId>org.slf4j</groupId>
    <artifactId>jcl-over-slf4j</artifactId>
    <version>1.7.25</version>
</dependency>

<!-- spring-context에서는 기본적으로 commons-logging 라이브러리를 사용하고 있으므로
Logback 라이브러리로 대체하기 위해서는 spring-context 라이브러리를 추가할 때
commons-logging 라이브러리를 제외 시켜야 합니다.
JCL을 제외시켰기 때문에 기존에 JCL을 통해 로그를 남기던 코드들은 에러를 발생 시킬 것입니다.
그래서 필요한 것이 jcl-over-slf4j 라이브러리이며, 일종의 다리 역할을 합니다.
실제로는 SLF4J을 구현한 logback-classic 라이브러리가 로그를 남기게 됩니다.
(출처: https://victorydntmd.tistory.com/173)
-->


<!------------------------------------------->
<!-- connection pool lib -->
<dependency>
    <groupId>com.zaxxer</groupId>
    <artifactId>HikariCP</artifactId>
    <version>3.4.5</version>
</dependency>
<!-- Mybatis -->
<dependency>
    <groupId>org.mybatis</groupId>
    <artifactId>mybatis</artifactId>
    <version>3.5.4</version>
</dependency>

<dependency>
    <groupId>org.mybatis</groupId>
    <artifactId>mybatis-spring</artifactId>
    <version>2.0.4</version>
</dependency>

<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-jdbc</artifactId>
    <version>5.2.4.RELEASE</version>
</dependency>

<!-- ojdbc -->

<dependency>
    <groupId>com.oracle</groupId>
    <artifactId>ojdbc6</artifactId>
    <version>12.1.0.2</version>
</dependency>

<repositories>
    <repository>
        <id>oracle</id>
        <url>http://maven.jahia.org/maven2</url>
    </repository>
</repositories>


<!-- json 처리용 -->
<dependency>
    <groupId>com.fasterxml.jackson.core</groupId>
    <artifactId>jackson-databind</artifactId>
    <version>2.10.2</version>
</dependency>

```
