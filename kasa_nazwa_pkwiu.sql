CREATE DEFINER=`root`@`localhost` PROCEDURE `kasa_nazwa_pkwiu`(
		IN kod_pkwiu VARCHAR(20),
        IN produkt VARCHAR(50)
        )
BEGIN 
    IF kod_pkwiu IS NULL THEN
    SET kod_pkwiu = NOT NULL;
    END IF;
    IF produkt IS NULL THEN
	SET produkt = NOT NULL;
    END IF;
SELECT pkwiu2015.ID_kod, 
		pkwiu2015.kod_pkwiu,
        pkwiu2015.nazwa,
        kf.zwolnienie,
        kf.bezwzgledny_obowiazek,
        kf.uwagi
       FROM pkwiu2015
JOIN cash_register kf ON pkwiu2015.ID_kod = kf.ID_kod
WHERE pkwiu2015.kod_pkwiu LIKE kod_pkwiu
UNION
SELECT pkwiu2015.ID_kod, 
		pkwiu2015.kod_pkwiu,
        pkwiu2015.nazwa,
        kf.zwolnienie,
        kf.bezwzgledny_obowiazek,
        kf.uwagi
       FROM pkwiu2015
JOIN cash_register kf ON pkwiu2015.ID_kod = kf.ID_kod
WHERE pkwiu2015.nazwa LIKE produkt;

END