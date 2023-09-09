INSERT INTO `addon_account` (name, label, shared) VALUES 
	('society_lscustom','Ls Custom',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES 
	('society_lscustom', 'Ls Custom', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
	('society_lscustom','Ls Custom',1)
;

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('lscustom', 'Ls Custom', 1)
;

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	('lscustom', 0, 'stagiaire', 'Stagiaire', 30, '', ''),
	('lscustom', 1, 'mecano', 'Mecano', 50, '', ''),
	('lscustom', 2, 'copatron', 'Co Patron', 80, '', ''),
	('lscustom', 3, 'boss', 'Patron', 100, '', '')
