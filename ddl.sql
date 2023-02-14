
--                             ////////////DDL///////

-- 1. Create a table named "tbl_stock" with columns as mentioned below.
-- “Pk_int_stock_id” should be auto incremented and set as primary Key.
-- a. * pk_int_stock_Id => integer
-- b. * vchr_name =>varchar
-- c. * int_quantity => integer
-- d. * int_price => integer



create table tbl_stock
(
pk_int_stock_id serial primary key,
vrchr_name varchar(30),
int_quantity int,
int_price int
);

 tbl_stock
                                              Table "public.tbl_stock"
     Column      |         Type          | Collation | Nullable |                      Default
-----------------+-----------------------+-----------+----------+----------------------------------------------------
 pk_int_stock_id | integer               |           | not null | nextval('tbl_stock_pk_int_stock_id_seq'::regclass)
 vrchr_name      | character varying(30) |           |          |
 int_quantity    | integer               |           |          |
 int_price       | integer               |           |          |



-- 2. Alter tbl_stock to change the data type of "int_price" to float

ALTER TABLE tbl_stock
ALTER COLUMN int_price type float;

-- 3. Write a query to create the table 'tbl_supplier' with below columns
-- * pk_int_supplier_id =>integer,primary key,auto increment
-- * vchr_supplier_name => varchar

create table tbl_supplier
(
pk_int_supplier_id serial primary key,
vrchr_supplier_name varchar(30)
);


 tbl_supplier
                                                  Table "public.tbl_supplier"
       Column        |         Type          | Collation | Nullable |                         Default
---------------------+-----------------------+-----------+----------+----------------------------------------------------------
 pk_int_supplier_id  | integer               |           | not null | nextval('tbl_supplier_pk_int_supplier_id_seq'::regclass)
 vrchr_supplier_name | character varying(30) |           |          |
Indexes:
    "tbl_supplier_pkey" PRIMARY KEY, btree (pk_int_supplier_id)

-- 4. Alter table named 'tbl_stock' and add one more column named 'fk_int_supplier'
-- with data type as 'integer'


ALTER TABLE tbl_stock
ADD fk_int_supplier int;

tbl_stock
                                              Table "public.tbl_stock"
     Column      |         Type          | Collation | Nullable |                      Default
-----------------+-----------------------+-----------+----------+----------------------------------------------------
 pk_int_stock_id | integer               |           | not null | nextval('tbl_stock_pk_int_stock_id_seq'::regclass)
 vrchr_name      | character varying(30) |           |          |
 int_quantity    | integer               |           |          |
 int_price       | double precision      |           |          |
 fk_int_supplier | integer               |           |          |
Indexes:
    "tbl_stock_pkey" PRIMARY KEY, btree (pk_int_stock_id)


-- Alter table named 'tbl_stock' to add foreign key constraint on the column
-- 'fk_int_supplier' which will point to the primary key of 'tbl_supplier' //////////////////////////

ALTER TABLE tbl_stock
ADD FOREIGN KEY (fk_int_supplier) REFERENCES tbl_supplier(pk_int_supplier_id);


-- Create a table named 'tbl_dept' with below columns
-- * pk_int_dept_id => integer, primary key, Auto increment
-- * vchr_dept_name => varchar

create table tbl_dept
(
pk_int_dept_id serial primary key,
vchr_dept_name varchar(30)
);

tbl_dept
                                             Table "public.tbl_dept"
     Column     |         Type          | Collation | Nullable |                     Default
----------------+-----------------------+-----------+----------+--------------------------------------------------
 pk_int_dept_id | integer               |           | not null | nextval('tbl_dept_pk_int_dept_id_seq'::regclass)
 vchr_dept_name | character varying(30) |           |          |
Indexes:
    "tbl_dept_pkey" PRIMARY KEY, btree (pk_int_dept_id)


-- 7. Create a table named 'tbl_classes' with below columns
-- * pk_int_class_id => integer, primary key, Auto increment
-- * vchr_class_name => varchar
-- * fk_int_dept_id => integer,
-- Foreign key points to the primary key of 'tbl_dept'/////////////


create table tbl_classes
(
pk_int_class_id serial primary key,
vchr_class_name varchar(30),
fk_int_dept_id int,
foreign key(fk_int_dept_id)references tbl_dept (pk_int_dept_id)on delete cascade on update cascade
);

tbl_classes
                                              Table "public.tbl_classes"
     Column      |         Type          | Collation | Nullable |                       Default
-----------------+-----------------------+-----------+----------+------------------------------------------------------
 pk_int_class_id | integer               |           | not null | nextval('tbl_classes_pk_int_class_id_seq'::regclass)
 vchr_class_name | character varying(30) |           |          |
 fk_int_dept_id  | integer               |           |          |
Indexes:
    "tbl_classes_pkey" PRIMARY KEY, btree (pk_int_class_id)
Foreign-key constraints:
    "tbl_classes_fk_int_dept_id_fkey" FOREIGN KEY (fk_int_dept_id) REFERENCES tbl_dept(pk_int_dept_id) ON UPDATE CASCADE ON DELETE CASCADE



-- . Create a table named 'tbl_enrollment' with below columns* pk_int_enrollment_id
-- => integer, primary key, Auto increment* int_count => int* fk_int_class_id =>
-- integer, Foreign key points to the primary key of 'tbl_classes'/////////////

create table tbl_enrollment
(
pk_int_enrollment_id serial primary key,
int_count int,
fk_int_class_id int,
foreign key(fk_int_class_id)references tbl_classes (pk_int_class_id)on delete cascade on update cascade
);


ecommerce=# \d tbl_enrollment
                                            Table "public.tbl_enrollment"
        Column        |  Type   | Collation | Nullable |                           Default
----------------------+---------+-----------+----------+--------------------------------------------------------------
 pk_int_enrollment_id | integer |           | not null | nextval('tbl_enrollment_pk_int_enrollment_id_seq'::regclass)
 int_count            | integer |           |          |
 fk_int_class_id      | integer |           |          |
Indexes:
    "tbl_enrollment_pkey" PRIMARY KEY, btree (pk_int_enrollment_id)
Foreign-key constraints:
    "tbl_enrollment_fk_int_class_id_fkey" FOREIGN KEY (fk_int_class_id) REFERENCES tbl_classes(pk_int_class_id) ON UPDATE CASCADE ON DELETE CASCADE


-- Alter table named 'tbl_classes' and add unique constraint to 'vchr_class_name'//////////

ALTER TABLE tbl_classes
ADD UNIQUE (vchr_class_name);

tbl_classes
                                              Table "public.tbl_classes"
     Column      |         Type          | Collation | Nullable |                       Default
-----------------+-----------------------+-----------+----------+------------------------------------------------------
 pk_int_class_id | integer               |           | not null | nextval('tbl_classes_pk_int_class_id_seq'::regclass)
 vchr_class_name | character varying(30) |           |          |
 fk_int_dept_id  | integer               |           |          |
Indexes:
    "tbl_classes_pkey" PRIMARY KEY, btree (pk_int_class_id)
    "tbl_classes_vchr_class_name_key" UNIQUE CONSTRAINT, btree (vchr_class_name)
Foreign-key constraints:
    "tbl_classes_fk_int_dept_id_fkey" FOREIGN KEY (fk_int_dept_id) REFERENCES tbl_dept(pk_int_dept_id) ON UPDATE CASCADE ON DELETE CASCADE
Referenced by:
    TABLE "tbl_enrollment" CONSTRAINT "tbl_enrollment_fk_int_class_id_fkey" FOREIGN KEY (fk_int_class_id) REFERENCES tbl_classes(pk_int_class_id) ON UPDATE CASCADE ON DELETE CASCADE


-- .Alter table named 'tbl_dept' to add a column called 'vchr_dept_description' with
-- varchar type//////////////////

ALTER TABLE tbl_dept
ADD vchr_dept_description varchar(100);


ecommerce=# \d tbl_dept
                                                 Table "public.tbl_dept"
        Column         |          Type          | Collation | Nullable |                     Default
-----------------------+------------------------+-----------+----------+--------------------------------------------------
 pk_int_dept_id        | integer                |           | not null | nextval('tbl_dept_pk_int_dept_id_seq'::regclass)
 vchr_dept_name        | character varying(30)  |           |          |
 vchr_dept_description | character varying(100) |           |          |
Indexes:
    "tbl_dept_pkey" PRIMARY KEY, btree (pk_int_dept_id)
Referenced by:
    TABLE "tbl_classes" CONSTRAINT "tbl_classes_fk_int_dept_id_fkey" FOREIGN KEY (fk_int_dept_id) REFERENCES tbl_dept(pk_int_dept_id) ON UPDATE CASCADE ON DELETE CASCADE

-- Insert Values into 'tbl_supplier' as shown in expected output image/////////////////


INSERT INTO tbl_supplier (vrchr_supplier_name)
VALUES ('Logitech'),('Samsung'),('Iball'),('Lg'),('Creative');

 select * from tbl_supplier;
 pk_int_supplier_id | vrchr_supplier_name
--------------------+---------------------
                  1 | Logitech
                  2 | Samsung
                  3 | Iball
                  4 | Lg
                  5 | Creative
(5 rows)

