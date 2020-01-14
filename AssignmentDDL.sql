-- Assign 2, DDL


DROP TABLE IF EXISTS items CASCADE;
DROP TABLE IF EXISTS companies CASCADE;
DROP TABLE IF EXISTS salespeople CASCADE;
DROP TABLE IF EXISTS invoice_lines CASCADE;
DROP TABLE IF EXISTS invoices CASCADE;
DROP TABLE IF EXISTS shipping_types CASCADE;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS receivers;


CREATE TABLE companies (
	id CHAR(10) NOT NULL,
	name VARCHAR(25),
	address VARCHAR(30),
	postal_code VARCHAR(15),
	phone_number CHAR(15),
	fax CHAR(15),
	email VARCHAR(30),
	CONSTRAINT Companies_pk PRIMARY KEY (id)
);

CREATE TABLE salespeople (
	id CHAR(10) NOT NULL,
	name VARCHAR(25),
	job VARCHAR(25),
	company_id CHAR(10) NOT NULL,
	CONSTRAINT Salespeople_pk PRIMARY KEY (id),
	CONSTRAINT Salespeople_fk FOREIGN KEY (company_id) REFERENCES companies (id)
);

CREATE TABLE items (
	id CHAR(15) NOT NULL,
	description VARCHAR(30),
	price NUMERIC(6,2),
	discount DECIMAL(5,4),
	company_id CHAR(10) NOT NULL,
	CONSTRAINT Items_pk PRIMARY KEY (id),
	CONSTRAINT Items_fk FOREIGN KEY (company_id) REFERENCES companies (id)
);

CREATE TABLE customers (
	id	CHAR(10)	NOT NULL,
	name VARCHAR(25),		
	address VARCHAR(30),	
	postal_code	VARCHAR(15),	
	phone_number CHAR(15),
	CONSTRAINT Customers_pk PRIMARY KEY(id)
);

CREATE TABLE receivers (
	id	CHAR(10)	NOT NULL,
	name VARCHAR(25),		
	address VARCHAR(30),	
	postal_code	VARCHAR(15),	
	phone_number CHAR(15),
	CONSTRAINT Receivers_pk PRIMARY KEY(id)
);

CREATE TABLE shipping_types (
	id CHAR(10) NOT NULL,
	method VARCHAR(20),
	term VARCHAR(10),
	CONSTRAINT Shipping_types_pk PRIMARY KEY (id)
	
);

CREATE TABLE invoices (
	id CHAR(10) NOT NULL,
	salesperson_id CHAR(10),
	date_of_issue DATE,
	payment_term VARCHAR(15),
	due_date DATE,
	customer_id CHAR(10) NOT NULL,
	receiver_id CHAR(10) NOT NULL,
	shipping_id CHAR(10) NOT NULL,
	CONSTRAINT Invoice_pk PRIMARY KEY (id),
	CONSTRAINT Invoice_fk1 FOREIGN KEY(salesperson_id) REFERENCES salespeople (id),
	CONSTRAINT Invoice_fk2 FOREIGN KEY(customer_id) REFERENCES customers (id),
	CONSTRAINT Invoice_fk3 FOREIGN KEY(receiver_id) REFERENCES receivers (id),
	CONSTRAINT Invoice_fk4 FOREIGN KEY (shipping_id) REFERENCES shipping_types (id)

);

CREATE TABLE invoice_lines (
	id CHAR(15) NOT NULL,
	item_id CHAR(15) NOT NULL,	
	quantity NUMERIC(10) NOT NULL,
	item_description VARCHAR(30),
	item_price NUMERIC(6,2),
	invoice_line_total NUMERIC(8,2),
	invoice_id CHAR(10) NOT NULL,
	CONSTRAINT Invoice_line_pk PRIMARY KEY (id),
	CONSTRAINT Invoice_line_fk1 FOREIGN KEY(item_id) REFERENCES items (id),
	CONSTRAINT Invoice_line_fk2 FOREIGN KEY(invoice_id) REFERENCES invoices (id)

);





