CREATE TABLE techsubjects
(
	subjectid int identity primary key,
	technology nvarchar(50) not null
)
GO
CREATE TABLE instructors
(
	instructorid int identity primary key,
	istructorname nvarchar(50) not null,
	email nvarchar(50) not null,
	phone nvarchar(25) not null
)
GO
CREATE TABLE courses
(
	courseid int identity primary key,
	title nvarchar(150) not null,
	totalclass int not null,
	weeklyclass int not null,
	classduration int not null,
	fee money not null,
	available bit,
	instructorid int not null references instructors (instructorid)
)
GO
CREATE TABLE instructorsubjects
(
	instructorid int not null references instructors (instructorid),
	subjectid int not null references techsubjects (subjectid),
	primary key (instructorid,subjectid)
)
GO
CREATE TABLE [batches]
(
	batchid int identity primary key,
	startdate date not null,
	courseid int not null references courses (courseid)
)
GO
CREATE TABLE students
(
	studentid int identity primary key,
	studentname nvarchar(30) not null,
	phone nvarchar(25) not null,
	picture nvarchar(150) not null,
	batchid int not null references [batches] (batchid)
)
GO