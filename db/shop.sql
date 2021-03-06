CREATE DATABASE shop
GO

USE Shop
GO

CREATE TABLE Category
(
	Category_ID int IDENTITY(1,1),
	Category_Name nvarchar(255) not null,
	PRIMARY KEY (Category_ID)
)
GO

CREATE TABLE Branch
(
	Branch_ID int IDENTITY(1,1),
	Branch_Name nvarchar(255) not null,
	Category_ID int,
	PRIMARY KEY (Branch_ID),
	FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID)
)
GO

CREATE TABLE Product
(
	Product_ID int IDENTITY(1,1),
	Product_Name nvarchar(255) not null,
	Product_Price money,
	Product_Image nvarchar(255),
	Product_Description nvarchar(1000),
	Brand nvarchar(255),
	Category_ID int,
	Branch_ID int,
	PRIMARY KEY (Product_ID),
	FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID),
	FOREIGN KEY (Branch_ID) REFERENCES Branch(Branch_ID)
)
GO

CREATE TABLE Account
(
	Account_ID int IDENTITY(1,1),
	UserName varchar(50) not null,
	User_Password varchar(50) not null,
	User_Role bit Default 1,
	PRIMARY KEY (Account_ID),
)
GO

CREATE TABLE Users
(
	Users_ID int IDENTITY(1,1),
	Name nvarchar(255),
	Email varchar(50),
	Phone varchar(20),
	Account_ID int,
	PRIMARY KEY (Users_ID),
	FOREIGN KEY (Account_ID) REFERENCES Account(Account_ID),
)
GO

CREATE TABLE Bill
(
	Bill_ID int IDENTITY(1,1),
	Receiver nvarchar(255),
	Receiver_Address nvarchar(255),
	Receiver_Phone varchar(20),
	Receiver_Date varchar(50),
	Bill_Date datetime,
	Bill_Status nvarchar(50) Default N'Chờ xác nhận',
	Payment nvarchar(50) Default N'Cash',
	Total money,
	Note nvarchar(255),
	Users_ID int,
	PRIMARY KEY (Bill_ID),
	FOREIGN KEY (Users_ID) REFERENCES Users(Users_ID),
)
GO

CREATE TABLE BillDetail
(
	BillDetail_ID int IDENTITY(1,1),
	Price money,
	Quantity int,
	Bill_ID int,
	Product_ID int,
	PRIMARY KEY (BillDetail_ID),
	FOREIGN KEY (Bill_ID) REFERENCES Bill(Bill_ID),
	FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
)
GO

--Record

-- Records of category

INSERT INTO Category VALUES (N'Nam')
INSERT INTO Category VALUES (N'Nữ')
INSERT INTO Category VALUES (N'Phụ Kiện')
INSERT INTO Category VALUES (N'Hàng Mới')

-- Records of branch

INSERT INTO Branch VALUES (N'Áo',1)
INSERT INTO Branch VALUES (N'Quần',1)
INSERT INTO Branch VALUES (N'Denim',1)

INSERT INTO Branch VALUES (N'Áo',2)
INSERT INTO Branch VALUES (N'Quần',2)
INSERT INTO Branch VALUES (N'Denim',2)

INSERT INTO Branch VALUES (N'Balo',3)
INSERT INTO Branch VALUES (N'Giày',3)
INSERT INTO Branch VALUES (N'Tất',3)

-- Records of Account

INSERT INTO Account VALUES ('admin','123',0)
INSERT INTO Account VALUES ('phuong','123',1)

-- Records of Users

INSERT INTO Users VALUES (N'Phương','phuong@gmail.com','0969934668',2)

-- Records of Product
--INSERT INTO Product(Product_Name,Product_Price,Product_Image,Product_Description,Brand,Category_ID,Branch_ID)
--nam
INSERT INTO Product VALUES (N'Áo len dài tay nam',600000,'images/products/nam/len1.jpg','','',1,1)
INSERT INTO Product VALUES (N'Áo khoác kaki nam',700000,'images/products/nam/len2.jpg','','',1,1)
INSERT INTO Product VALUES (N'Áo khoác nỉ nam',800000,'images/products/nam/len3.jpg','','',1,1)
INSERT INTO Product VALUES (N'Áo len dài tay nam',600000,'images/products/nam/len4.jpg','','',1,1)
INSERT INTO Product VALUES (N'Áo khoác kaki nam',700000,'images/products/nam/len5.jpg','','',1,1)
INSERT INTO Product VALUES (N'Áo khoác nỉ nam',800000,'images/products/nam/len6.jpg','','',1,1)
--nu
INSERT INTO Product VALUES (N'Áo len dài tay nữ',600000,'images/products/nu/len1.jpg','','',2,3)
INSERT INTO Product VALUES (N'Áo len dài tay nữ',700000,'images/products/nu/len2.jpg','','',2,3)
INSERT INTO Product VALUES (N'Áo len cổ lọ nữ',600000,'images/products/nu/len3.jpg','','',2,3)
INSERT INTO Product VALUES (N'Áo len dài tay nữ',600000,'images/products/nu/len4.jpg','','',2,3)
INSERT INTO Product VALUES (N'Áo len dài tay nữ',600000,'images/products/nu/len5.jpg','','',2,3)
INSERT INTO Product VALUES (N'Áo len dài tay nữ',600000,'images/products/nu/len6.jpg','','',2,3)



-- Records of Bill
--INSERT INTO Bill(Bill_ID,Receiver,Receiver_Address,Receiver_Phone,Receiver_Date,Bill_Date,Bill_Status,Payment,Total,Note,Users_ID)

INSERT INTO Bill (Receiver,Receiver_Address,Receiver_Phone,Bill_Date,Total,Note,Users_ID)
VALUES (N'Lê Tuấn Anh',N'Hà Nội','0947373672',getdate(),6000000,null,1)

-- Records of Bill_detail

INSERT INTO BillDetail VALUES (3000000,2,1,1)


select * from Bill
order by Bill_ID DESC

select * from BillDetail

select * from Branch

select * from Account

select * from Users

select * from Category

select * from Product

select top 3 * from Product 
order by Product_ID DESC
