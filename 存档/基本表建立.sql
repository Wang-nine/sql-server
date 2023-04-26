--基本表的设置

--专业表
CREATE TABLE Major
(
	MajorID varchar(10) not null primary key,
	MajorName varchar(40) not null
);

--班级表
CREATE TABLE Class
(
	ClassID varchar(10) not null primary key,
	MajorID varchar(10) not null references Major(MajorID) 
);


--学生表
CREATE TABLE Student
(
	SNO int not null primary key,
	SName varchar(8) not null,
	Ssex varchar(2) not null, check(Ssex='男' or  Ssex='女'),
	SBirth varchar(20) not null,
	MajorID varchar(10) not null references Major(MajorID),
	ClassID varchar(10) not null references Class(ClassID)
);


--课程表
CREATE TABLE Course
(
	CourseID varchar(10) not null primary key,
	CourseName varchar(40) not null,
	CourseCredit int not null
);


--教师表
CREATE TABLE Teacher
(
	TeacherID int not null primary key,
	TeacherName varchar(8) not null
);


--专业规定表
CREATE TABLE Rules
(
	MajorID varchar(10) not null references Major(MajorID),
	CourseID varchar(10) not null references Course(CourseID),
	CourseNature varchar(8) not null, check(CourseNature='选修' or CourseNature='必修'),
	CourseSchedule varchar(20) not null,
	primary key(MajorID, CourseID)
)


--教师课程表
CREATE TABLE Teach
(
	CourseID varchar(10) not null references Course(CourseID),
	TeacherID int not null references Teacher(TeacherID),
	ClassID varchar(10) not null references Class(ClassID)
	primary key(TeacherID, ClassID)
);


--选课成绩表
CREATE TABLE StudentGrade
(
	SNO int not null references Student(SNO),
	CourseID varchar(10) not null references Course(CourseID),
	Grade int not null, check(Grade between 0 and 100),
	IsResit varchar(2) not null, check(IsResit='是' or IsResit='否'),
	primary key(SNO, CourseID)
);