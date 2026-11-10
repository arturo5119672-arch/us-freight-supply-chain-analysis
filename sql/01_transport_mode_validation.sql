-- Project: US Supply Chain Vulnerability & Freight Dependency Analysis
-- Analysis: Transport Mode Data Validation
-- Purpose: Investigate missing transportation mode names
-- and recover available names using transportation mode codes.

WITH transport_modes AS (
    SELECT DISTINCT
        mode_code,
        transport_mode_name
    FROM `seismic-elf-479821-p4.freight_analysis.faf6_freight_data`
    WHERE transport_mode_name IS NOT NULL
)

SELECT
    f.dms_mode,
    m.transport_mode_name,
    COUNT(*) AS total_records,
    ROUND(AVG(f.tons_2022), 2) AS avg_tons
FROM `seismic-elf-479821-p4.freight_analysis.faf6_freight_data` AS f
LEFT JOIN transport_modes AS m
    ON f.dms_mode = m.mode_code
WHERE f.transport_mode_name IS NULL
GROUP BY
    f.dms_mode,
    m.transport_mode_name
ORDER BY avg_tons DESC;
