CREATE TABLE IF NOT EXISTS contacts (
	contact_id INT(11) NOT NULL AUTO_INCREMENT,
    last_name VARCHAR(30) NOT NULL,
    contact_type VARCHAR(20),
    birthday DATE,
    CONSTRAINT contacts_pk PRIMARY KEY (contact_id)
);

CREATE TABLE IF NOT EXISTS suppliers(
	supplier_id INT(11) NOT NULL AUTO_INCREMENT,
	supplier_name VARCHAR(40) NOT NULL,
    account_rep VARCHAR(30) NOT NULL DEFAULT 'TBD',
    CONSTRAINT suppliers_pk PRIMARY KEY (supplier_id)
);

DROP TABLE contacts,suppliers;

ALTER TABLE contacts
    ADD first_name VARCHAR(35) NULL
    AFTER last_name
;

ALTER TABLE suppliers
	MODIFY supplier_name VARCHAR(30) NOT NULL
;

ALTER TABLE contacts
	DROP COLUMN contact_type
;

ALTER TABLE contacts
	CHANGE COLUMN contact_type c_type VARCHAR(20) NOT NULL
;

ALTER TABLE contacts RENAME TO people;

CREATE TABLE users (
	user_id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(20) NOT NULL,
    password VARCHAR(10) NOT NULL,
    email VARCHAR(100)
);

CREATE TABLE roles(
	role_id INT(11),
    role_name VARCHAR(20),
    CONSTRAINT role_pk PRIMARY KEY (role_id) 
);

CREATE TABLE userroles(
	user_id INT (10),
    role_id INT (11),
    PRIMARY KEY (user_id,role_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (role_id) REFERENCES roles(role_id)
);

CREATE TABLE orders (
	id INT AUTO_INCREMENT,
    staff VARCHAR(30),
    PRIMARY KEY (id),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);