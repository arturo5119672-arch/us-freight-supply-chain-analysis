
-- FAF6: State Freight Dependency Analysis
-- Objective: Calculate the percentage of freight tonnage
-- originating in each state that is transported by truck.
-- Unit: Thousand tons (2022)

WITH freight_by_state AS (
  SELECT
    dms_origst,
    ROUND(SUM(tons_2022), 2) AS total_thousand_tons,
    ROUND(
      SUM(CASE WHEN dms_mode = 1 THEN tons_2022 ELSE 0 END),
      2
    ) AS truck_thousand_tons
  FROM `seismic-elf-479821-p4.freight_analysis.faf6_freight_data`
  WHERE dms_origst IS NOT NULL
  GROUP BY dms_origst
)

SELECT
  dms_origst,
  total_thousand_tons,
  truck_thousand_tons,
  ROUND(
    SAFE_DIVIDE(truck_thousand_tons, total_thousand_tons) * 100,
    2
  ) AS truck_share_pct
FROM freight_by_state
ORDER BY truck_share_pct DESC;
