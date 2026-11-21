
-- Project: US Supply Chain Vulnerability & Freight Dependency Analysis
-- Analysis: Transportation Mode Distribution
-- Dataset: FAF6
-- Year: 2022
-- Scope: Domestic freight (trade_type = 1)

-- Query 1: Count domestic freight records by transport mode

SELECT
    dms_mode,
    COUNT(*) AS total_records
FROM
    `seismic-elf-479821-p4.freight_analysis.faf6_freight_data`
WHERE
    trade_type = 1
GROUP BY
    dms_mode
ORDER BY
    total_records DESC;


-- Query 2: Calculate domestic freight tonnage by transport mode

SELECT
    dms_mode,
    ROUND(SUM(tons_2022), 2) AS total_thousand_tons
FROM
    `seismic-elf-479821-p4.freight_analysis.faf6_freight_data`
WHERE
    trade_type = 1
GROUP BY
    dms_mode
ORDER BY
    total_thousand_tons DESC;


-- Query 3: Compare freight records and total tonnage

SELECT
    dms_mode,
    COUNT(*) AS total_records,
    ROUND(SUM(tons_2022), 2) AS total_thousand_tons
FROM
    `seismic-elf-479821-p4.freight_analysis.faf6_freight_data`
WHERE
    trade_type = 1
GROUP BY
    dms_mode
ORDER BY
    total_thousand_tons DESC;
