# catalog
DELETE FROM Species WHERE Species.`Id` NOT IN (1);
DELETE FROM InbredSet WHERE NOT EXISTS (SELECT 1 FROM Species WHERE Species.`Id`=InbredSet.`SpeciesId`);
# geno
DELETE FROM GenoFreeze WHERE NOT EXISTS (SELECT 1 FROM InbredSet WHERE InbredSet.`Id`=GenoFreeze.`InbredSetId`);
DELETE FROM GenoXRef WHERE NOT EXISTS (SELECT 1 FROM GenoFreeze WHERE GenoFreeze.`Id`=GenoXRef.`GenoFreezeId`);
DELETE FROM Geno WHERE NOT EXISTS (SELECT 1 FROM Species WHERE Species.`Id`=Geno.`SpeciesId`);
DELETE FROM Geno WHERE NOT EXISTS (SELECT 1 FROM GenoXRef WHERE GenoXRef.`GenoId`=Geno.`Id`);
DELETE FROM GenoData WHERE NOT EXISTS (SELECT 1 FROM GenoXRef WHERE GenoXRef.`DataId`=GenoData.`Id`);
TRUNCATE TABLE GenoSE;
# expression
DELETE FROM ProbeFreeze WHERE NOT EXISTS (SELECT 1 FROM InbredSet WHERE InbredSet.`Id`=ProbeFreeze.`InbredSetId`);
DELETE FROM ProbeSetFreeze WHERE NOT EXISTS (SELECT 1 FROM ProbeFreeze WHERE ProbeFreeze.`Id`=ProbeSetFreeze.`ProbeFreezeId`);
DELETE FROM ProbeSetXRef WHERE NOT EXISTS (SELECT 1 FROM ProbeSetFreeze WHERE ProbeSetFreeze.`Id`=ProbeSetXRef.`ProbeSetFreezeId`);
DELETE FROM ProbeSet WHERE NOT EXISTS (SELECT 1 FROM ProbeSetXRef WHERE ProbeSetXRef.`ProbeSetId`=ProbeSet.`Id`);
DELETE FROM ProbeSetData WHERE NOT EXISTS (SELECT 1 FROM ProbeSetXRef WHERE ProbeSetXRef.`DataId`=ProbeSetData.`Id`);
DELETE FROM ProbeSetSE WHERE NOT EXISTS (SELECT 1 FROM ProbeSetXRef WHERE ProbeSetXRef.`DataId`=ProbeSetSE.`DataId`);
# pheno
DELETE FROM PublishFreeze WHERE NOT EXISTS (SELECT 1 FROM InbredSet WHERE InbredSet.`Id`=PublishFreeze.`InbredSetId`);
DELETE FROM PublishXRef WHERE NOT EXISTS (SELECT 1 FROM InbredSet WHERE InbredSet.`Id`=PublishXRef.`InbredSetId`);
DELETE FROM Phenotype WHERE NOT EXISTS (SELECT 1 FROM PublishXRef WHERE PublishXRef.`PhenotypeId`=Phenotype.`Id`);
DELETE FROM Publication WHERE NOT EXISTS (SELECT 1 FROM PublishXRef WHERE PublishXRef.`PublicationId`=Publication.`Id`);
DELETE FROM PublishData WHERE NOT EXISTS (SELECT 1 FROM PublishXRef WHERE PublishXRef.`DataId`=PublishData.`Id`);
DELETE FROM PublishSE WHERE NOT EXISTS (SELECT 1 FROM PublishXRef WHERE PublishXRef.`DataId`=PublishSE.`DataId`);
DELETE FROM NStrain WHERE NOT EXISTS (SELECT 1 FROM PublishXRef WHERE PublishXRef.`DataId`=NStrain.`DataId`);
# other
TRUNCATE TABLE `db_webqtl`.`AccessLog`;
TRUNCATE TABLE `db_webqtl`.`BXDSnpPosition`;
TRUNCATE TABLE `db_webqtl`.`CaseAttributeXRef`;
TRUNCATE TABLE `db_webqtl`.`CeleraINFO_mm6`;
DELETE FROM Chr_Length WHERE NOT EXISTS (SELECT 1 FROM Species WHERE Species.`Id`=Chr_Length.`SpeciesId`);
TRUNCATE TABLE `db_webqtl`.`EnsemblProbe`;
TRUNCATE TABLE `db_webqtl`.`EnsemblProbeLocation`;
TRUNCATE TABLE `db_webqtl`.`Genbank`;
TRUNCATE TABLE `db_webqtl`.`GeneList`;
TRUNCATE TABLE `db_webqtl`.`GeneList_rn3`;
TRUNCATE TABLE `db_webqtl`.`GeneList_rn33`;
TRUNCATE TABLE `db_webqtl`.`GeneRIF`;
TRUNCATE TABLE `db_webqtl`.`GeneRIF_BASIC`;
TRUNCATE TABLE `db_webqtl`.`GeneRIFXRef`;
TRUNCATE TABLE GORef;
TRUNCATE TABLE H2;
TRUNCATE TABLE Homologene;
TRUNCATE TABLE IndelAll;
TRUNCATE TABLE IndelXRef;
TRUNCATE TABLE LCorrRamin3;
TRUNCATE TABLE MachineAccessLog;
TRUNCATE TABLE News;
TRUNCATE TABLE Probe;
TRUNCATE TABLE ProbeData;
TRUNCATE TABLE ProbeH2;
TRUNCATE TABLE ProbeSE;
TRUNCATE TABLE ProbeXRef;
TRUNCATE TABLE pubmedsearch;
TRUNCATE TABLE role;
TRUNCATE TABLE roles_users;
TRUNCATE TABLE Sample;
TRUNCATE TABLE SampleXRef;
TRUNCATE TABLE SnpAll;
TRUNCATE TABLE SnpPattern;
TRUNCATE TABLE SnpPosition;
TRUNCATE TABLE SnpSource;
TRUNCATE TABLE SnpXRef;
DELETE FROM Strain WHERE NOT EXISTS (SELECT 1 FROM Species WHERE Species.`Id`=Strain.`SpeciesId`);
DELETE FROM StrainXRef WHERE NOT EXISTS (SELECT 1 FROM InbredSet WHERE InbredSet.`Id`=StrainXRef.`InbredSetId`);
TRUNCATE TABLE Temp;
TRUNCATE TABLE TempData;
TRUNCATE TABLE temporary;
TRUNCATE TABLE TissueProbeFreeze;
TRUNCATE TABLE TissueProbeSetData;
TRUNCATE TABLE TissueProbeSetFreeze;
TRUNCATE TABLE TissueProbeSetXRef;
TRUNCATE TABLE user_collection;
TRUNCATE TABLE user_openids;
TRUNCATE TABLE Vlookup;

# Optimize the tables, for releasing disk space after deleting data
# >mysqlcheck -uroot -p -o db_webqtl
