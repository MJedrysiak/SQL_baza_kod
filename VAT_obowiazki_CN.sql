CREATE DEFINER=`root`@`localhost` PROCEDURE `VAT_obowiazki_CN`(
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
SELECT cn.ID_kod, 
		cn.kod_cn,
        cn.nazwa,
		vat.zwolnienie,
        vat.split_payment,
        vat.uwagi
       FROM codes_cn cn
JOIN vat_obligations vat ON cn.ID_kod = vat.ID_kod
WHERE cn.nazwa LIKE produkt

UNION

SELECT cn.ID_kod, 
		cn.kod_cn,
        cn.nazwa,
		vat.zwolnienie,
        vat.split_payment,
        vat.uwagi
       FROM codes_cn cn
JOIN vat_obligations vat ON cn.ID_kod = vat.ID_kod
WHERE cn.kod_cn LIKE kod;

END