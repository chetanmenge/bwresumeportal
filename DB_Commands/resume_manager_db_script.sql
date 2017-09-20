DROP DATABASE IF EXISTS resume_portal_db;

CREATE DATABASE resume_portal_db;

USE resume_manager;

DROP TABLE IF EXISTS skill;

CREATE TABLE skill (
  skill_id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(200) NOT NULL,
  PRIMARY KEY (skill_id)
) ENGINE=INNODB;

DROP TABLE IF EXISTS user;

CREATE TABLE user (
  user_key BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id VARCHAR(50) NOT NULL,
  first_name VARCHAR(200) NOT NULL,
  middle_name VARCHAR(200),
  last_name VARCHAR(200) NOT NULL,
  upload_timestamp TIMESTAMP NOT NULL,
  PRIMARY KEY (user_key)
)ENGINE=INNODB;

DROP TABLE IF EXISTS resume;

CREATE TABLE resume (
  resume_id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(200) NOT NULL,
  file_path VARCHAR(200) NOT NULL,
  upload_timestamp TIMESTAMP NOT NULL,
  user_key BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (resume_id),
  FOREIGN KEY (user_key) REFERENCES user(user_key)
  ON UPDATE CASCADE ON DELETE RESTRICT
)ENGINE=INNODB;

DROP TABLE IF EXISTS resume_skill;

CREATE TABLE resume_skill (
  skill_id BIGINT(20) UNSIGNED NOT NULL,
  resume_id BIGINT(20) UNSIGNED NOT NULL,
  FOREIGN KEY (skill_id) REFERENCES skill(skill_id)
  ON UPDATE CASCADE ON DELETE RESTRICT,
  FOREIGN KEY (resume_id) REFERENCES resume(resume_id)
  ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=INNODB;


#INSERT INTO skill(name) VALUES ('Java');
#INSERT INTO user(user_id,first_name,middle_name,last_name) VALUES ('dummyid','dummyfirst','dummymiddle','dummylast');
