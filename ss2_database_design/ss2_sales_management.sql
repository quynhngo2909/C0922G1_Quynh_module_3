CREATE DATABASE IF NOT EXISTS quan_ly_ban_hang;
USE quan_ly_ban_hang;
CREATE TABLE customer (
    cID INT PRIMARY KEY AUTO_INCREMENT,
    cName VARCHAR(50),
    cAge INT,
    CHECK (cAge > 0)
);

CREATE TABLE `order` (
    oID INT PRIMARY KEY AUTO_INCREMENT,
    cID INT,
    oDate DATE,
    oTotalPrice FLOAT,
    FOREIGN KEY (cID)
        REFERENCES customer (cID),
    CHECK (oTotalPrice > 0)
);

CREATE TABLE product (
    pID INT PRIMARY KEY AUTO_INCREMENT,
    pName VARCHAR(50),
    pPrice FLOAT,
    CHECK (pPrice > 0)
);

CREATE TABLE order_detail (
    oID INT,
    pID INT,
    odQty INT,
    PRIMARY KEY (oID , pID),
    FOREIGN KEY (oID)
        REFERENCES `order` (oID),
    FOREIGN KEY (pID)
        REFERENCES product (pID)
);
