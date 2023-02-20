-- 1.List the total cost of all the items in the store (tbl_stock)


select  sum(int_quantity * int_price) as Totalcost from tbl_stock;

 totalcost
-----------
   63865.5
(1 row)


-- .2 List the total number of products in the store (tbl_stock)

select  sum(int_quantity ) as Total_no_product from tbl_stock;
 total_no_product
------------------
               77





-- 3.List all the products in capital letters and their price rounded to the next integer
-- number(tbl_stock)

SELECT UPPER(vrchr_name) AS Products,ROUND(int_price) AS RoundedPrice
FROM tbl_stock;

 products  | roundedprice
-----------+--------------
 MOUSE     |          502
 KEYBOARD  |          452
 MODEM     |         1202
 HEADPHONE |          752
 MEMMORY   |         3502


--  4.How many different items do we have in the store(tbl_stock)
SELECT distinct count(vrchr_name) AS Items
 FROM tbl_stock;

 items
-------
     5




-- 5.Display the product with maximum price in tbl_stock


SELECT vrchr_name,int_price AS Maximum_price
FROM tbl_stock
where int_price=(select max(int_price) from tbl_stock);

 vrchr_name | maximum_price
------------+---------------
 Memmory    |        3501.5


--  6 What is the total enrollment over all the classes (tbl_enrollment)

INSERT INTO tbl_classes (vchr_class_name,fk_int_dept_id)
VALUES  ('CS100', 1),
        ('CS101', 1),
        ('CS102', 1),
        ('CS103', 1),
        ('EC200', 2),
        ('EC300', 3),
        ('AT400', 4);


INSERT INTO tbl_enrollment (int_count,fk_int_class_id)
VALUES  (40, 1),
        (15, 2),
        (10, 3),
        (12, 4),
        (60, 2),
        (14, 6),
        (200, 7);


select sum(int_count) as Totalenrollment
from tbl_enrollment;

 totalenrollment
-----------------
             351

-- 7.How many different classes are taught(tbl_classes)

select count(vchr_class_name) as NumberofClasses
from tbl_classes;

 numberofclasses
-----------------
               7


-- 9.List all the products in the database, with the product name and the price on the same
-- line

SELECT CONCAT(vrchr_name,int_price) AS product_price
FROM tbl_stock;

 product_price
----------------
 Mouse501.5
 Keyboard451.5
 Modem1201.5
 Headphone751.5
 Memmory3501.5

-- 10.List all the students name and course who got A Grade///////////////////


create table tbl_student
(
pk_int_std_id serial primary key,
enr_no int,
roll_no int,
std_name varchar(30),
city varchar(30),
mobile int,
dob date
);
 
INSERT INTO tbl_student (enr_no,roll_no,std_name,city,mobile,dob)
VALUES   (11, 2,'Akhil','Delhi',96365432,'1986-1-12'), 
         (6, 4,'Maya','Banglore',98665439,'1987-11-12'),
         (1, 8,'Anoop','Banglore',98677310,'1996-12-22'),
         (20, 1,'Paul','Cochi',98743032,'1991-03-13'),
         (3, 5,'Sandeep','Delhi',98932632,'1993-06-14');


ALTER TABLE tbl_student
ADD CONSTRAINT rolunum_unique UNIQUE (roll_no);

create table tbl_grade
(
pk_int_grade_id serial primary key,
fk_roll_no int,
course varchar(30),
grade varchar(5),
foreign key(fk_roll_no)references tbl_student (roll_no)on delete cascade on update cascade
);

INSERT INTO tbl_grade (fk_roll_no,course,grade)
VALUES   (2,'C','A'),
         (2,'java','B'),
         (1,'C','B'),
         (1,'java','A'),
         (4,'php','A'),
         (4,'java','A'),
         (4,'C','B'),
         (8,'java','B'),
         (5,'php','A'),
         (5,'java','D');




SELECT student.roll_no, student.std_name, s_grade.course, s_grade.grade
FROM (tbl_student as student
JOIN tbl_grade as s_grade ON student.roll_no = s_grade.fk_roll_no)
where s_grade.grade='A';

 roll_no | std_name | course | grade
---------+----------+--------+-------
       2 | Akhil    | C      | A
       4 | Maya     | php    | A
       4 | Maya     | java   | A
       1 | Paul     | java   | A
       5 | Sandeep  | php    | A


-- 11.List the number of students who got B grade//////////

SELECT count(s_grade.grade) as B_grade_holders
FROM (tbl_student as student
JOIN tbl_grade as s_grade ON student.roll_no = s_grade.fk_roll_no)
where s_grade.grade='B';

 b_grade_holders
-----------------
               4

-- 12.List all the students name, roll No and Number of course they applied for//////

SELECT student.std_name,student.roll_no,count(s_grade.course) as Course_applied
FROM (tbl_student as student
JOIN tbl_grade as s_grade ON student.roll_no = s_grade.fk_roll_no)
group by student.std_name,student.roll_no ;

 std_name | roll_no | course_applied
----------+---------+----------------
 Sandeep  |       5 |              2
 Anoop    |       8 |              1
 Akhil    |       2 |              2
 Paul     |       1 |              2
 Maya     |       4 |              3


--  13.Get all students who is doing a Java course and are from Bangalore/////

SELECT student.std_name, s_grade.course,student.city
FROM (tbl_student as student
JOIN tbl_grade as s_grade ON student.roll_no = s_grade.fk_roll_no)
where s_grade.course='java' and student.city = 'Banglore';

 std_name | course |   city
----------+--------+----------
 Maya     | java   | Banglore
 Anoop    | java   | Banglore


--  14.Select the name of the students starting from letter ‘a’ and the courses applied by
-- them. [ select, where condition and Pattern matching]//////

SELECT distinct student.std_name , s_grade.course FROM tbl_student as student,tbl_grade as s_grade
WHERE student.std_name LIKE 'A%' order by student.std_name;

 std_name | course
----------+--------
 Akhil    | java
 Akhil    | C
 Akhil    | php
 Anoop    | C
 Anoop    | php
 Anoop    | java


-- 15.Select the name and age of the students.(date function)/////////

SELECT std_name,EXTRACT(YEAR FROM CURRENT_DATE)-EXTRACT(YEAR FROM dob) as age 
FROM tbl_student;

 std_name | age
----------+-----
 Akhil    |  37
 Maya     |  36
 Anoop    |  27
 Paul     |  32
 Sandeep  |  30

select std_name,age(current_date ,dob)
FROM tbl_student;

 std_name |           age
----------+-------------------------
 Akhil    | 37 years 1 mon 7 days
 Maya     | 35 years 3 mons 7 days
 Anoop    | 26 years 1 mon 28 days
 Paul     | 31 years 11 mons 6 days
 Sandeep  | 29 years 8 mons 5 days



-- 16.Display the student name and their DOB in the following format [Formatting of date
-- while displaying]

SELECT std_name,TO_CHAR(dob, ' dd-Mon-yyyy')as Date_of_birth
from tbl_student;

 std_name | date_of_birth
----------+---------------
 Akhil    |  12-Jan-1986
 Maya     |  12-Nov-1987
 Anoop    |  22-Dec-1996
 Paul     |  13-Mar-1991
 Sandeep  |  14-Jun-1993
        

 


  