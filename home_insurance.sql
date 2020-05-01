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