
-- -----------------------------------------------------
-- Table `kody`.`PKWiU_CN_List`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kody`.`PKWiU_CN_List` (
  `ID_kod` INT NOT NULL AUTO_INCREMENT,
  `PKWiU` VARCHAR(50) NOT NULL,
  `CN` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`ID_kod`),
  UNIQUE INDEX `ID_UNIQUE` (`ID_kod` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kody`.`PKWiU2015`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kody`.`PKWiU2015` (
  `ID_kod` MEDIUMINT NOT NULL,
  `kod_PKWiU` VARCHAR(50) NULL,
  `Nazwa` TEXT NOT NULL,
  `numer_poziomu` TINYINT NOT NULL,
  UNIQUE INDEX `ind_ID` (`ID_kod` ASC) INVISIBLE,
  PRIMARY KEY (`ID_kod`),
  UNIQUE INDEX `kod_PKWiU_UNIQUE` (`kod_PKWiU` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kody`.`Relations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kody`.`Relations` (
  `ID_kod` INT NOT NULL,
  `PKWiU2015` VARCHAR(50) NOT NULL,
  `Kody_CN` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`ID_kod`),
  UNIQUE INDEX `01_PKWiU_CN_List_ID_UNIQUE` (`ID_kod` ASC) VISIBLE,
  INDEX `PKWiU_idx` (`PKWiU2015` ASC) VISIBLE,
  INDEX `Kody_CN_idx` (`Kody_CN` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kody`.`Codes_CN`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kody`.`Codes_CN` (
  `ID_kod` INT NOT NULL,
  `Kod_CN` VARCHAR(50) NULL,
  `Nazwa` TEXT NOT NULL,
  `Sekcja` VARCHAR(10) NOT NULL,
  `Dzial` TINYINT NOT NULL,
  PRIMARY KEY (`ID_kod`),
  INDEX `fk_02_Kody_CN_03_PKWiU_CN_List1_idx` (`ID_kod` ASC) VISIBLE,
  UNIQUE INDEX `03_PKWiU_CN_List_ID_UNIQUE` (`ID_kod` ASC) VISIBLE,
  UNIQUE INDEX `Kod_CN_UNIQUE` (`Kod_CN` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kody`.`Sections_CN`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kody`.`Sections_CN` (
  `Dzial` TINYINT NOT NULL,
  `Nazwa` TEXT NOT NULL,
  UNIQUE INDEX `Dzial_UNIQUE` (`Dzial` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kody`.`cash_register`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kody`.`cash_register` (
  `ID_kod` INT NOT NULL,
  `Zwolnienie` VARCHAR(255) NULL,
  `Bezwzgledny_obowiazek` VARCHAR(255) NULL,
  `Uwagi` TEXT NULL,
  PRIMARY KEY (`ID_kod`),
  INDEX `fk_Kasa_fiskalna_01_PKWiU_CN_List1_idx` (`ID_kod` ASC) VISIBLE,
  UNIQUE INDEX `ID_KF_UNIQUE` (`ID_kod` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kody`.`VAT_obligations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kody`.`VAT_obligations` (
  `ID_kod` INT NOT NULL,
  `Zwolnienie` VARCHAR(255) NULL,
  `Split_payment` VARCHAR(255) NULL,
  `Uwagi` TEXT NULL,
  PRIMARY KEY (`ID_kod`),
  INDEX `fk_06VAT_obowiazki_01_PKWiU_CN_List1_idx` (`ID_kod` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kody`.`PSI`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kody`.`PSI` (
  `ID_psi` INT NOT NULL,
  `Zwolnienie` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`ID_psi`),
  UNIQUE INDEX `ID_PKWiU_UNIQUE` (`ID_psi` ASC) VISIBLE)
ENGINE = InnoDB;

