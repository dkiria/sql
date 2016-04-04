CREATE TABLE lawyer(
lawyer_Id int NOT NULL PRIMARY KEY,
full_name VARCHAR(25) DEFAULT 'unknown' NOT NULL,
address VARCHAR (25) NOT NULL,
tel_number INT(11) NOT NULL,
case_number INT(11) NOT NULL,
master ENUM('yes','no') NOT NULL
)ENGINE = INNODB DEFAULT CHARSET=greek;


CREATE TABLE customer(
customer_Id int NOT NULL PRIMARY KEY,
full_name VARCHAR(25) NOT NULL,
address VARCHAR (25) NOT NULL,
tel_number INT(11) NOT NULL,
post_code INT(11) NOT NULL,
sex ENUM ('male' ,'female') NOT NULL
)ENGINE = INNODB DEFAULT CHARSET=greek;


CREATE TABLE customer_case(
case_Id int NOT NULL PRIMARY KEY,
case_number INT(10) NOT NULL,
case_title VARCHAR (25) NOT NULL,
date_start DATE NOT NULL,
responsible_lawyer VARCHAR (25) NOT NULL,
customer VARCHAR (25) NOT NULL,
reward INT(11) NOT NULL
)ENGINE = INNODB DEFAULT CHARSET=greek;


INSERT INTO lawyer (lawyer_Id,full_name,address,tel_number,case_number,master)
VALUES (1,'Pappas','Skagen 21',555555,5,'yes');
INSERT INTO lawyer (lawyer_Id,full_name,address,tel_number,case_number,master)
VALUES (2,'Oikonomou','Skagen 21',5555,4006,'no');
INSERT INTO lawyer (lawyer_Id,full_name,address,tel_number,case_number,master)
VALUES (3,'Vasileiou','Skagen 21',555555,3006,'yes');
INSERT INTO lawyer (lawyer_Id,full_name,address,tel_number,case_number,master)
VALUES (4,'Konstantinou','Skagen 21',555555,5006,'yes');
INSERT INTO lawyer (lawyer_Id,full_name,address,tel_number,case_number,master)
VALUES (5,'Antoniou','Skagen 21',555555,446,'yes');
INSERT INTO lawyer (lawyer_Id,full_name,address,tel_number,case_number,master)
VALUES (6,'Dimitriou','Skagen 21',555555,416,'yes');
INSERT INTO lawyer (lawyer_Id,full_name,address,tel_number,case_number,master)
VALUES (7,'Nikolaou','Skagen 21',555555,4006,'yes’);\
INSERT INTO lawyer (lawyer_Id,full_name,address,tel_number,case_number,master)
VALUES (8,’Nikolakopoulos’,’Skagen 61’,675555,4036,’no’);
INSERT INTO lawyer (lawyer_Id,full_name,address,tel_number,case_number,master)
VALUES (9,’Panou,’Skagen 81’,675955,4126,’no’);  
INSERT INTO lawyer (lawyer_Id,full_name,address,tel_number,case_number,master)
VALUES (10,’Nikoy’,’Skagen 27’,775555,4336,’no’);


INSERT INTO customer (customer_Id,full_name,address,tel_number,post_code,sex)
VALUES (1,'maria','Skageccn 21',555555,44336,'male');
INSERT INTO customer (customer_Id,full_name,address,tel_number,post_code,sex)
VALUES (2,'anna','Skageccn 21',553555,44336,'female');
INSERT INTO customer (customer_Id,full_name,address,tel_number,post_code,sex)
VALUES (3,'konstantina','Skageccn 21',5535,436,'male');
INSERT INTO customer (customer_Id,full_name,address,tel_number,post_code,sex)
VALUES (4,'georgia','Skageccn 21',55355,44336,'male');
INSERT INTO customer (customer_Id,full_name,address,tel_number,post_code,sex)
VALUES (5,'niki','Skageccn 21',5555545,44336,'female');
INSERT INTO customer (customer_Id,full_name,address,tel_number,post_code,sex)
VALUES (6,'athanasia','Skageccn 21',555855,44336,'male');



INSERT INTO customer_case (case_Id,case_number,case_title,date_start,responsible_lawyer,customer,reward)
VALUES (1,22,'Skag','2015-3-22','Nikolaou','Tggggom Bcccc. Erichsen',2000);
INSERT INTO customer_case (case_Id,case_number,case_title,date_start,responsible_lawyer,customer,reward)
VALUES (2,22,'Skag','2015-3-22','Pappas','anna',2000);
INSERT INTO customer_case (case_Id,case_number,case_title,date_start,responsible_lawyer,customer,reward)
VALUES (3,22,'Skag','2015-3-22','Vasileiou','georgia',2000);
INSERT INTO customer_case (case_Id,case_number,case_title,date_start,responsible_lawyer,customer,reward)
VALUES (4,22,'Skag','2015-3-22','Konstantinou','athanasia',2000);







SELECT customer_case.*
FROM lawyer
RIGHT JOIN customer_case
ON lawyer.full_name=customer_case.responsible_lawyer
ORDER BY lawyer.full_name;



SELECT full_name FROM lawyer
WHERE case_number <=5;


SELECT DISTINCT customer_case.customer
FROM customer_case
LEFT JOIN lawyer
ON (customer_case.responsible_lawyer = lawyer.full_name) and (lawyer.case_number >= 10)
ORDER BY customer_case.customer;



SELECT a.full_name, b.full_name FROM lawyer AS a 
INNER JOIN lawyer AS b ON a.lawyer_Id < b.lawyer_Id
UNION
SELECT customer.full_name, customer.address from customer



SELECT customer.full_name, customer.address ,customer_case.case_number
FROM customer
INNER JOIN customer_case
ON customer.full_name=customer_case.customer
ORDER BY customer.full_name;


SELECT customer_case.case_title ,customer_case.customer,customer_case.responsible_lawyer FROM customer_case
GROUP BY customer_case.case_title;
