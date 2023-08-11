CREATE DEFINER=`root`@`localhost` PROCEDURE `kasa_kod_PKWiU`(
	IN kod_pkwiu VARCHAR(20)
        )
BEGIN 
    
SELECT pkwiu2015.ID_kod, 
		pkwiu2015.kod_pkwiu,
        pkwiu2015.nazwa,
        kf.zwolnienie,
        kf.bezwzgledny_obowiazek,
        kf.uwagi
       FROM pkwiu2015
JOIN cash_register kf ON pkwiu2015.ID_kod = kf.ID_kod
WHERE pkwiu2015.kod_pkwiu LIKE kod_pkwiu;

END