GO
--����ѧ����Ϣ��ͼ�����ڲ鿴�Լ�����
CREATE VIEW StudentInfo
AS 
SELECT DISTINCT 
	Student.SNO,
	SName,
	MajorID,
	ClassID,
	CourseID,
	Grade,
	IsResit
FROM
	Student, StudentGrade
WHERE
	Student.SNO = StudentGrade.SNO;
GO



GO
--�����γ���Ϣ��ͼ�����ڲ鿴�Լ�����
CREATE VIEW CourseInfo
AS 
SELECT DISTINCT
	Rules.MajorID,
	Course.CourseID,
	CourseName,
	CourseNature,
	CourseSchedule,
	CourseCredit
FROM
	Course, Rules
WHERE
	Course.CourseID = Rules.CourseID;
GO



GO
--������ʦ��Ϣ��ͼ
--����ֱ�Ӳ�ѯ��ʦ��ѧ��Щ�༶��Щ��
CREATE VIEW TeacherInfo
AS 
SELECT DISTINCT 
	Teacher.TeacherID,
	TeacherName,
	ClassID
	CourseID,
	CourseName
FROM
	Teacher, Teach, Course
WHERE
	Teach.TeacherID = Teacher.TeacherID AND
	Teach.CourseID = Course.CourseID;
GO



GO
--����ѧ��ѡ����Ϣ��ͼ����Ϊȫ�棬��ѧ���ĳɼ���
--����ͼ����ѧ����Ϣ��ͼ����
CREATE VIEW Transcript
AS
SELECT
	SNO,
	SName, 
	CourseName, 
	CourseNature, 
	CourseSchedule,
	CourseCredit, 
	Grade,
	IsResit
FROM 
	StudentInfo, CourseInfo
WHERE
	StudentInfo.CourseID = CourseInfo.CourseID AND
	StudentInfo.MajorID = CourseInfo.MajorID;
GO



GO
--����ѧ�����޿ιҿ���ͼ
--���ڲ�ѯ
CREATE VIEW RequiredCredit
AS
SELECT
	SNO,
	SName,
	SUM(CourseCredit) 'RequiredFail'
FROM 
	Transcript
WHERE
	CourseNature = '����' AND
	IsResit = '��' AND
	Grade < 60
GROUP BY SNO, SName;
GO



GO
--����ѧ��ѡ�޿ιҿ���ͼ
--���ڲ�ѯ
CREATE VIEW ElectiveCredit
AS
SELECT
	SNO,
	SName,
	SUM(CourseCredit) 'ElectiveFail'
FROM 
	Transcript
WHERE
	CourseNature = 'ѡ��' AND
	IsResit = '��' AND
	Grade < 60
GROUP BY SNO, SName;
GO