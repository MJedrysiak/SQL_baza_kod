CREATE DEFINER=`root`@`localhost` PROCEDURE `znajdz_relacje_pkwiu`(
	IN PKWIU VARCHAR(20) 
    )
BEGIN
SELECT 
	r.ID_kod,
	r.pkwiu2015,
	r.kody_cn,
	cn.nazwa,
	cn.sekcja,
	cn.dzial
from relations r 
JOIN codes_cn cn  ON r.kody_cn = cn.kod_cn
WHERE r.pkwiu2015 LIKE PKWIU;

END