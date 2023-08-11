CREATE DEFINER=`root`@`localhost` PROCEDURE `zwolnienie_PSI`(
		IN kod VARCHAR(50),
        IN produkt VARCHAR(50)
        )
BEGIN 
    IF kod IS NULL THEN
    SET kod = NOT NULL;
    END IF;
    IF produkt IS NULL THEN
	SET produkt = NOT NULL;
    END IF;
SELECT pkwiu2015.ID_kod, 
		pkwiu2015.kod_pkwiu,
	    pkwiu2015.nazwa,
		psi.zwolnienie
       FROM pkwiu2015
JOIN psi ON pkwiu2015.ID_kod = psi.ID_psi
WHERE pkwiu2015.nazwa LIKE produkt OR pkwiu2015.kod_pkwiu LIKE kod;

END