CREATE TABLE Account (
    Account_Id VARCHAR(9) NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL CHECK (Email LIKE '%@%'),
    Password VARCHAR(100) NOT NULL,
    Address VARCHAR(100) NULL,
    Type VARCHAR(15) NOT NULL CHECK (Type IN ('Customer', 'Admin')),
    CONSTRAINT PK_Account PRIMARY KEY (Account_Id)
);

CREATE TABLE Record (
    Product_Id VARCHAR(9) NOT NULL,
    Record_Name VARCHAR(100) NOT NULL,
    Artist VARCHAR(100) NOT NULL,
    Genre VARCHAR(100) NOT NULL CHECK (Genre IN ('Rock', 'Pop', 'RNB', 'Jazz')),
    Price DECIMAL NOT NULL CHECK (Price >= 1),
    Stock INT NOT NULL CHECK (Stock >= 0),
    Description VARCHAR(1000),
    Record_Image Image,
    CONSTRAINT PK_Record PRIMARY KEY (Product_Id)

);

CREATE TABLE Cart (
    Cart_Id VARCHAR(9) NOT NULL,
    Account_Id VARCHAR(9) NOT NULL,
    Date_Added DATE NOT NULL,
    Quantity INT NOT NULL,
    Product_Id VARCHAR(9),
    Subtotal DECIMAL NOT NULL CHECK (Subtotal >=1),
    CONSTRAINT PK_Cart PRIMARY KEY (Cart_Id),
    CONSTRAINT FK_Cart_Record FOREIGN KEY (Product_Id) REFERENCES Record(Product_Id),
    CONSTRAINT FK_Cart_Account FOREIGN KEY (Account_Id) REFERENCES Account(Account_Id));

CREATE TABLE OrderLog (
    Order_Id VARCHAR(9) NOT NULL,
    Date_Ordered DATE NOT NULL DEFAULT GETDATE(),
    Product_Id VARCHAR(9) NOT NULL,
    Account_Id VARCHAR(9) NOT NULL,
    Quantity INT NULL,
    Subtotal DECIMAL NOT NULL CHECK (Subtotal >=1),
    CONSTRAINT PK_Order_Id PRIMARY KEY (Order_Id),
    CONSTRAINT FK_Order_Record FOREIGN KEY (Product_Id) REFERENCES Record(Product_Id),
    CONSTRAINT FK_Order_Account FOREIGN KEY (Account_Id) REFERENCES Account(Account_Id),
);
