CREATE DEFINER=`root`@`localhost` PROCEDURE `kasa_nazwa_cn`(
		IN kod VARCHAR(20),
		IN produkt VARCHAR(50)
        )
BEGIN 
    IF kod IS NULL THEN
    SET kod = NOT NULL;
    END IF;
    IF produkt IS NULL THEN
	SET produkt = NOT NULL;
    END IF;
SELECT cn.ID_kod, 
		cn.kod_cn,
        cn.nazwa,
		kf.zwolnienie,
        kf.bezwzgledny_obowiazek,
        kf.uwagi
       FROM codes_cn cn 
JOIN cash_register kf ON cn.ID_kod = kf.ID_kod
WHERE cn.nazwa LIKE produkt
UNION
SELECT cn.ID_kod, 
		cn.kod_cn,
        cn.nazwa,
        kf.zwolnienie,
        kf.bezwzgledny_obowiazek,
        kf.uwagi
       FROM codes_cn cn 
JOIN cash_register kf ON cn.ID_kod = kf.ID_kod
WHERE cn.kod_cn LIKE kod;
END