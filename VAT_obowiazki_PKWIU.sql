CREATE DEFINER=`root`@`localhost` PROCEDURE `VAT_obowiazki_PKWiU`(
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

SELECT  pkwiu2015.ID_kod, 
		pkwiu2015.kod_pkwiu,
        pkwiu2015.nazwa,
		vat.zwolnienie,
        vat.split_payment,
        vat.uwagi
       FROM pkwiu2015
JOIN vat_obligations vat ON pkwiu2015.ID_kod = vat.ID_kod
WHERE pkwiu2015.kod_pkwiu LIKE kod

UNION
SELECT pkwiu2015.ID_kod, 
		pkwiu2015.kod_pkwiu,
        pkwiu2015.nazwa,
		vat.zwolnienie,
        vat.split_payment,
        vat.uwagi
       FROM pkwiu2015
JOIN vat_obligations vat ON pkwiu2015.ID_kod = vat.ID_kod
WHERE pkwiu2015.nazwa LIKE produkt;

END