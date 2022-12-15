CREATE DATABASE IF NOT EXISTS QUANLYBANHANG;
USE QUANLYBANHANG;
CREATE TABLE Customer (
    cID INT PRIMARY KEY AUTO_INCREMENT,
    cName VARCHAR(50),
    cAge INT,
    CHECK (cAge > 0)
);

CREATE TABLE `Order` (
    oID INT PRIMARY KEY AUTO_INCREMENT,
    cID INT,
    oDate DATE,
    oTotalPrice FLOAT,
    FOREIGN KEY (cID)
        REFERENCES Customer (cID),
    CHECK (oTotalPrice > 0)
);

CREATE TABLE Product (
    pID INT PRIMARY KEY AUTO_INCREMENT,
    pName VARCHAR(50),
    pPrice FLOAT,
    CHECK (pPrice > 0)
);

CREATE TABLE OrderDetail (
    oID INT,
    pID INT,
    odQty INT,
    PRIMARY KEY (oID , pID),
    FOREIGN KEY (oID)
        REFERENCES `Order` (oID),
    FOREIGN KEY (pID)
        REFERENCES Product (pID)
);
