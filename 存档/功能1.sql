--����1
--¼��һλѧ����Ӧ����ѧ�š��������Ա𡢳������¡��༶����Ϣ
INSERT
INTO Student(SNO, SName, Ssex, SBirth, MajorID, ClassID)
VALUES (2022999, '����', '��', '2002/1/7', 'CS001', '202201');

--��ѯ��ѧ���Ƿ񱻳ɹ�¼��
SELECT *
FROM Student
WHERE SNO='2022999';

--ɾ��¼��ѧ��
DELETE
FROM Student
WHERE SNO='2022999';