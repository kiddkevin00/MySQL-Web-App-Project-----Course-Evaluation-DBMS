insert into department(dname)
values ('ee');
insert into department(dname)
values ('cs');
insert into department(dname)
values ('or');
insert into department(dname)
values ('english');
insert into department(dname)
values ('history');
insert into department(dname)
values ('math');
insert into department(dname)
values ('civil');
insert into department(dname)
values ('physic');
insert into department(dname)
values ('neuro');
insert into department(dname)
values ('chemistry');


insert into studentstudyin (gender,sname,GPA,sid,dname)
values('male','jack','3','01','math');
insert into studentstudyin (gender,sname,GPA,sid,dname)
values('female','mini','2','02','cs');
insert into studentstudyin (gender,sname,GPA,sid,dname)
values('male','james','3','03','ee');
insert into studentstudyin (gender,sname,GPA,sid,dname)
values('female','nini','4','04','history');
insert into studentstudyin (gender,sname,GPA,sid,dname)
values('male','mengyi','3','05','english');
insert into studentstudyin (gender,sname,GPA,sid,dname)
values('female','vivi','2','06','physic');
insert into studentstudyin (gender,sname,GPA,sid,dname)
values('male','ken','1','07','neuro');
insert into studentstudyin (gender,sname,GPA,sid,dname)
values('male','ric','1','08','civil');
insert into studentstudyin (gender,sname,GPA,sid,dname)
values('female','sandy','2','09','or');
insert into studentstudyin (gender,sname,GPA,sid,dname)
values('male','bill','4','10','or');



Insert into professorteachunder(pid, dname, diploma, pname)
Values('001', 'ee', 'master', 'smith') ;   
Insert into professorteachunder(pid, dname, diploma, pname)
Values('002', 'cs', 'doctorate', 'brown');      
Insert into professorteachunder(pid, dname, diploma, pname)
Values('003', 'chemistry', 'master', 'hoskin');
Insert into professorteachunder(pid, dname, diploma, pname)        
Values('004', 'physic', 'master', 'lee');       
Insert into professorteachunder(pid, dname, diploma, pname) 
Values('005', 'chemistry', 'doctorate', 'olaes') ;
Insert into professorteachunder(pid, dname, diploma, pname)          
Values('006', 'math', 'master', 'aldape') ;      
Insert into professorteachunder(pid, dname, diploma, pname)       
Values('007', 'neuro', 'master', 'sharma') ;
Insert into professorteachunder(pid, dname, diploma, pname)             
Values('008', 'history', 'doctorate', 'yi') ;  
Insert into professorteachunder(pid, dname, diploma, pname)           
Values('009', 'or', 'master', 'shoe') ;     
Insert into professorteachunder(pid, dname, diploma, pname)     
Values('010', 'english', 'master', 'doe') ;    
    

insert into TAassist(TAid ,pid)
values ('01','001');
insert into TAassist(TAid ,pid)
values ('02','002');
insert into TAassist(TAid ,pid)
values ('03','004');
insert into TAassist(TAid ,pid)
values ('04','010');
insert into TAassist(TAid ,pid)
values ('05','001');
insert into TAassist(TAid ,pid)
values ('06','003');
insert into TAassist(TAid ,pid)
values ('07','007');
insert into TAassist(TAid ,pid)
values ('08','008');
insert into TAassist(TAid ,pid)
values ('09','009');
insert into TAassist(TAid ,pid)
values ('10','009');


 
Insert into coursein(dname, cid, examp, projectp, hwp, cname, semesteryr)
Values('cs', '010', '50', '20', '30', 'databases','3')     ;      
Insert into coursein(dname, cid, examp, projectp, hwp, cname, semesteryr)
Values('ee', '011', '100', '0', '0', 'electric','7')      ; 
Insert into coursein(dname, cid, examp, projectp, hwp, cname, semesteryr)    
Values('english', '012','25', '50', '25', 'java','5')       ;    
Insert into coursein(dname, cid, examp, projectp, hwp, cname, semesteryr)
Values('math', '013', '40', '30', '30', 'heart','4')    ;       
Insert into coursein(dname, cid, examp, projectp, hwp, cname, semesteryr)
Values('chemistry', '014', '60', '20', '20', 'plants','7')   ;    
Insert into coursein(dname, cid, examp, projectp, hwp, cname, semesteryr)    
Values('physic', '015', '50', '30', '20', 'gravity','6')    ;       
Insert into coursein(dname, cid, examp, projectp, hwp, cname, semesteryr)
Values('chemistry', '016', '80', '10', '10', 'molecule','1')   ;       
Insert into coursein(dname, cid, examp, projectp, hwp, cname, semesteryr) 
Values('neuro', '017', '60', '20', '20', 'water','2')   ;        
Insert into coursein(dname, cid, examp, projectp, hwp, cname, semesteryr)
Values('or', '018', '70', '10', '20', 'ode','3')   ;        
Insert into coursein(dname, cid, examp, projectp, hwp, cname, semesteryr)
Values('civil', '019', '70', '20', '10', 'metrics','5');

Insert into teach(cid, pid)
Values('010', '001');
Insert into teach(cid, pid)
Values('011', '002');
Insert into teach(cid, pid)
Values('012', '003');
Insert into teach(cid, pid)
Values('013', '004');
Insert into teach(cid, pid)
Values('014', '005');
Insert into teach(cid, pid)
Values('015', '006');
Insert into teach(cid, pid)
Values('016', '007');
Insert into teach(cid, pid)
Values('017', '008');
Insert into teach(cid, pid)
Values('018', '009');
Insert into teach(cid, pid)
Values('019', '010');


Insert into enroll(sid, cid)
Values('01', '010');
Insert into enroll(sid, cid)
Values('02', '011');
Insert into enroll(sid, cid)
Values('03', '012');
Insert into enroll(sid, cid)
Values('04', '013');
Insert into enroll(sid, cid)
Values('05', '014');
Insert into enroll(sid, cid)
Values('06', '015');
Insert into enroll(sid, cid)
Values('07', '016');
Insert into enroll(sid, cid)
Values('08', '017');
Insert into enroll(sid, cid)
Values('09', '018');
Insert into enroll(sid, cid)
Values('10', '019');


Insert into givecredittoprofessor(sid, pid, cid,creditforprofessorofcourse )
Values('01', '001', '010','60');
Insert into givecredittoprofessor(sid, pid, cid,creditforprofessorofcourse )
Values('02', '002', '011','70');
Insert into givecredittoprofessor(sid, pid, cid,creditforprofessorofcourse )
Values('03', '003', '012','80');
Insert into givecredittoprofessor(sid, pid, cid,creditforprofessorofcourse )
Values('04', '004', '013','95');
Insert into givecredittoprofessor(sid, pid, cid,creditforprofessorofcourse )
Values('05', '005', '014','100');
Insert into givecredittoprofessor(sid, pid, cid,creditforprofessorofcourse )
Values('06', '006', '015','59');
Insert into givecredittoprofessor(sid, pid, cid,creditforprofessorofcourse )
Values('07', '007', '016','65');
Insert into givecredittoprofessor(sid, pid, cid,creditforprofessorofcourse )
Values('08', '008', '017','79');
Insert into givecredittoprofessor(sid, pid, cid,creditforprofessorofcourse )
Values('09', '009', '018','90');
Insert into givecredittoprofessor(sid, pid, cid,creditforprofessorofcourse )
Values('10', '010', '019','100');



Insert into included(cid, TAid)
Values('010', '01');
Insert into included(cid, TAid)
Values('011', '02');
Insert into included(cid, TAid)
Values('012', '03');
Insert into included(cid, TAid)
Values('013', '04');
Insert into included(cid, TAid)
Values('014', '05');
Insert into included(cid, TAid)
Values('015', '06');
Insert into included(cid, TAid)
Values('016', '07');
Insert into included(cid, TAid)
Values('017', '08');
Insert into included(cid, TAid)
Values('018', '09');
Insert into included(cid, TAid)
Values('019', '10');


Insert into givecredittoTA(sid, TAid, cid,creditforTAofcourse )
Values('01', '01', '010','55');
Insert into givecredittoTA(sid, TAid, cid,creditforTAofcourse )
Values('02', '02', '011','65');
Insert into givecredittoTA(sid, TAid, cid,creditforTAofcourse )
Values('03', '03', '012','75');
Insert into givecredittoTA(sid, TAid, cid,creditforTAofcourse )
Values('04', '04', '013','80');
Insert into givecredittoTA(sid, TAid, cid,creditforTAofcourse )
Values('05', '05', '014','85');
Insert into givecredittoTA(sid, TAid, cid,creditforTAofcourse )
Values('06', '06', '015','90');
Insert into givecredittoTA(sid, TAid, cid,creditforTAofcourse )
Values('07', '07', '016','100');
Insert into givecredittoTA(sid, TAid, cid,creditforTAofcourse )
Values('08', '08', '017','59');
Insert into givecredittoTA(sid, TAid, cid,creditforTAofcourse )
Values('09', '09', '018','65');
Insert into givecredittoTA(sid, TAid, cid,creditforTAofcourse )
Values('10', '10', '019','75');


