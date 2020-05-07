drop table if exists home_incident;
drop table if exists incidents;
drop table if exists policy;
drop table if exists policy_owner;
drop table if exists home;
drop table if exists customer;
drop table if exists payment;

create table home_incident
	(home_id		varchar(8)  not null,
	 home_address	varchar(50) not null,
	 owner_name     varchar(20) not null,
     incident_id    varchar(8)  not null,
     incident_date  Date    not null,
	 primary key (home_id),
     foreign key(incident_id)   references
                                incidents
                                on delete
                                cascade,
    foreign key(owner_name)     references
                                policy_owner
                                on delete
                                cascade,
    foreign key(home_id, home_address)     references
                                policy_owner
                                on delete
                                cascade
	);

create table incidents(
     incident_id	varchar(8)             not null,
     num_incidents  unsigned numeric(2,0)           not null,
	 home_address   varchar(50)            not null,
	 primary key (incident_id),
     foreign key(home_address) references home
                               on delete
                               cascade
 );


create table policy (
	policy_id varchar(14) not null,
	type_of  varchar(30) not null,
	policy_amount unsigned numeric(10,2) check(policy_amount > 0 ),
	policy_coverage varchar(5) not null,
	primary key(policy_id,policy_amount,policy_coverage)
);


create table policy_owner (
	policy_id varchar(14) not null primary key,
	owner_name varchar(20) not null,
	foreign key(policy_id) references policy
        			on delete cascade
);


create table home (

	home_id varchar(8) not null,
	policy_id varchar(14) not null,
	home_address varchar(50) not null,
	start_date DATE not null,
	end_date DATE not null,
	foreign key(policy_id) references policy
         			on delete cascade,
	primary key (home_id, policy_id)
);



create table customer(
	customer_id varchar(8) not null,
	owner_name varchar(20) not null,
	address varchar (50) not null,
	phone_number char (10) not null,
	--see note on May 6
	primary key(customer_id, address),
	foreign key(owner_name) references policy_owner
				on delete cascade,
	foreign key(address) references home_incident on delete cascade
);

create table payment(
	payment_id varchar(8) not null,
	policy_id varchar(8) not null,
	customer_id varchar(8) not null,
	payment_date Date not null,
	due_date Date not null,
	coverage_period_months int not null,
	transaction_type varchar(8) not null,
	amount numeric(10,2) not null,
	primary key (payment_id, policy_id, customer_id, payment_date, due_date, coverage_period_months
				, transaction_type, amount)
);

--may 6, mary poppins has 2 homes, 1 customer has only policy id, originally, customer table has primary key be customer_id,
-- run into this error Error: near line 115: UNIQUE constraint failed: customer.customer_id
--> ? change primary key of the customer table to (policy_id, address )

--  create table home_incident
--  	(home_id		varchar(8)  not null,
--  	 home_address	varchar(50) not null,
--  	 owner_name     varchar(20) not null,
--       incident_id    varchar(8)  not null,
--       incident_date  Date    not null,);
insert into home_incident values ('00000001',
                                  '123 1st Street, New York, NY 95023',
                                  'Harry Potter',
                                  '10000001',
                                  '2007-01-01');
insert into home_incident values ('10020001',
                                  '578 5th Street, Boston, MA 91021',
                                  'Mary Poppins',
                                  '10200501',
                                  '2010-01-31');
insert into home_incident values ('10730101',
                                  '5492 10th Street, San Jose, CA 95123',
                                  'Arij Kana',
                                  '11242501',
                                  '2002-10-25');
insert into home_incident values ('59023201',
                                  '696 4th Street, Austin, TX 62021',
                                  'Mufasa King',
                                  '62220401',
                                  '2015-09-31');
insert into home_incident values ('47822301',
                                  '949 18th Street, Raleigh, CA 92121',
                                  'Keanu Reeves',
                                  '80230421',
                                  '2010-11-31');
insert into home_incident values ('89022401',
                                  '239 6th Street, Hollywood, CA 92921',
                                  'Lebron James',
                                  '94102501',
                                  '2011-09-31');
insert into home_incident values ('13020201',
                                  '475 19th Street, Disneyland, CA 91021',
                                  'Mary Poppins',
                                  '90205501',
                                  '2010-01-31');

insert into incidents values ('10000001', -- incident_id
                      '5', -- num_incidents
		      '123 1st Street, New York, NY 95023'
   );
insert into incidents values ('10200501', -- incident_id
                      '10', -- num_incidents
		      '578 5th Street, Boston, MA 91021'
   );
insert into incidents values ('11242501', -- incident_id
                      '2', -- num_incidents
		      '5492 10th Street, San Jose, CA 95123'
   );
insert into incidents values ('62220401', -- incident_id
                      '14', -- num_incidents
		      '696 4th Street, Austin, TX 62021'
   );
insert into incidents values ('80230421', -- incident_id
                      '53', -- num_incidents
		      '949 18th Street, Raleigh, CA 92121'

   );
insert into incidents values ('94102501', -- incident_id
                      '23', -- num_incidents
		      '239 6th Street, Hollywood, CA 92921'
   );
insert into incidents values ('90205501', -- incident_id
                      '2', -- num_incidents
		     '475 19th Street, Disneyland, CA 91021'
   );

--policy(policy_id, type_of, policy_amount, policy_coverage)
insert into policy values ('abcd123456789','dwelling coverage','1000000','full');
insert into policy values ('efgd123456780','contents coverage','4000000','half');
insert into policy values ('asdf123456700','personal liability','150000','full');
insert into policy values ('qwer123456000','contents coverage','50050','half');
insert into policy values ('zxcv123450000','personal liability','1000','low');
insert into policy values ('qwdv123000000','contents coverage','10090','low');
--commented out May/6 insert into policy values ('ujmn567895432','dwelling coverage','7000','half');

--policy_owner(policy_id, owner_name)
insert into policy_owner values ('abcd123456789','Harry Potter');
insert into policy_owner values ('efgd123456780','Mary Poppins');
insert into policy_owner values ('asdf123456700','Arij Kana');
insert into policy_owner values ('qwer123456000','Mufasa King');
insert into policy_owner values ('zxcv123450000','Keanu Reeves');
insert into policy_owner values ('qwdv123000000','Lebron James');
--commented out May/6 insert into policy_owner values ('ujmn567895432','Mary Balotelli');

insert into home values ('00000001','abcd123456789', '123 1st Street, New York, NY 95023', '2007-08-21', '2010-08-21');
insert into home values ('10020001','efgd123456780', '578 5th Street, Boston, MA 91021','2010-03-21', '2012-03-21');
insert into home values ('10730101','asdf123456700', '5492 10th Street, San Jose, CA 95123', '2001-08-21', '2005-08-21');
insert into home values ('59023201','qwer123456000', '696 4th Street, Austin, TX 62021', '2013-11-21', '2020-11-21');
insert into home values ('47822301','zxcv123450000', '949 18th Street, Raleigh, CA 92121', '2009-08-21', '2013-08-21');
insert into home values ('89022401','qwdv123000000', '239 6th Street, Hollywood, CA 92921', '2009-06-22', '2014-06-22');
--added May 6
insert into home values ('13020201','efgd123456780', '475 19th Street, Disneyland, CA 91021', '2011-08-21', '2021-08-21');
--commented out insert into home values ('13020201','ujmn567895432', '475 19th Street, Disneyland, CA 91021', '2011-08-21', '2021-08-21');

insert into customer values('3fsfefdf','Harry Potter', '123 1st Street, New York, NY 95023','556-334-9900');
insert into customer values('afd5edrf','Mary Poppins', '578 5th Street, Boston, MA 91021','356-364-8895');
insert into customer values('3jrlfl9o','Arij Kana',  '5492 10th Street, San Jose, CA 95123','666-473-3349');
insert into customer values('j9or5tio','Mufasa King', '696 4th Street, Austin, TX 62021','780-325-4460');
insert into customer values('lojh8uri', 'Keanu Reeves', '949 18th Street, Raleigh, CA 92121','445-480-3340');
insert into customer values('lojd93j6','Lebron James', '239 6th Street, Hollywood, CA 92921','908-234-9978');
--added may 6
insert into customer values('afd5edrf','Mary Poppins', '475 19th Street, Disneyland, CA 91021','908-234-9978');
--commented may 6 insert into customer values('lfme423a','Mario Balotelli', '444 14th Street, San Jose, CA 95192', '885-335-3768');
insert into customer values('grgdfedd','Virgil Van Dijk', '563 11th Street, Santa Clara, CA 95192', '885-335-3768');
insert into customer values('uehdnkdm','Mario Balotelli', '577 34th Street, Manassas, VA 44457', '885-335-3768');
--may 6, add payment id
--payment(payment id, policy id)
insert into payment values('12345','abcd123456789','3fsfefdf','2010-08-21','2010-08-21','12','card','1000000');
insert into payment values('23456','asdf123456700','3jrlfl9o','2012-03-21','2012-03-21','12','card','150000');
insert into payment values('34567','efgd123456780','afd5edrf','2005-08-21','2005-08-21','6','card','4000000');
insert into payment values('45678','qwdv123000000','lojd93j6','2020-11-21','2020-11-21','3','card','10090');
insert into payment values('67890','qwer123456000','j9or5tio','2013-08-21','2013-08-21','6','card','50050');
insert into payment values('89123','zxcv123450000','lojh8uri','2021-08-21','2021-08-21','3','card','1000');
--commented out may 6 insert into payment values('78912','ujmn567895432','lfme423a','2014-06-22','2014-06-22','6','card','7000');