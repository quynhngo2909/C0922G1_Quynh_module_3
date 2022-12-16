CREATE DATABASE IF NOT EXISTS quan_ly_ban_hang;
USE quan_ly_ban_hang;
CREATE TABLE customer (
    c_id INT PRIMARY KEY AUTO_INCREMENT,
    c_name VARCHAR(50),
    c_age INT,
    CHECK (c_age > 0)
);

CREATE TABLE `order` (
    o_id INT PRIMARY KEY AUTO_INCREMENT,
    c_id INT,
    o_date DATE,
    o_total_price FLOAT,
    FOREIGN KEY (c_id)
        REFERENCES customer (c_id),
    CHECK (o_total_price > 0)
);

CREATE TABLE product (
    p_id INT PRIMARY KEY AUTO_INCREMENT,
    p_name VARCHAR(50),
    p_price FLOAT,
    CHECK (p_price > 0)
);

CREATE TABLE order_detail (
    o_id INT,
    p_id INT,
    od_qty INT,
    PRIMARY KEY (o_id , p_id),
    FOREIGN KEY (o_id)
        REFERENCES `order` (o_id),
    FOREIGN KEY (p_id)
        REFERENCES product (p_id)
);
