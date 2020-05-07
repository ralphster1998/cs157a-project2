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
	policy_coverage varchar(5) not null
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
	primary key(customer_id),
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
)



