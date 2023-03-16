use PlantShop
go

--insert accounts
--values ('test@gmail.com','test','test','123456',1,0),
--('admin@gmail.com','admin','Administration','123456',1,1);

--insert into Categories
--values ('orchid'),
-- ('roses'),
-- ('others')

--insert into Plants
--values
--('vanda',100,'images/img1.jpg','this is a vanda',1,1),
--('white rose',90,'images/img4.jpg','this is a rose',1,2),
--('lan ho diep',70,'images/img2.jpg','hoa lan',1,1),
--('lan hai',140,'images/img3.jpg','hoa lan',1,1),
--('cay hoa hong cam',200,'images/img5.jpg','hoa hong',1,2),
--('monstera',80,'images/img6.jpg','cay la kieng',1,3),
--( 'var monstera',400,'images/img7.jpg','cay la kieng',1,3)

--select * from Accounts;

--update accounts set status = ? where email = ?

--update accounts set password = ?, fullname = ?,phone = ? where email = ?

--insert accounts
--values (?,?,?,?,?,?)

--select PID,PName, price, imgPath, description, status, Plants.CateID as CateID, CateName from Plants JOIN Categories ON Plants.CateID = Categories.CateID;

use CarManagement
GO

select userID, fullName,roleID,password from tblUsers

select * from tblCars