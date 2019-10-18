/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Zozo
 * Created: Oct 18, 2019
 */

CREATE TABLE am_University (
        uni_no int NOT NULL,
	uni_name varchar(25),
	uni_city varchar(25),
	
        PRIMARY KEY(uni_no)
);

CREATE TABLE am_Course (
	crs_id varchar(6) NOT NULL,
	crs_name varchar(25),
	
	PRIMARY KEY(crs_id)
);

CREATE TABLE am_Module (
	mod_id varchar(6) NOT NULL,
	mod_name varchar(25),
	mod_pre varchar(6),
	
	PRIMARY KEY(mod_id)
);

CREATE TABLE am_Student (
	stu_id int NOT NULL,
	stu_name varchar(25),
        stu_surname varchar(25),
	stu_type varchar(25),
	
	PRIMARY KEY(stu_id)
);

CREATE TABLE am_Lecture (
	lec_id int NOT NULL,
	lec_name varchar(25),
	
	PRIMARY KEY(lec_id)
);

CREATE TABLE am_Assessment (
	ass_stu_id int NOT NULL,
	ass_mod_id varchar(6) NOT NULL,
	ass_name varchar(25),
	ass_mak int,
	
	PRIMARY KEY(ass_stu_id, ass_mod_id),
	FOREIGN KEY (ass_stu_id) REFERENCES am_Student(stu_id),
	FOREIGN KEY (ass_mod_id) REFERENCES am_Module(mod_id)
);

CREATE TABLE am_ModuleRegistration (
	mrg_semester varchar(25) NOT NULL,
	mrg_stu_id int NOT NULL,
	mrg_mod_id varchar(6) NOT NULL,
	
	PRIMARY KEY(mrg_semester, mrg_stu_id, mrg_mod_id),
	FOREIGN KEY (mrg_stu_id) REFERENCES am_Student(stu_id),
	FOREIGN KEY (mrg_mod_id) REFERENCES am_Module(mod_id)
);

CREATE TABLE am_CourseRegistration(
	crg_year int NOT NULL,
	crg_crs_id varchar(6) NOT NULL,
	crg_stu_id int NOT NULL,
	
	PRIMARY KEY(crg_year, crg_crs_id, crg_stu_id),
	FOREIGN KEY (crg_stu_id) REFERENCES am_Student(stu_id),
	FOREIGN KEY (crg_crs_id) REFERENCES am_Course(crs_id)
);

CREATE TABLE am_Delivers (
	dev_semester varchar(25) NOT NULL,
	dev_lec_id int NOT NULL,
	dev_mod_id varchar(6) NOT NULL,
	
	PRIMARY KEY(dev_semester, dev_lec_id, dev_mod_id),
	FOREIGN KEY (dev_lec_id) REFERENCES am_Lecture(lec_id),
	FOREIGN KEY (dev_mod_id) REFERENCES am_Module(mod_id)
);

-- The following are Data insertions into the tables to form dummy data.
-- Data Entry


-- University
INSERT INTO am_University
VALUES (1, 'Abel Moremi University', 'Gaborone');

-- Course
INSERT INTO am_Course
VALUES ('BSC208', 'Computing with Finance');

INSERT INTO am_Course
VALUES ('BSC230', 'Computer Science');

INSERT INTO am_Course
VALUES ('BSC204', 'Infomation Technology');

-- Module
INSERT INTO am_Module
VALUES ('CSI141', 'Intro to programming', 'N/A');

INSERT INTO am_Module
VALUES ('CSI247', 'Data Structures', 'CSI142');

INSERT INTO am_Module
VALUES ('CSI262', 'Database I', 'CSI247');

INSERT INTO am_Module
VALUES ('CSI323', 'Algorithms', 'CSI247');

-- Student
INSERT INTO am_Student
VALUES (201503625, 'Abel' ,'Moremi', 'Undergraduate');

INSERT INTO am_Student
VALUES (201603665, 'Dell' ,'Keyboard', 'Undergraduate');

INSERT INTO am_Student
VALUES (200602627, 'Donald' ,'Trump', 'Undergraduate');

INSERT INTO am_Student
VALUES (201903225, 'Dave', 'Chappell', 'PostGraduate');

INSERT INTO am_Student
VALUES (201003605, 'Steve', 'Jobs', 'PostGraduate');

INSERT INTO am_Student
VALUES (200402447, 'Trevor', 'Noah', 'Undergraduate');

-- Lecture
INSERT INTO am_Lecture
VALUES (201203625, 'Dr Zell Moremi');

INSERT INTO am_Lecture
VALUES (200203265, 'Mrs Sure Majozy');

INSERT INTO am_Lecture
VALUES (200304627, 'Leanardo Davinci');


-- Course Registration
INSERT INTO am_CourseRegistration
VALUES (2015, 'BSC208', 201503625);

INSERT INTO am_CourseRegistration
VALUES (2015, 'BSC230', 201603665);

-- Delivers 
INSERT INTO am_Delivers
VALUES ('Semester 1', 201203625, 'CSI141');

INSERT INTO am_Delivers
VALUES ('Semester 1', 200203265, 'CSI247');

-- Module Registration
INSERT INTO am_ModuleRegistration
VALUES ('Semester 1', 201503625, 'CSI141');

INSERT INTO am_ModuleRegistration
VALUES ('Semester 1', 201503625, 'CSI247');

INSERT INTO am_ModuleRegistration
VALUES ('Semester 1', 201503625, 'CSI323');


-- Assessment
INSERT INTO am_Assessment
VALUES (201503625, 'CSI141', 'Final Mark', 90);

INSERT INTO am_Assessment
VALUES (201503625, 'CSI247', 'Final Mark', 80);

INSERT INTO am_Assessment
VALUES (201503625, 'CSI262', 'Final Mark', 70);

INSERT INTO am_Assessment
VALUES (201503625, 'CSI323', 'Final Mark', 60);

-- Deleting all the tables
-- For Database Cleaning efforts

DROP TABLE am_Assessment CASCADE CONSTRAINTS;
DROP TABLE am_ModuleRegistration CASCADE CONSTRAINTS;
DROP TABLE am_Delivers CASCADE CONSTRAINTS;
DROP TABLE am_CourseRegistration CASCADE CONSTRAINTS;
DROP TABLE am_Lecture CASCADE CONSTRAINTS;
DROP TABLE am_Student CASCADE CONSTRAINTS;
DROP TABLE am_Module CASCADE CONSTRAINTS;
DROP TABLE am_Course CASCADE CONSTRAINTS;
DROP TABLE am_University CASCADE CONSTRAINTS;
