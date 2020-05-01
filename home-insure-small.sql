delete from home_incident;
delete from incidents;
delete from policy;
delete from policy_owner;
delete from home;
delete from customer;


insert into home_incident values ('00000001',
                                  '123 1st Street, New York, NY 95023',
                                  'Harry Potter',
                                  '10000001',
                                  '2007-01-01 10:00:00.125');
insert into home_incident values '(10020001',
                                  '578 5th Street, Boston, MA 91021',
                                  'Mary Poppins',
                                  '10200501',
                                  '2010-01-31 09:10:00.125');
insert into home_incident values (10730101,
                                  '5492 10th Street, San Jose, CA 95123',
                                  'Arij Kana',
                                  '11242501',
                                  '2002-10-25 08:16:12.125');
insert into home_incident values ('59023201',
                                  '696 4th Street, Austin, TX 62021',
                                  'Mufasa King',
                                  '62220401',
                                  '2015-09-31 14:56:23.125');
insert into home_incident values ('47822301',
                                  '949 18th Street, Raleigh, CA 92121',
                                  'Keanu Reeves',
                                  '80230421',
                                  '2010-11-31 23:42:11.125');   
insert into home_incident values ('89022401',
                                  '239 6th Street, Hollywood, CA 92921',
                                  'Lebron James',
                                  '94102501',
                                  '2011-09-31 11:45:00.125');   
insert into home_incident values ('13020201',
                                  '475 19th Street, Disneyland, CA 91021',
                                  'Mary Poppins',
                                  '90205501',
                                  '2010-01-31 09:10:00.125'); 

insert into incidents ('10000001', -- incident_id
                      5 -- num_incidents
   );
insert into incidents ('10200501', -- incident_id
                      10 -- num_incidents
   );
insert into incidents ('11242501', -- incident_id
                      2 -- num_incidents
   );
insert into incidents ('62220401', -- incident_id
                      14 -- num_incidents
   );
insert into incidents ('80230421', -- incident_id
                      53 -- num_incidents
   );
insert into incidents ('94102501', -- incident_id
                      23 -- num_incidents
   );
insert into incidents ('90205501', -- incident_id
                      2 -- num_incidents
   );




--policy(policy_id, type_of, policy_amount, policy_coverage)
insert into policy values ('abcd123456789','dwelling coverage','1000000','full');
insert into policy values ('efgd123456780','contents coverage','400000','half');
insert into policy values ('asdf123456700','personal liability','150000','full');
insert into policy values ('qwer123456000','contents coverage','50050','half');
insert into policy values ('zxcv123450000','personal liability','1000','low');
insert into policy values ('qwdv123000000','contents coverage','10090','low');
insert into policy values ('ujmn567895432','dwelling coverage','7000','half');

--policy_owner(policy_id, owner_name)
insert into policy_owner values ('abcd123456789','Harry Potter');
insert into policy_owner values ('efgd123456780','Mary Poppins');
insert into policy_owner values ('asdf123456700','Arij Kana');
insert into policy_owner values ('qwer123456000','Mufasa King');
insert into policy_owner values ('zxcv123450000','Keanu Reeves');
insert into policy_owner values ('qwdv123000000','Lebron James');
insert into policy_owner values ('ujmn567895432','Mary Poppins');



insert into home values ('00000001','abcd123456789', '123 1st Street, New York, NY 95023', '2007-08-21', '2010-08-21');

insert into home values ('10020001','efgd123456780', '578 5th Street, Boston, MA 91021','2010-03-21', '2012-03-21');



insert into home values ('10730101','asdf123456700', '5492 10th Street, San Jose, CA 95123', '2001-08-21', '2005-08-21');



insert into home values ('59023201','qwer123456000', '696 4th Street, Austin, TX 62021', '2013-11-21', '2020-11-21');



insert into home values ('47822301','zxcv123450000', '949 18th Street, Raleigh, CA 92121', '2009-08-21', '2013-08-21');


insert into home values ('89022401','qwdv123000000', '239 6th Street, Hollywood, CA 92921', '2009-06-22', '2014-06-22');


insert into home values ('13020201','ujmn567895432', '475 19th Street, Disneyland, CA 91021', '2011-08-21', '2021-08-21');




insert into customer values('3fsfefdf','Harry Potter', '123 1st Street, New York, NY 95023','556-334-9900');

insert into customer values('afd5edrf','Mary Poppins', '578 5th Street, Boston, MA 91021','356-364-8895');


insert into customer values('3jrlfl9o','Arij Kana',  '5492 10th Street, San Jose, CA 95123','666-473-3349');


insert into customer values('j9or5tio','Mufasa King', '696 4th Street, Austin, TX 62021','780-325-4460');


insert into customer values('lojh8uri', 'Keanu Reeves', '949 18th Street, Raleigh, CA 92121','445-480-3340');


insert into customer values('lojd93j6','Lebron James', '475 19th Street, Disneyland, CA 91021','908-234-9978');


insert into customer values('lfme423a','Mario Balotelli', '444 14th Street, San Jose, CA 95192', '885-335-3768');

insert into customer values('grgdfedd','Virgil Van Dijk', '563 11th Street, Santa Clara, CA 95192', '885-335-3768');

insert into customer values('uehdnkdm','Mario Balotelli', '577 34th Street, Manassas, VA 44457', '885-335-3768');


                                                                                                                                                                                                 
