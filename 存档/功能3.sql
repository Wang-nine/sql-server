--����3
--¼��һλѧ��һ�ſεĳɼ�
--��¼��һλѧ��������Ϊ���Լ���ѧ��Ϊ2022999
INSERT
INTO Student(SNO, SName, Ssex, SBirth, MajorID, ClassID)
VALUES (2022999, '����', '��', '2002/1/7', 'CS001', '202201');


--¼��һλѧ��һ�ſεĳɼ�
INSERT
INTO StudentGrade(SNO, CourseID, Grade, IsResit)
VALUES (2022999, 'HA2113001', 100, '��');


--��ѯ�Ƿ���ȷ¼��γ���Ϣ
SELECT *
FROM Student,StudentGrade
WHERE Student.SNO=StudentGrade.SNO and StudentGrade.SNO=2022999;


--ɾ�������ѧ����Ϣ
--ɾ��ѧ���ɼ�
DELETE
FROM StudentGrade
WHERE SNO='2022999';

--ɾ��¼��ѧ��
DELETE
FROM Student
WHERE SNO='2022999';