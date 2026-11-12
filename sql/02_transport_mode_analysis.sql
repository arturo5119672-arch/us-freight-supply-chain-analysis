-- Project: US Supply Chain Vulnerability & Freight Dependency Analysis
-- Analysis: Transportation Mode Distribution
-- Dataset: FAF6
-- Year: 2022

-- Query 1: Count freight records by transport mode

SELECT
    dms_mode,
    COUNT(*) AS total_records
FROM `seismic-elf-479821-p4.freight_analysis.faf6_freight_data`
GROUP BY dms_mode
ORDER BY total_records DESC;


-- Query 2: Calculate total tonnage by transport mode

SELECT
    dms_mode,
    ROUND(SUM(tons_2022), 2) AS total_tons
FROM `seismic-elf-479821-p4.freight_analysis.faf6_freight_data`
GROUP BY dms_mode
ORDER BY total_tons DESC;


-- Query 3: Compare freight records and total tonnage

SELECT
    dms_mode,
    COUNT(*) AS total_records,
    ROUND(SUM(tons_2022), 2) AS total_tons
FROM `seismic-elf-479821-p4.freight_analysis.faf6_freight_data`
GROUP BY dms_mode
ORDER BY total_tons DESC; 
