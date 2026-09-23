#Clustered index - the order rows are physically stored in, in MySQL this is always the primary key
#Non-clustered index - a separate lookup structure you can add on other columns to speed up search

#a simple table to test with
CREATE TABLE sales_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100)
);

INSERT INTO sales_data (product_name) VALUES ('Laptop'), ('Keyboard');

#Explain shows how MySQL will run a query, without actually running it
EXPLAIN SELECT * FROM sales_data WHERE product_name = 'Laptop';

#adding an index makes searches on that column faster
CREATE INDEX idx_product_name ON sales_data(product_name);

#drop an index when it's no longer needed
DROP INDEX idx_product_name ON sales_data;

#Natural key - a real-world value used as the primary key
CREATE TABLE person_a (
    ssn CHAR(11) PRIMARY KEY,
    name VARCHAR(100)
);

#Surrogate key - a made-up id used as the primary key instead
CREATE TABLE person_b (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ssn CHAR(11),
    name VARCHAR(100)
);
