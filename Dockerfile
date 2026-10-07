# Java 11 + Tomcat 9 공식 이미지
FROM tomcat:9.0-jdk11

# 한국 시간
ENV TZ=Asia/Seoul

# 기존과 같이 8081 포트 사용
RUN sed -i 's/port="8080"/port="8081"/' /usr/local/tomcat/conf/server.xml

# 기본 앱 제거 후 내 war를 ROOT로 배치
RUN rm -rf /usr/local/tomcat/webapps/*
COPY target/hello-1.0.0.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8081
CMD ["catalina.sh", "run"]