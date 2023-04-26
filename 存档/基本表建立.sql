--�����������

--רҵ��
CREATE TABLE Major
(
	MajorID varchar(10) not null primary key,
	MajorName varchar(40) not null
);

--�༶��
CREATE TABLE Class
(
	ClassID varchar(10) not null primary key,
	MajorID varchar(10) not null references Major(MajorID) 
);


--ѧ����
CREATE TABLE Student
(
	SNO int not null primary key,
	SName varchar(8) not null,
	Ssex varchar(2) not null, check(Ssex='��' or  Ssex='Ů'),
	SBirth varchar(20) not null,
	MajorID varchar(10) not null references Major(MajorID),
	ClassID varchar(10) not null references Class(ClassID)
);


--�γ̱�
CREATE TABLE Course
(
	CourseID varchar(10) not null primary key,
	CourseName varchar(40) not null,
	CourseCredit int not null
);


--��ʦ��
CREATE TABLE Teacher
(
	TeacherID int not null primary key,
	TeacherName varchar(8) not null
);


--רҵ�涨��
CREATE TABLE Rules
(
	MajorID varchar(10) not null references Major(MajorID),
	CourseID varchar(10) not null references Course(CourseID),
	CourseNature varchar(8) not null, check(CourseNature='ѡ��' or CourseNature='����'),
	CourseSchedule varchar(20) not null,
	primary key(MajorID, CourseID)
)


--��ʦ�γ̱�
CREATE TABLE Teach
(
	CourseID varchar(10) not null references Course(CourseID),
	TeacherID int not null references Teacher(TeacherID),
	ClassID varchar(10) not null references Class(ClassID)
	primary key(TeacherID, ClassID)
);


--ѡ�γɼ���
CREATE TABLE StudentGrade
(
	SNO int not null references Student(SNO),
	CourseID varchar(10) not null references Course(CourseID),
	Grade int not null, check(Grade between 0 and 100),
	IsResit varchar(2) not null, check(IsResit='��' or IsResit='��'),
	primary key(SNO, CourseID)
);