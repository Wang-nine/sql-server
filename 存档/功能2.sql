--����2
--��ѧ�š�������רҵ���ַ�ʽ��ѯѧ��������Ϣ
--��¼��һλѧ��������Ϊ���Լ���ѧ��Ϊ2022999
INSERT
INTO Student(SNO, SName, Ssex, SBirth, MajorID, ClassID)
VALUES (2022999, '����', '��', '2002/1/7', 'CS001', '202201');

--����ѧ�Ų�ѯ
SELECT *
FROM Student
WHERE SNO='2022999';

--����������ѯ
SELECT *
FROM Student
WHERE SNO='2022999';

--����רҵ��ѯ
SELECT *
FROM Student
WHERE MajorID='CS001';

--ɾ��¼��ѧ��
delete
FROM Student
WHERE SNO='2022999';