CREATE DATABASE IF NOT EXISTS ECE_569_;
USE ECE_569_;

DROP TABLE IF EXISTS NY_Trees_Data;
CREATE TABLE NY_Trees_Data (
    created_at    DATE,
    tree_id       INT,
    block_id      INT,
    the_geom      VARCHAR(500),
    tree_dbh      INT,
    stump_diam    INT,
    curb_loc      ENUM('OnCurb', 'OffsetFromCurb'),
    status        ENUM('Alive', 'Dead', 'Stump', 'Other'),
    health        ENUM('Good', 'Fair', 'Poor', ''),
    spc_latin     VARCHAR(255),
    spc_common    VARCHAR(255),
    steward       ENUM('None', '1or2', '3or4', '4orMore', ''),
    guards        ENUM('None', 'Helpful', 'Harmful', 'Unsure', ''),
    sidewalk      ENUM('Damage', 'NoDamage', ''),
    user_type     ENUM('Volunteer', 'TreesCount Staff', 'NYC Parks Staff'),
    problems      VARCHAR(500),
    root_stone    ENUM('No', 'Yes'),
    root_grate    ENUM('No', 'Yes'),
    root_other    ENUM('No', 'Yes'),
    trnk_wire     ENUM('No', 'Yes'),
    trnk_light    ENUM('No', 'Yes'),
    trnk_other    ENUM('No', 'Yes'),
    brnch_ligh    ENUM('No', 'Yes'),
    brnch_shoe    ENUM('No', 'Yes'),
    brnch_othe    ENUM('No', 'Yes'), 
    address       VARCHAR(255),
    zipcode       INT,
    zip_city      VARCHAR(255),
    cb_num        INT,
    borocode      INT,
    boroname      VARCHAR(255),
    cncldist      INT,
    st_assem      INT,
    st_senate     INT,
    nta           VARCHAR(10),
    nta_name      VARCHAR(255),
    boro_ct       INT,
    state         ENUM('New York', 'Other'),
    Latitude      DECIMAL(10, 8),
    Longitude     DECIMAL(11, 8),
    x_sp          DECIMAL(18, 8),
    y_sp          DECIMAL(18, 8)
);

LOAD DATA LOCAL INFILE 'C:\ProgramData\MySQL\MySQL Server 8.3\Uploads\2015StreetTreesCensus.csv'
INTO TABLE NY_Trees_Data
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES -- Skip the header if present
(@created_at, tree_id, block_id, the_geom, tree_dbh, stump_diam, curb_loc, status, health, spc_latin, spc_common, steward, guards, sidewalk, 
user_type, problems, root_stone, root_grate, root_other, trnk_wire, trnk_light, trnk_other, brnch_ligh, brnch_shoe, brnch_othe, address, zipcode, 
zip_city, cb_num, borocode, boroname, cncldist, st_assem, st_senate, nta, nta_name, boro_ct, state, Latitude, Longitude, x_sp, y_sp)
SET created_at = STR_TO_DATE(@created_at, '%m/%d/20%y');