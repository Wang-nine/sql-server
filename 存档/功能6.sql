--功能6
--查询快要被开除的学生（距被开除差3学分之内）
--先查看挂过科的学生信息
SELECT DISTINCT 
	RequiredCredit.SName,
	RequiredCredit.SNO,
	RequiredCredit.RequiredFail,
	ElectiveCredit.ElectiveFail
FROM 
	RequiredCredit, ElectiveCredit
WHERE
	RequiredCredit.SNO = ElectiveCredit.SNO 

--进行搜索快被开除的学生信息
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