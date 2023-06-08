Create Table Address(Address_Id INTEGER,
                     StreetName VARCHAR(50),
                     City VARCHAR(50),
                     State VARCHAR(40),
                     Postal_Code INTEGER,
                     PRIMARY KEY(Address_Id)
                      );
Insert Into Address Values(5001,'100 East Ave','San Marcos','Texas',78666);
Insert Into Address Values(5002,'250 West Ave','Dallas','Texas',68676);
Insert Into Address Values(5003,'110 Wall Street','San Diego','California',65756);
Insert Into Address Values(5004,'140 New Street','San Francisco','California',65764);
Insert Into Address Values(5005,'230 New Street','San Jose','California',87786);

Insert Into Address Values(5006,'2414 South LBJ','San Marcos','Texas',78666);
Insert Into Address Values(5007,'1885 S IH 35','San Marcos','Texas',78666);
Insert Into Address Values(5008,'506 FM 306','Canyon Lake','Texas',78133);
Insert Into Address Values(5009,'512 Harkey Ave','Pearland','Texas',77581);
Insert Into Address Values(5010,'805 FM 518','Pearland','Texas',78581);


Create Table Membership(Mem_Id INTEGER,
                        PlanType VARCHAR(20),
                        PRIMARY KEY(Mem_Id));

Insert Into Membership Values(12001,'Basic');
Insert Into Membership Values(12002,'Standard');
Insert Into Membership Values(12003,'Premium');


Create Table Features(User_Feature_Id INTEGER,
                      Feature_Type VARCHAR(50),
                      Mem_Id INTEGER,
                      PRIMARY KEY(User_Feature_Id),
                      Foreign Key(Mem_Id) References Membership(Mem_Id) on delete set null);


Insert Into Features Values(13001,'contact_info',12001);
Insert Into Features Values(13002,'Count_Of_Connections',12001);
Insert Into Features Values(13003,'Access to Connect Pay',12001);
Insert Into Features Values(13004,'Access of reviews',12002);
Insert Into Features Values(13005,'Real TIme Review',12002);
Insert Into Features Values(13006,'Phone No',12002);
Insert Into Features Values(13007,'Counnections',12003);
Insert Into Features Values(13008,'Connect_Pay',12003);
Insert Into Features Values(13009,'Appointments',12003);


Create Table Customer(User_Id INTEGER,
                      Name VARCHAR(50),
                      Email_Id VARCHAR(80),
                      Contact VARCHAR(10),
                      Password VARCHAR(16),
                      Approval VARCHAR(10),
                      StartDate VARCHAR(16),
                      EndDate VARCHAR(16),
                      Mem_Feature_Id INTEGER,
                      CardNumber VARCHAR(50),
                      ExpiryDate VARCHAR(16),
                      CVV INTEGER,
                      Address_Id INTEGER,
                      PRIMARY KEY(User_Id),
                      Foreign Key(Address_Id) References Address(Address_Id) on delete set null,
                      Foreign Key(Mem_Feature_Id) References Membership(Mem_Id));
                      
Insert Into Customer Values(1024,'Robert','robert@gmail.com','9876578977','re1234','True','06/26/2021','09/27/2021',12001,'5432678987654400','12/22',847,5002);

Insert Into Customer Values(1025,'Rob','rob@gmail.com','9878987891','rob1235','True','08/31/2021','12/31/2021',12002,'5464546535363512','1/24',452,5003);

Insert Into Customer Values(1026,'Bob','bob@gmail.com','7896541234','bob1237','True','07/29/2021','11/11/2021',12001,'2341867509871230','2/26',442,5004);

Insert Into Customer Values(1027,'Albert','albert@gmail.com','9867143222','albert123','True','08/21/2021','11/12/2021',12001,'1290364537469876','3/27',467,5005);

Insert Into Customer Values(1028,'Thomas','thomas@gmail.com','9871625437','thomas1234','True','09/22/2021','01/01/2022',12003,'2901376574569000','4/25',787,5006);


Create Table Business(Business_Id INTEGER,
                      Business_Name VARCHAR(25),
                      Description VARCHAR(200),
                      StartDate VARCHAR(16),
                      EndDate VARCHAR(16),
                      Mem_Feature_Id INTEGER,
                      Address_Id INTEGER,
                      Email_Id VARCHAR(80),
                      Password VARCHAR(16),
                      Category VARCHAR(40),
                      Approval VARCHAR(10),
                      CardNumber VARCHAR(50),
                      ExpiryDate VARCHAR(16),
                      CVV INTEGER,
                      PRIMARY KEY(Business_Id),
                      Foreign Key(Address_Id) References Address(Address_Id) on delete set null,
                      Foreign Key(Mem_Feature_Id) References Membership(Mem_Id));

Insert Into Business Values(2001,'Billys Lawn Care','Billys lawn Care provides regular lawn maintenance,landscaping,brush removal, and land clearing.','06/27/2021','09/29/2021',12002,5001,'billys@gmail.com','bill1234','Lawn Care','True','4567456734567890','12/25','453');

Insert Into Business Values(2002,'Billys Lawn Care','Billy''s'' lawn care provides regular lawn maintenance, landscaping, brush removal, and land clearing.','06/27/2021','09/29/2021',12003,5001,'billys@gmail.com','bill1234','Lawn Care','True','4567456734567890','12/25','453');

Insert Into Business Values(2003,'Pearland Auto','Pearland Auto provides general automotive repair services including brakes,shocks,tune-ups,A/C,etc','08/29/2021','12/28/2021',12001,5001,'Pearlandauto@gmail.com','pearl12543','Automotive','True','9780786742310091','11/27','415');

Insert Into Business Values(2004,'Cool Breeze HVAC','Cool Breeze HVAC provides residential and commercial HVAC installations,repairs and maintenance services o the Pearland and surrounded areas.','06/23/2021','11/25/2021',12003,5001,'coolbreezehvac@gmail.com','hvac12345','HVAC Maintenance','True','9087857689074213','12/25','345');

Insert Into Business Values(2005,'Robert Gift Store','The Store has different varities of gifts and man made art works that can be gifted to a person','7/24/2021','12/13/2021',12002,5001,'robertgifts@gmail.com','roberts3456','Gifts & Occasions','True','9878686767667871','2/23','343');


Create Table Business_Roles(Role_Id INTEGER,
                            Business_Id INTEGER,
                            Business_Role VARCHAR(30),
                            EmployeeName Varchar(20),
                            Email_Id VARCHAR(30),
                            Contact VARCHAR(30),
                            PRIMARY KEY(Role_Id),
                            FOREIGN KEY(Business_Id) References Business(Business_Id) on delete set null);


Insert Into Business_Roles Values(10001,2001,'Front Desk Assistant','Ramu','ramu@gmail.com','8790678541');
Insert Into Business_Roles Values(10002,2001,'Technical Worker','Ricky','ricky@gmail.com','9556661234');
Insert Into Business_Roles Values(10003,2001,'CEO','Michael','ram@gmail.com','8765905431');
Insert Into Business_Roles Values(10004,2001,'Accountant','Mike','mike@gmail.com','8974561432');
Insert Into Business_Roles Values(10005,2001,'Charted Accountant','Ram','ram@gmail.com','8174561432');

Create Table Services(Service_Id INTEGER,
                      Service_Name VARCHAR(30),
                      Business_Id INTEGER,
                      Category VARCHAR(30),
                      Reviews_Count INTEGER,
                      Duration_Of_Service VARCHAR(50),
                      PRIMARY KEY(Service_Id),
                      FOREIGN KEY(Business_Id) References Business(Business_Id) on delete set null);


Insert Into Services Values(4001,'Lawn Service General',2001,'LawnCare',40,'2hours');
Insert INTO Services Values(4002,'Waste Services',2002,'Resedential',23,'1hour');
Insert INTO Services Values(4003,'Waste Services',2002,'Commercial',23,'2hours');
Insert INTO Services Values(4004,'Automotive',2003,'Parts',12,'24hours');
Insert INTO Services Values(4005,'Automotive',2003,'Transmission',15,'24hours');
Insert INTO Services Values(4006,'Automotive',2004,'Used Sales',20,'12hours');
Insert INTO Services Values(4007,'Gifts & Occasions',2005,'Arts & Photos',35,'A day to delivery');


Create Table Customer_Clicks(Click_Id INTEGER,
                             Number_Of_Clicks INTEGER,
                             Count_Favourites INTEGER,
                             Location_Of_User VARCHAR(30),
                             Advertisement_Views INTEGER,
                             PRIMARY KEY(Click_Id));


Insert Into Customer_Clicks Values(6001,20,10,5002,4);
Insert Into Customer_Clicks Values(6002,24,11,5003,5);
Insert Into Customer_Clicks Values(6003,15,14,5004,6);
Insert Into Customer_Clicks Values(6004,12,17,5004,7);
Insert Into Customer_Clicks Values(6005,13,17,5003,7.6);
Insert Into Customer_Clicks Values(6006,13,17,5003,7.6);

Create Table Messages(Qsn_Id INTEGER,
                       Service_Id INTEGER,
                       User_Id INTEGER,
                       Question VARCHAR(200),
                       Answer VARCHAR(150),
                       Status Varchar(25),
                       PRIMARY KEY(Qsn_Id),
                       Foreign Key(Service_Id) References Services(Service_Id) on delete set null);

Insert Into Messages Values(7001,4001,1024,'What kind of chemicals you are using?','Phenyl,Lizol,Dettol','Answered');
Insert Into Messages Values(7002,4001,1025,'What kind of chemicals you are using?','Phenyl,Lizol,Dettol','Answered');
Insert Into Messages Values(7003,4001,1026,'What kind of chemicals you are using?','Phenyl,Lizol,Dettol','Answered');
Insert Into Messages Values(7004,4001,1025,'What kind of chemicals you are using?','Phenyl,Lizol,Dettol','Answered');
Insert Into Messages Values(7005,4001,1025,'What kind of chemicals you are using?','Phenyl,Lizol,Dettol','Answered');

Create Table WDT_Employees_admin(Super_User_Id INTEGER,
                                 Username VARCHAR(35),
                                 Contact VARCHAR(25),
                                 Role VARCHAR(20),
                                 Manger_Id INTEGER,
                                 PRIMARY KEY(Super_User_Id));


Insert Into WDT_Employees_admin Values(8001,'Ramleela','9676768712','CustomerSupport',8002);
Insert Into WDT_Employees_admin Values(8050,'Ramesh','8967671231','Customer Support',8002);
Insert Into WDT_Employees_admin Values(8003,'RaviTeja','9087656712','Customer Support',8002);
Insert Into WDT_Employees_admin Values(8051,'Ramleela','9676768712','CustomerSupport',8018);
Insert Into WDT_Employees_admin Values(8052,'Ramesha','8967671231','Customer Support',8018);
Insert Into WDT_Employees_admin Values(8053,'Ravi','9087656712','Customer Support',8018);
Insert Into WDT_Employees_admin Values(8054,'Rakulpreet','8976078912','Customer Support',8018);
Insert Into WDT_Employees_admin Values(8018,'Akhil','9856412321','Manager',NULL);
Insert Into WDT_Employees_admin Values(8005,'Afreen','9786767612','Software Engineer',8010);
Insert Into WDT_Employees_admin Values(8006,'Razia','7675641231','Software Engineer',8010);
Insert INTO WDT_Employees_admin Values(8007,'Amanda','8987676261','Software Engineer',8010);
Insert Into WDT_Employees_admin Values(8008,'Rasika','9897867514','Software Developer',8011);
Insert Into WDT_Employees_admin Values(8009,'Anshuman','8979187123','Software Developer',8011);
Insert Into WDT_Employees_admin Values(8010,'Ankur','9856412321','Manager',NULL);
Insert Into WDT_Employees_admin Values(8011,'Vamshi','9132147612','Manager',NULL);
Insert Into WDT_Employees_admin Values(8002,'Deepika','5689124335','Manager',NULL);

Create Table Cart(Cart_Id INTEGER,
                  User_Id INTEGER,
                  Service_Name VARCHAR(55),
                  Rating FLOAT,
                  PRIMARY KEY(Cart_Id),
                  Foreign Key(User_Id) References Customer(User_Id) on delete set null);

Insert Into Cart Values(9001,1024,'LawnCare',8);
Insert Into Cart Values(9002,1025,'LawnCare',8.5);
Insert Into Cart Values(9003,1024,'Waste Services',7.5);
Insert Into Cart Values(9004,1026,'Automotive',9.5);
Insert Into Cart Values(9005,1027,'Automotive',9);



Create Table Recent_Access(Recent_View_Id INTEGER,
                           Service_Name VARCHAR(30),
                           Number_Of_Searches INTEGER,
                           Count_Of_Business INTEGER,
                           User_Id INTEGER,
                           PRIMARY KEY(Recent_View_Id),
                           Foreign Key(User_Id) References Customer(User_Id) on delete set null);

Insert Into Recent_Access Values(9501,'LawnCare',6,6,1024);
Insert Into Recent_Access Values(9502,'LawnCare',7,7,1025);
Insert Into Recent_Access Values(9503,'LawnCare',8,8,1026);
Insert Into Recent_Access Values(9504,'Automotive',9,9,1027);
Insert Into Recent_Access Values(9505,'Automotive',7,9,1024);

Create Table Reviews(Review_Id INTEGER,
                     Service_Id INTEGER,
                     Service_Name VARCHAR(30),
                     Review_Descripton VARCHAR(400),
                     Rating FLOAT,
                     PRIMARY KEY(Review_Id),
                     Foreign Key(Service_Id) References Services(Service_Id) on delete set null);


Insert Into Reviews Values(8501,4001,'Lawn Service General','Good Service',9);
Insert Into Reviews Values(8502,4002,'Waste Services','Good Service',10);
Insert Into Reviews Values(8503,4003,'Waste Services Commercial','Amazing',10);
Insert Into Reviews Values(8504,4003,'Waste Services Commercial','Great',8);
Insert Into Reviews Values(8505,4003,'Waste Services Commercial','Good',7);
Insert Into Reviews Values(8506,4004,'Automotive Parts','Good Service',9);
Insert Into Reviews Values(8507,4005,'Automotive Transmission','Good Service',10);
Insert Into Reviews Values(8508,4006,'Automotive Used Sales','Amazing',10);
Insert Into Reviews Values(8509,4005,'Automotive Tansmission','Great',8);
Insert Into Reviews Values(8510,4005,'Automotive Transmission','Good',7);
Insert Into Reviews Values(8511,4006,'Automotive Used Sales','Amazing',10);
Insert Into Reviews Values(8512,4005,'Automotive Tansmission','Great',8);
Insert Into Reviews Values(8513,4005,'Automotive Transmission','Good',7);
Insert Into Reviews Values(8514,4001,'Lawn Service General','Good Service',9);
Insert Into Reviews Values(8515,4002,'Waste Services','Good Service',10);
Insert Into Reviews Values(8516,4003,'Waste Services Commercial','Amazing',10);



Create Table Verifies(Business_Id INTEGER REFERENCES Business(Business_Id) on delete cascade,
                      Super_User_Id INTEGER REFERENCES WDT_Employees_admin(Super_User_Id) on delete cascade,
                      PRIMARY KEY(Business_Id,Super_User_ID));

Insert Into Verifies Values(2001,8001);
Insert Into Verifies Values(2002,8003);
Insert Into Verifies Values(2003,8004);
Insert Into Verifies Values(2004,8050);
Insert Into Verifies Values(2001,8005);
Insert Into Verifies Values(2003,8007);
Insert Into Verifies Values(2001,8008);
Insert Into Verifies Values(2001,8009);


Create Table Clicks(Click_Id INTEGER REFERENCES Customer_Clicks(Click_Id) on delete cascade,
                    User_Id INTEGER REFERENCES Customer(User_Id) on delete cascade,
                    PRIMARY KEY(Click_Id,User_Id));

Insert Into Clicks Values(6001,1024);
Insert Into Clicks Values(6002,1025);
Insert Into Clicks Values(6003,1026);
Insert Into Clicks Values(6004,1027);
Insert Into Clicks Values(6005,1027);
Insert Into Clicks Values(6006,1028);


Create Table Clicks(Click_Id INTEGER REFERENCES Customer_Clicks(Click_Id) on delete cascade,
                    User_Id INTEGER REFERENCES Customer(User_Id) on delete cascade,
                    PRIMARY KEY(Click_Id,User_Id));

Insert Into Clicks Values(6001,1024);
Insert Into Clicks Values(6002,1025);
Insert Into Clicks Values(6003,1026);
Insert Into Clicks Values(6004,1027);
Insert Into Clicks Values(6005,1027);
Insert Into Clicks Values(6006,1028);


Create Table Choose(User_Id INTEGER REFERENCES Customer(User_Id) on delete cascade,
                    Service_Id INTEGER REFERENCES Services(Service_Id) on delete cascade,
                    PRIMARY KEY(User_Id,Service_Id));

Insert Into Choose Values(1024,4001);
Insert Into Choose Values(1024,4002);
Insert Into Choose Values(1026,4003);
Insert Into Choose Values(1028,4004);
Insert Into Choose Values(1025,4006);
Insert Into Choose Values(1027,4005);
Insert Into Choose Values(1024,4007);
Insert Into Choose Values(1027,4001);
Insert Into Choose Values(1027,4002);

Create Table Helps(User_Id INTEGER REFERENCES Customer(User_Id) on delete cascade,
                   Super_User_Id INTEGER REFERENCES WDT_Employees_admin(Super_User_Id) on delete cascade,
                   PRIMARY KEY(User_Id,Super_User_Id));

Insert Into Helps Values(1024,8051);
Insert Into Helps Values(1025,8052);
Insert Into Helps Values(1026,8051);
Insert Into Helps Values(1027,8052);
Insert Into Helps Values(1028,8051);

Create Table Cust_review(Review_Id INTEGER REFERENCES Reviews(Review_Id) on delete cascade,
                         User_Id INTEGER REFERENCES Customer(User_Id) on delete cascade,
                         PRIMARY KEY(Review_Id,User_Id));

Insert Into Cust_review Values(8501,1024);
Insert Into Cust_review Values(8502,1025);
Insert Into Cust_review Values(8503,1024);
Insert Into Cust_review Values(8504,1026);
Insert Into Cust_review Values(8505,1025);
Insert Into Cust_review Values(8506,1024);
Insert Into Cust_review Values(8507,1025);
Insert Into Cust_review Values(8508,1027);
Insert Into Cust_review Values(8509,1026);
Insert Into Cust_review Values(8510,1025);
Insert Into Cust_review Values(8511,1024);
Insert Into Cust_review Values(8512,1028);
Insert Into Cust_review Values(8513,1027);
Insert Into Cust_review Values(8514,1027);
Insert Into Cust_review Values(8515,1028);



Create Table Cust_Ques(Qsn_Id INTEGER REFERENCES Messages(Qsn_Id) on delete cascade,
                       User_Id INTEGER REFERENCES Customer(User_Id) on delete cascade,
                       PRIMARY KEY(Qsn_Id,User_Id));


Insert Into Cust_Ques Values(7001,1024);
Insert Into Cust_Ques Values(7002,1025);
Insert Into Cust_Ques Values(7003,1026);
Insert Into Cust_Ques Values(7004,1025);
Insert Into Cust_Ques Values(7005,1025);

Create Table Cart_Category(Cart_Id Integer References Cart(Cart_Id) on delete cascade,
                           Service_Id INTEGER References Services(Service_Id) on delete cascade,
                           PRIMARY KEY(Cart_Id,Service_Id));

Insert Into Cart_Category Values(9001,4001);
Insert Into Cart_Category Values(9002,4001);
Insert Into Cart_Category Values(9003,4002);
Insert Into Cart_Category Values(9004,4004);
Insert Into Cart_Category Values(9005,4004);




Create View cust_rlink as select Customer.User_Id,Cust_review.Review_Id,Customer.Name,Customer.Email_Id
                                FROM Customer JOIN Cust_Review on Customer.User_Id=Cust_Review.User_Id
                                order by Customer.User_Id ASC;

Create View Reviews_Services as select Reviews.Review_Id,Services.Service_Id,Services.Service_Name,Services.Business_Id
                                  from Services JOIN Reviews on Reviews.Service_Id=Services.Service_Id;

Create View Reviews_Cust_link as select Reviews.Review_Id,cust_rlink.Name,cust_rlink.Email_Id,cust_rlink.User_Id,Reviews.Review_Descripton,Reviews.Rating
                                 From cust_rlink JOIN Reviews on Reviews.Review_Id=cust_rlink.Review_Id;


Create View Reviews_Business as select Reviews_Services.Review_Id,Business.Business_Id,Reviews_Services.Service_Id,Reviews_Services.Service_Name,Business.Business_Name
                                From Reviews_Services JOIN Business on Reviews_Services.Business_Id=Business.Business_Id;

Create View Reviews_Users as select Reviews_Cust_link.Name,Reviews_Business.Business_Name,Reviews_Business.Service_Name,Reviews_Cust_link.Review_Descripton,Reviews_Cust_link.Rating
                            From Reviews_Cust_link JOIN Reviews_Business on Reviews_Business.Review_Id=Reviews_Cust_link.Review_Id;

select * from Reviews_Users;


                                                                                                                                                                                              183,1         35%


                                                                                                                                                                                              1,1           Top
