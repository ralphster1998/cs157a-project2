create table home_incident
	(home_id		varchar(8)  not null,
	 home_address	varchar(50) not null,
	 owner_name     varchar(20) not null,
     incident_id    varchar(8)  not null,
     incident_date  text    not null,
	 primary key (home_id),
     foreign key(incident_id)   references
                                incidents       
                                on delete
                                cascade,
    foreign key(owner_name)     references
                                policy_owner      
                                on delete
                                set null,
    foreign key(home_id, home_address)     references
                                policy_owner      
                                on delete
                                set null
	);

create table incidents
    (incident_id	varchar(8)             not null,
     num_incidents	numeric(3,0)  unsigned not null,
	 home_address   varchar(50)            not null,
	 primary key (incident_id),
     foreign key(home_address) references home    
                               on delete
                               set null
	);


create table policy (
policy_id varchar(14) not null,
type_of  varchar(30) not null,
policy_amount numeric(10,2)  unsigned check(policy_amount > 0 ),
policy_coverage varchar(5) not null);


create table policy_owner(
policy_id varchar(14) not null primary key,
owner_name varchar(20) not null,
foreign_key(policy_id) references policy,
        on delete cascade);


create table home(
	home_id varchar(8) not null,
	policy_id varchar(14) not null,
	start_date DATE not null,
	end_date DATE not null,
	foreign_key(policy_id) references policy 
         			on delete set null,
	primary key (home_id, policy_id)	
);



create table customer(

	customer_id varchar(8) not null,
	name varchar(20) not null,
	address varchar (50) not null,
	phone_number char (10) not null,
	primary key(customer_id),
	foreign key(name) references owner_name 
				on delete cascade,
	foreign key(mailing_address) references home_incident on delete cascade	
);



