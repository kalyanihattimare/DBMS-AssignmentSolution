/*ceating Database*/
create database Ecommerce;
USE  Ecommerce;

/*creating tables*/
create table Supplier(
					SUPP_ID int primary key,
					SUPP_NAME varchar(15) NOT NULL ,
                    SUPP_CITY varchar(15) NOT NULL ,
					SUPP_PHONE varchar(10) NOT NULL 
);

CREATE TABLE Customer( 
						CUS_ID INT PRIMARY KEY,
                        CUS_NAME VARCHAR(20) NOT NULL,
                        CUS__PHONE VARCHAR(10) NOT NULL,
                        CUS_CITY VARCHAR(30)NOT NULL,
                        CUS_GENDER CHAR
);
CREATE TABLE CATEGORY(
					CAT_ID INT PRIMARY KEY,
					CAT_NAME VARCHAR(20) NOT NULL
);

CREATE TABLE PRODUCT(
					PRO_ID INT PRIMARY KEY,
					PRO_NAME VARCHAR(30) NOT NULL DEFAULT "Dummy" ,
                    PRO_DESC VARCHAR(100),
                    CAT_ID INT,
                    foreign key (CAT_ID) references CATEGORY(CAT_ID)
);

CREATE TABLE SUPPLIER_PRICING(
							PRICING_ID INT PRIMARY KEY,
                            PRO_ID INT,
                            SUPP_ID INT,
                            SUPP_PRICE INT DEFAULT 0,
							FOREIGN KEY (PRO_ID) REFERENCES PRODUCT(PRO_ID),
                            FOREIGN KEY (SUPP_ID) REFERENCES Supplier(SUPP_ID)
);
drop table orders;
CREATE TABLE ORDERS(
					ORD_ID INT PRIMARY KEY,
                    ORD_AMOUNT INT NOT NULL,
                    ORD_DATE DATE NOT NULL,
                    CUS_ID INT,
                    PRICING_ID INT,
                    FOREIGN KEY (CUS_ID) REFERENCES CUSTOMER(CUS_ID),
                    FOREIGN KEY (PRICING_ID) REFERENCES SUPPLIER_PRICING(PRICING_ID)
);

DROP TABLE RATING;
CREATE TABLE RATING(
					RAT_ID INT PRIMARY KEY,
                    ORD_ID INT,
                    RAT_RATSTARS INT NOT NULL,
                    FOREIGN KEY (ORD_ID) REFERENCES ORDERS(ORD_ID)

);

/*Inserting values into table  */

INSERT INTO Supplier values(1, "Rajesh Retails", "Delhi", 1234567890);
INSERT INTO Supplier VALUES(2,"Appario LTD", "Mumbai", 2312455651);
INSERT INTO Supplier VALUES(3,"Knome Products", "Banglore", 2134534567);
INSERT INTO Supplier VALUES(4, "Bansal Retails","Kochi", 9876543231);
INSERT INTO Supplier VALUES(5, "Mittal Ltd", "Lucknow", 7625432432 );


INSERT INTO Customer VALUES(1,"AAKASH", 9999999999,"DELHI","M");
INSERT INTO Customer VALUES(2,"AMAN", 9876546754, "NOIDA", "M");
INSERT INTO Customer VALUES(3, "NEHA", 3423654378,"MUMBAI","F");
INSERT INTO Customer VALUES(4, "MEGHA", 9876549871,"KOLKATA", "F");
INSERT INTO Customer VALUES(5,"PULKIT", 7864534253,"LUCKNOW", "M");

INSERT INTO CATEGORY values(1,"BOOKS");
INSERT INTO CATEGORY values(2,"GAMES");
INSERT INTO CATEGORY values(3,"GROCERIES");
INSERT INTO CATEGORY values(4,"ELECRONICS");
INSERT INTO CATEGORY values(5, "CLOTHES");

INSERT INTO PRODUCT values(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
INSERT INTO PRODUCT values(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
INSERT INTO PRODUCT values(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
INSERT INTO PRODUCT values(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO PRODUCT values(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO PRODUCT values(6,"MILK","1L Toned MIlk",3);
INSERT INTO PRODUCT values(7,"BOAT EARPHONES","1.5Meter long Dolby Atmos ",4);
INSERT INTO PRODUCT values(8,"JEANS","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO PRODUCT values(9,"PROJECT IGI","compatible with windows 7 and above ",2);
INSERT INTO PRODUCT values(10,"HOODIE","Black GUCCI for 13 yrs and above",5);
INSERT INTO PRODUCT values(11,"RICH DAD POOR DAD","Written by RObert Kiyosaki ",1);
INSERT INTO PRODUCT values(12,"TRAIN YOUR BRAIN","By Shireen Stephen",1);

INSERT INTO SUPPLIER_PRICING values (1,1,2,1500);
INSERT INTO SUPPLIER_PRICING values (2,3,5,30000);
INSERT INTO SUPPLIER_PRICING values (3,5,1,3000);
INSERT INTO SUPPLIER_PRICING values (4,2,3,2500);
INSERT INTO SUPPLIER_PRICING values (5,4,1,1000);

select * from orders;
INSERT INTO ORDERS values (101,1500,'2021-10-06',2,1);
INSERT INTO ORDERS values (102,1000,'2021-10-12',3,5);
INSERT INTO ORDERS values (103,30000, '2021-09-16', 5 ,2);
INSERT INTO ORDERS values (104, 1500 ,'2021-10-05', 1,1);
INSERT INTO ORDERS values (105, 3000,'2021-08-16'  ,4 ,3);
INSERT INTO ORDERS values (106, 1450, '2021-08-18', 1 , 4);
INSERT INTO ORDERS values (107, 789 ,'2021-09-01 ', 3, 2);
INSERT INTO ORDERS values (108, 780 ,'2021-09-07', 5 ,5);
INSERT INTO ORDERS values (109, 3000, '2021-09-10', 5, 3);
INSERT INTO ORDERS values (110, 2500,'2021-09-10' , 2 , 4);
INSERT INTO ORDERS values (111, 1000,'2021-09-15' , 4, 5);
INSERT INTO ORDERS values (112, 789,'2021-09-16' , 4, 4);
INSERT INTO ORDERS values (113, 31000,'2021-09-16' , 1, 5);
INSERT INTO ORDERS values (114, 1000,'2021-09-16' , 3,5);
INSERT INTO ORDERS values (115, 3000,'2021-09-16 ' , 5, 3);
INSERT INTO ORDERS values (116, 99,'2021-09-17', 2, 4);

INSERT INTO RATING values(1,101,4);
INSERT INTO RATING values(2,102,3);
INSERT INTO RATING values(3,103,1);
INSERT INTO RATING values(4,104,2);
INSERT INTO RATING values(5,105,4);
INSERT INTO RATING values(6,106,3);
INSERT INTO RATING values(7,107,4);
INSERT INTO RATING values(8,108,4);
INSERT INTO RATING values(9,109,3);
INSERT INTO RATING values(10,110,5);
INSERT INTO RATING values(11,111,3);
INSERT INTO RATING values(12,112,4);
INSERT INTO RATING values(13,113,2);
INSERT INTO RATING values(14,114,1);
INSERT INTO RATING values(15,115,1);
INSERT INTO RATING values(16,116,0);

/*3) Display the total number of customers based on gender who have placed 
orders of worth at least Rs.3000.*/

SELECT COUNT(CUS_ID) AS TOTAL_NO_OF_CUS FROM CUSTOMER  WHERE CUS_ID  GROUP BY CUS_GENDER IN
(SELECT CUS_ID FROM ORDERS WHERE ORD_AMOUNT>=3000);

/*4) Display all the orders along with product name ordered by a 
customer having Customer_Id=2*/
select CUS_ID, PRO_NAME from product join customer
where CUS_ID=2 and  PRO_ID in (select PRO_ID  from supplier_pricing
 where PRICING_ID in (select PRICING_ID  from ORDERS where
 ORD_ID in (select ORD_ID from ORDERS where CUS_ID=2) ) )  ;

/*5) Display the Supplier details who can supply more than one product.*/
SELECT * FROM Supplier WHERE SUPP_ID IN 
(SELECT COUNT(SUPP_ID)>1 FROM SUPPLIER_PRICING );


/* 6) Find the least expensive product from each category and print the table with 
category id, name, product name and price of the product*/
 select c.CAT_ID ,c.CAT_NAME,p.PRO_NAME, min(sp.SUPP_PRICE) as 
 Least_Price_Productes from category as c join product as p
 on c.CAT_ID = p.CAT_ID
 join supplier_pricing as sp
 on p.PRO_ID = sp.PRO_ID
 group by c.CAT_ID;

/*7) Display the Id and Name of the Product ordered after “2021-10-05”*/
 select PRO_ID ,PRO_NAME from product where PRO_ID 
 in(select PRO_ID from supplier_pricing where PRICING_ID in
 (select PRICING_ID from ORDERS where ORD_DATE> 2021-10-05));
 
 /*8)Display customer name and gender whose names start or end with character 'A'.*/
 select CUS_NAME , CUS_GENDER from customer where CUS_NAME like "A%" 
 or CUS_NAME like "%A";

/* 9.Create a stored procedure to display supplier id, name, rating and Type_of_Service.
 For Type_of_Service, If rating =5, print “Excellent 
Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service”
 else print “Poor Service” */
 
DELIMITER $
create procedure QualityCheck ()
Begin
Select  s.SUPP_ID,s.SUPP_NAME,r.RAT_RATSTARS ,
case
    when RAT_RATSTARS =5 then 'Excellent service'
    when RAT_RATSTARS >=4 then 'Good service'
    when RAT_RATSTARS >2 then 'Average service'
    else 'poor service'
end as Type_of_service
from rating r
join orders o
on r.ORD_ID = o.ORD_ID
join supplier_pricing  sp
on o.PRICING_ID = sp.PRICING_ID
join supplier s
on sp.SUPP_ID =s.SUPP_ID;
end $
DELIMITER ;
call QualityCheck();
