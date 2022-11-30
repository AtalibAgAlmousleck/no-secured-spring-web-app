CREATE TABLE customers(
    customer_id bigint auto_increment primary key,
    name varchar(64) not null,
    contact_name varchar(128) not null,
    email varchar(128) not null,
    phone varchar(24) not null
);

CREATE TABLE orders(
    order_id bigint auto_increment primary key,
    customer_id bigint not null,
    order_info varchar (2048) not null,
    foreign key (customer_id) references customers(customer_id)
);

CREATE TABLE users (
    username varchar(100) not null primary key,
    password varchar(500) not null,
    enabled boolean not null
);

CREATE TABLE authorities (
    username varchar(100) not null,
    authority varchar(100) not null,
    constraint fk_authorities_users foreign key (username) references users(username)
);


-- You can have a instance of username multiple times as long as each time have
-- different Authority
CREATE UNIQUE INDEX ix_auth_username on authorities(username, authority);