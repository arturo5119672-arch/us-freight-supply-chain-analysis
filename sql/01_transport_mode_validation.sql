
-- Project: US Supply Chain Vulnerability & Freight Dependency Analysis
-- Analysis: Transportation Mode Validation
-- Dataset: FAF6, Domestic Freight, 2022

SELECT
    dms_mode,
    CASE dms_mode
        WHEN 1 THEN 'Truck'
        WHEN 2 THEN 'Rail'
        WHEN 3 THEN 'Water'
        WHEN 4 THEN 'Air (includes truck-air)'
        WHEN 5 THEN 'Multiple Modes & Mail'
        WHEN 6 THEN 'Pipeline'
        WHEN 7 THEN 'Other & Unknown'
        ELSE 'Unclassified'
    END AS transportation_mode,
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
