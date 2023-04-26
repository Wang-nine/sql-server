--����6
--��ѯ��Ҫ��������ѧ�����౻������3ѧ��֮�ڣ�
--�Ȳ鿴�ҹ��Ƶ�ѧ����Ϣ
SELECT DISTINCT 
	RequiredCredit.SName,
	RequiredCredit.SNO,
	RequiredCredit.RequiredFail,
	ElectiveCredit.ElectiveFail
FROM 
	RequiredCredit, ElectiveCredit
WHERE
	RequiredCredit.SNO = ElectiveCredit.SNO 

--���������챻������ѧ����Ϣ
SELECT DISTINCT 
	RequiredCredit.SName,
	RequiredCredit.SNO,
	RequiredCredit.RequiredFail,
	ElectiveCredit.ElectiveFail
FROM 
	RequiredCredit, ElectiveCredit
WHERE
	RequiredCredit.SNO = ElectiveCredit.SNO AND
	(
		RequiredFail >= 7 OR
		ElectiveFail >= 12
	);