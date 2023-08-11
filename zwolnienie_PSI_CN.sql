CREATE DEFINER=`root`@`localhost` PROCEDURE `zwolnienie_PSI_CN`(
		IN kod_cn VARCHAR(20) )
BEGIN
SELECT 
	r.ID_kod,
	r.kody_cn,
	r.pkwiu2015,
	pkwiu2015.nazwa,
	pkwiu2015.numer_poziomu,
	psi.zwolnienie
from relations r 
JOIN pkwiu2015  ON r.pkwiu2015 = pkwiu2015.kod_pkwiu 
JOIN psi on r.ID_kod = psi.id_psi
WHERE r.kody_cn LIKE kod_cn;
END