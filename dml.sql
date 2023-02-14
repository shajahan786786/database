
-- Insert values into 'tbl_stock' as shown in the expected output image//////////////

INSERT INTO tbl_stock (vrchr_name,int_quantity, int_price,fk_int_supplier)
 VALUES ('Mouse', 10,500,1);

INSERT INTO tbl_stock (vrchr_name,int_quantity, int_price,fk_int_supplier)
VALUES  ('Keyboard', 5,450,3),
        ('Modem', 10,1200,2),
        ('Memmory', 100,1500,5),
        ('Headphone', 50,750,4),
        ('Memmory', 2,3500,4);
        
 select * from tbl_stock;
 pk_int_stock_id | vrchr_name | int_quantity | int_price | fk_int_supplier
-----------------+------------+--------------+-----------+-----------------
               1 | Mouse      |           10 |       500 |               1
               2 | Keyboard   |            5 |       450 |               3
               3 | Modem      |           10 |      1200 |               2
               4 | Memmory    |          100 |      1500 |               5
               5 | Headphone  |           50 |       750 |               4
               6 | Memmory    |            2 |      3500 |               4


-- Update the prices for all the products in 'tbl_stock' by incrementing their current
-- price by 1.50 (needs query for update only. Calculation can be done manually)////


update tbl_stock
set int_price = int_price + 1.50 ;

select * from tbl_stock;
 pk_int_stock_id | vrchr_name | int_quantity | int_price | fk_int_supplier
-----------------+------------+--------------+-----------+-----------------
               1 | Mouse      |           10 |     501.5 |               1
               2 | Keyboard   |            5 |     451.5 |               3
               3 | Modem      |           10 |    1201.5 |               2
               4 | Memmory    |          100 |    1501.5 |               5
               5 | Headphone  |           50 |     751.5 |               4
               6 | Memmory    |            2 |    3501.5 |               4


-- From “tbl_stock” , List only the items that are more than Rs.1000/- per unit price//////
SELECT * FROM tbl_stock
WHERE int_price>1000;


 pk_int_stock_id | vrchr_name | int_quantity | int_price | fk_int_supplier
-----------------+------------+--------------+-----------+-----------------
               3 | Modem      |           10 |    1201.5 |               2
               4 | Memmory    |          100 |    1501.5 |               5
               6 | Memmory    |            2 |    3501.5 |               4

-- . From “tbl_stock” , List all the items sorted alphabetically./////

SELECT * FROM “tbl_stock”
ORDER BY vrchr_name;

 pk_int_stock_id | vrchr_name | int_quantity | int_price | fk_int_supplier
-----------------+------------+--------------+-----------+-----------------
               5 | Headphone  |           50 |     751.5 |               4
               2 | Keyboard   |            5 |     451.5 |               3
               4 | Memmory    |          100 |    1501.5 |               5
               6 | Memmory    |            2 |    3501.5 |               4
               3 | Modem      |           10 |    1201.5 |               2
               1 | Mouse      |           10 |     501.5 |               1


-- From “tbl_stock” ,List first 3 rows after sorted alphabetically///////
SELECT * FROM tbl_stock
ORDER BY vrchr_name
limit 3;

 pk_int_stock_id | vrchr_name | int_quantity | int_price | fk_int_supplier
-----------------+------------+--------------+-----------+-----------------
               5 | Headphone  |           50 |     751.5 |               4
               2 | Keyboard   |            5 |     451.5 |               3
               4 | Memmory    |          100 |    1501.5 |               5


-- From “tbl_stock” ,List last 3 rows/////////
SELECT * FROM tbl_stock
ORDER BY vrchr_name desc 
limit 3;


 pk_int_stock_id | vrchr_name | int_quantity | int_price | fk_int_supplier
-----------------+------------+--------------+-----------+-----------------
               1 | Mouse      |           10 |     501.5 |               1
               3 | Modem      |           10 |    1201.5 |               2
               4 | Memmory    |          100 |    1501.5 |               5



-- From “tbl_stock” ,List all the items with their extended price (int_quantity *
-- int_price)//////

select vrchr_name,int_quantity,int_price, int_quantity * int_price as Total from tbl_stock;

 vrchr_name | int_quantity | int_price | total
------------+--------------+-----------+--------
 Mouse      |           10 |     501.5 |   5015
 Keyboard   |            5 |     451.5 | 2257.5
 Modem      |           10 |    1201.5 |  12015
 Memmory    |          100 |    1501.5 | 150150
 Headphone  |           50 |     751.5 |  37575
 Memmory    |            2 |    3501.5 |   7003


--  Delete all the products of supplier named creative from 'tbl_stock'////////
DELETE FROM tbl_stock WHERE fk_int_supplier=5;
select * from tbl_stock;
 pk_int_stock_id | vrchr_name | int_quantity | int_price | fk_int_supplier
-----------------+------------+--------------+-----------+-----------------
               1 | Mouse      |           10 |     501.5 |               1
               2 | Keyboard   |            5 |     451.5 |               3
               3 | Modem      |           10 |    1201.5 |               2
               5 | Headphone  |           50 |     751.5 |               4
               6 | Memmory    |            2 |    3501.5 |               4

-- Insert values into 'tbl_dept' as shown in expected output image///////

INSERT INTO tbl_dept (vchr_dept_name,vchr_dept_description)
VALUES  ('Computer Sciense', 'CS'),
        ('Electronics', 'EC'),
        ('Commerse', 'CC'),
        ('Arts', 'AR');

select * from tbl_dept;
 pk_int_dept_id |  vchr_dept_name  | vchr_dept_description
----------------+------------------+-----------------------
              1 | Computer Sciense | CS
              2 | Electronics      | EC
              3 | Commerse         | CC
              4 | Arts             | AR

 