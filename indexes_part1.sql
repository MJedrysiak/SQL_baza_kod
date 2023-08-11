
use kody;
CREATE INDEX ind_cn ON codes_cn(kod_cn);
CREATE INDEX ind_nazwa_CN ON codes_cn(nazwa);

CREATE INDEX ind_nazwa ON pkwiu2015(nazwa) ;
CREATE INDEX ind_kod_pkwiu ON pkwiu2015(kod_pkwiu);

CREATE INDEX ind_cn ON pkwiu_cn_list(cn);
CREATE INDEX ind_pkwiu ON pkwiu_cn_list(pkwiu);
CREATE INDEX ind_join ON pkwiu_cn_list(cn, pkwiu);


 
