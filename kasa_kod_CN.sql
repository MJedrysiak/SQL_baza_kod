CREATE DEFINER=`root`@`localhost` PROCEDURE `kasa_kod_CN`(
		IN kod_cn VARCHAR(20)
        )
BEGIN 
    
SELECT cn.ID_kod, 
		cn.kod_cn,
        cn.nazwa,
        kf.zwolnienie,
        kf.bezwzgledny_obowiazek,
        kf.uwagi
       FROM codes_CN cn
JOIN cash_register kf ON cn.ID_kod = kf.ID_kod
WHERE cn.kod_cn LIKE kod_cn;

END