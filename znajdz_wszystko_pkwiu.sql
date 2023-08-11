CREATE DEFINER=`root`@`localhost` PROCEDURE `znajdz_wszystko_PKWIU`(
	IN kod_pkwiu VARCHAR(50)
)
BEGIN
SELECT 
	pkwiu2015.ID_kod,
    pkwiu2015.kod_pkwiu,
    pkwiu2015.nazwa,   
    vat.zwolnienie,
    vat.split_payment,
    vat.uwagi AS VAT_uwagi,
    kf.zwolnienie,
    kf.bezwzgledny_obowiazek,
    kf.uwagi AS Kasa_fiskalna_uwagi,
    psi.zwolnienie AS zwolnienie_PSI
from pkwiu2015
LEFT JOIN vat_obligations vat ON pkwiu2015.id_kod = vat.id_kod
LEFT JOIN cash_register kf ON pkwiu2015.id_kod = kf.id_kod
LEFT JOIN psi ON pkwiu2015.id_kod = psi.id_psi
WHERE pkwiu2015.kod_pkwiu LIKE kod_pkwiu;
END