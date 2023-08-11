CREATE DEFINER=`root`@`localhost` PROCEDURE `znajdz_wszystko_produkt`(
	IN produkt VARCHAR(50)
)
BEGIN
SELECT 
	p.cn,
    cn.nazwa AS opis_CN, 	
	p.pkwiu,
    pkwiu2015.nazwa AS Opis_PKWiU,
    vat.zwolnienie,
    vat.split_payment,
    vat.uwagi AS VAT_uwagi,
    kf.zwolnienie,
    kf.bezwzgledny_obowiazek,
    kf.uwagi AS Kasa_fiskalna_uwagi
from pkwiu_cn_list p
LEFT JOIN vat_obligations vat ON p.id_kod = vat.id_kod
LEFT JOIN cash_register kf ON p.id_kod = kf.id_kod
LEFT JOIN pkwiu2015 ON p.id_kod = pkwiu2015.id_kod
LEFT JOIN codes_cn cn ON p.id_kod = cn.id_kod
WHERE cn.nazwa LIKE produkt or pkwiu2015.nazwa LIKE produkt
ORDER BY p.id_kod ASC ;
END