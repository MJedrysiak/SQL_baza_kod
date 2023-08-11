CREATE DEFINER=`root`@`localhost` PROCEDURE `znajdz_wszystko_CN`(
	IN kod_CN VARCHAR(20)
)
BEGIN
SELECT 
	cn.ID_kod,
    cn.kod_cn,
    cn.nazwa,   
    vat.zwolnienie,
    vat.split_payment,
    vat.uwagi AS VAT_uwagi,
    kf.zwolnienie,
    kf.bezwzgledny_obowiazek,
    kf.uwagi AS Kasa_fiskalna_uwagi
from codes_cn cn
LEFT JOIN vat_obligations vat ON cn.id_kod = vat.id_kod
LEFT JOIN cash_register kf ON cn.id_kod = kf.id_kod
WHERE cn.kod_cn LIKE kod_cn ;
END