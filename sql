CREATE TABLE CUSTOMER (
    CustID NUMBER PRIMARY KEY,
    Name VARCHAR2(50) NOT NULL,
    Address VARCHAR2(100),
    Phone VARCHAR2(20)
);

-- Create PRODUCT table
CREATE TABLE PRODUCT (
    ProdID NUMBER PRIMARY KEY,
    Description VARCHAR2(100) NOT NULL,
    Price NUMBER(10,2) NOT NULL,
    QtyOnHand NUMBER DEFAULT 0
);

-- Create ORDERS table
CREATE TABLE ORDERS (
    OrderID NUMBER PRIMARY KEY,
    CustID NUMBER,
    OrderDate DATE,
    CONSTRAINT fk_customer FOREIGN KEY (CustID) REFERENCES CUSTOMER(CustID)
);

-- Create ORDERLINE table
CREATE TABLE ORDERLINE (
    OrderID NUMBER,
    ProdID NUMBER,
    Qty NUMBER NOT NULL,
    CONSTRAINT pk_orderline PRIMARY KEY (OrderID, ProdID),
    CONSTRAINT fk_order FOREIGN KEY (OrderID) REFERENCES ORDERS(OrderID),
    CONSTRAINT fk_product FOREIGN KEY (ProdID) REFERENCES PRODUCT(ProdID)
);

-- Add Category column to PRODUCT table
ALTER TABLE PRODUCT ADD Category VARCHAR2(20);

-- Add OrderDate column to ORDERS table with SYSDATE as default
ALTER TABLE ORDERS ADD OrderDate DATE DEFAULT SYSDATE;