
CREATE TABLE studentstudyin (
gender VARCHAR2(10),
sname VARCHAR2(10),
GPA VARCHAR2(10),
sid VARCHAR2(10),
dname VARCHAR2(10) NOT NULL,
PRIMARY KEY (sid),
FOREIGN KEY (dname) REFERENCES department(dname),
CHECK(GPA>=1 AND GPA<=4));


CREATE TABLE department (
dname VARCHAR2(10),
PRIMARY KEY (dname));


CREATE TABLE professorteachunder (
pid VARCHAR2(10),
dname VARCHAR2(10) NOT NULL,
diploma VARCHAR2(10),
pname VARCHAR2(10),
PRIMARY KEY (pid),
FOREIGN KEY (dname) REFERENCES department);


CREATE TABLE coursein (
dname VARCHAR2(10) NOT NULL,
cid VARCHAR2(10),
examp VARCHAR2(10),
projectp VARCHAR2(10),
hwp VARCHAR2(10),
cname VARCHAR2(10),
semesteryr VARCHAR2(10),
PRIMARY KEY (cid),
FOREIGN KEY (dname) REFERENCES department(dname),
CHECK(examp>=0 AND projectp>=0 AND hwp>=0 AND semesteryr>=1 
AND semesteryr<=8 ));


CREATE TABLE enroll (
sid VARCHAR2(10),
cid VARCHAR2(10),
PRIMARY KEY (sid,cid),
FOREIGN KEY (sid) REFERENCES studentstudyin(sid),  
FOREIGN KEY (cid) REFERENCES coursein(cid));


CREATE TABLE teach (
cid VARCHAR2(10),
pid VARCHAR2(10),
PRIMARY KEY (cid,pid),
FOREIGN KEY (cid) REFERENCES coursein,  
FOREIGN KEY (pid) REFERENCES professorteachunder);


CREATE TABLE TAassist (
TAid VARCHAR2(10),
pid VARCHAR2(10) NOT NULL,
PRIMARY KEY(TAid),
FOREIGN KEY (pid) REFERENCES professorteachunder(pid));


CREATE TABLE included(
cid VARCHAR2(10),
TAid VARCHAR2(10),
PRIMARY KEY (cid,TAid),
FOREIGN KEY(TAid) REFERENCES TAassist,  
FOREIGN KEY (cid) REFERENCES coursein(cid));


CREATE TABLE givecredittoTA (
sid VARCHAR2(10),
TAid VARCHAR2(10),
cid VARCHAR2(10),
creditforTAofcourse VARCHAR2(10),
PRIMARY KEY (TAid,sid,cid),
FOREIGN KEY (sid) REFERENCES studentstudyin,
FOREIGN KEY (cid,TAid) REFERENCES included(cid,TAid),
CHECK(creditforTAofcourse>=0 AND creditforTAofcourse <=100 ));



CREATE TABLE givecredittoprofessor (
sid VARCHAR2(10),
pid VARCHAR2(10),
cid VARCHAR2(10),
creditforprofessorofcourse VARCHAR2(10),
PRIMARY KEY (sid,pid,cid),
FOREIGN KEY (sid) REFERENCES studentstudyin,  
FOREIGN KEY (cid,pid) REFERENCES teach(cid,pid),
CHECK(creditforprofessorofcourse>=0 AND creditforprofessorofcourse<=100 ));

