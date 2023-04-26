--����4
--��ѯһλѧ�����޵Ŀγ̡����ʣ����޻�ѡ�ޣ���ѧ�ڡ�ѧ�ּ��ɼ���
--����ͼ��ѯ��Ϊ����
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
	StudentInfo.SNO = '2022001' AND
	StudentInfo.CourseID = CourseInfo.CourseID AND
	StudentInfo.MajorID = CourseInfo.MajorID;


--��ѯ���ı��޿�ƽ���ɼ������пγ�ƽ���ɼ���ƽ���ɼ�Ӧ��ѧ�ּ�Ȩ��
--���޿�ƽ���ɼ�
SELECT
	SNO,
	SName,
	CONVERT(DECIMAL(10, 2), SUM(Grade*CourseCredit)*1.0/SUM(CourseCredit)) '���޿�ƽ���ɼ�'
FROM
	StudentInfo, CourseInfo
WHERE
	StudentInfo.SNO = '2022001' AND
	CourseNature = '����' AND
	StudentInfo.CourseID = CourseInfo.CourseID AND
	StudentInfo.MajorID = CourseInfo.MajorID
GROUP BY SNO, SName;

--���пγ�ƽ���ɼ�
SELECT
	SNO,
	SName,
	CONVERT(DECIMAL(10, 2), SUM(Grade*CourseCredit)*1.0/SUM(CourseCredit)) 'ƽ���ɼ�'
FROM
	StudentInfo, CourseInfo
WHERE
	StudentInfo.SNO = '2022001' AND
	StudentInfo.CourseID = CourseInfo.CourseID AND
	StudentInfo.MajorID = CourseInfo.MajorID
GROUP BY SNO, SName;