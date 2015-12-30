-- 순서대로 생성해야 에러 안나용!


CREATE TABLE ACCOUNT(	
  m_id NUMBER(5) PRIMARY KEY,
  m_mail VARCHAR2(100),
  m_gender VARCHAR2(10),
  m_pw VARCHAR2(50),
  m_birth DATE,
  m_level VARCHAR2(10),
  m_joindate DATE
);

CREATE TABLE PROFILE(
  profile_id NUMBER(5) PRIMARY KEY,
  m_id NUMBER(5) REFERENCES ACCOUNT(m_id),
  m_nickname VARCHAR2(50),
  m_pic VARCHAR2(100),
  m_introduce VARCHAR2(100),
  m_web1 VARCHAR2(100),
  m_web2 VARCHAR2(100),
  m_web3 VARCHAR2(100)
);

CREATE TABLE CATEGORY(
  category_id NUMBER(5) PRIMARY KEY,
  category_name VARCHAR2(50)
)

CREATE TABLE ARTICLE(
  article_id NUMBER(5) PRIMARY KEY,
  m_id NUMBER(5) REFERENCES ACCOUNT(m_id),
  article_title VARCHAR2(100),
  article_subtitle VARCHAR2(300),
  article_view NUMBER(10),
  article_like NUMBER(10),
  article_share NUMBER(10),
  article_reply NUMBER(10),
  pic_id NUMBER(5),
  category_id NUMBER(5) REFERENCES CATEGORY(category_id),
  article_date DATE
);

CREATE TABLE PICTURE(
  pic_id NUMBER(5) PRIMARY KEY,
  article_id NUMBER(5) REFERENCES ARTICLE(article_id),
  pic_url VARCHAR2(100),
  pic_text VARCHAR2(1000),
  pic_order NUMBER(5)
);

ALTER TABLE ARTICLE ADD CONSTRAINT pic_id_fk FOREIGN KEY(pic_id) 
REFERENCES PICTURE(pic_id); 

CREATE TABLE REPLY(
  reply_id NUMBER(5) PRIMARY KEY,
  m_id NUMBER(5) REFERENCES ACCOUNT(m_id),
  pic_id NUMBER(5) REFERENCES PICTURE(pic_id),
  article_id NUMBER(5) REFERENCES ARTICLE(article_id),
  reply_like NUMBER(5),
  reply_text VARCHAR2(500),
  reply_date DATE
);

CREATE TABLE RE_REPLY(
  rereply_id NUMBER(5) PRIMARY KEY,
  m_id NUMBER(5) REFERENCES ACCOUNT(m_id),
  reply_id NUMBER(5) REFERENCES REPLY(reply_id),
  rereply_text VARCHAR2(500),
  rereply_date DATE
);

CREATE SEQUENCE m_id_seq;
CREATE SEQUENCE profile_id_seq;
CREATE SEQUENCE category_id_seq;
CREATE SEQUENCE article_id_seq;
CREATE SEQUENCE pic_id_seq;
CREATE SEQUENCE reply_id_seq;
CREATE SEQUENCE rereply_id_seq;


