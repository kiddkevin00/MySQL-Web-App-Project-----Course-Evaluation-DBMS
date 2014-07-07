CREATE TABLE givecredittoTA (
sid VARCHAR2(10),
TAid VARCHAR2(10),
cid VARCHAR2(10),
creditforTAofcourse VARCHAR2(10),
PRIMARY KEY (TAid,sid,cid),
UNIQUE(sid),
FOREIGN KEY (sid) REFERENCES studentstudyin,
FOREIGN KEY (cid,TAid) REFERENCES included(cid,TAid),
CHECK(creditforTAofcourse>=0 AND creditforTAofcourse <=100 ));


CREATE TABLE givecredittoprofessor (
sid VARCHAR2(10),
pid VARCHAR2(10),
cid VARCHAR2(10),
creditforprofessorofcourse VARCHAR2(10),
PRIMARY KEY (sid,pid,cid),
UNIQUE (sid),
FOREIGN KEY (sid) REFERENCES studentstudyin,  
FOREIGN KEY (cid,pid) REFERENCES teach(cid,pid),
CHECK(creditforprofessorofcourse>=0 AND creditforprofessorofcourse<=100 ));
