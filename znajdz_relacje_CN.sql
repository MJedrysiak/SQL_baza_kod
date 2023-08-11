CREATE DEFINER=`root`@`localhost` PROCEDURE `znajdz_relacje_cn`(
	IN CN_kod VARCHAR(20) )
BEGIN
SELECT 
r.ID_kod,
r.kody_cn,
r.pkwiu2015,
pkwiu2015.nazwa,
pkwiu2015.numer_poziomu
from relations r 
JOIN pkwiu2015  ON r.pkwiu2015 = pkwiu2015.kod_pkwiu 
WHERE r.kody_cn LIKE CN_kod;
END