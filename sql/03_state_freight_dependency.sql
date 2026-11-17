
-- ============================================================
-- Project: US Supply Chain Vulnerability & Freight Dependency
-- Dataset: Freight Analysis Framework (FAF6)
-- Analysis: State-Level Truck Freight Dependency
-- Year: 2022
-- Tools: Google BigQuery (SQL)
-- ============================================================

-- OBJECTIVE:
-- Calculate the percentage of freight tonnage transported
-- by truck for each U.S. origin state.
--
-- Enrich the results with state names using a LEFT JOIN
-- between freight data and a FIPS state lookup table.
--
-- NOTE:
-- Freight volumes are expressed in thousand tons.
-- Results are preliminary and require validation of
-- dataset coverage and aggregation before final conclusions.


-- STEP 1: Aggregate freight tonnage by origin state.

WITH freight_by_state AS (

    SELECT
        dms_origst,

        -- Total freight tonnage across transportation modes
        ROUND(
            SUM(tons_2022),
            2
        ) AS total_thousand_tons,

        -- Freight tonnage transported by truck
        ROUND(
            SUM(
                CASE
                    WHEN dms_mode = 1 THEN tons_2022
                    ELSE 0
                END
            ),
            2
        ) AS truck_thousand_tons

    FROM
        `seismic-elf-479821-p4.freight_analysis.faf6_freight_data`

    WHERE dms_origst IS NOT NULL

    GROUP BY dms_origst
)


-- STEP 2: Join freight data with state names.
-- LEFT JOIN preserves all origin-state records.

SELECT
    states.state_name,

    freight.dms_origst AS state_code,

    freight.total_thousand_tons,

    freight.truck_thousand_tons,

    -- Calculate truck dependency percentage
    ROUND(
        SAFE_DIVIDE(
            freight.truck_thousand_tons,
            freight.total_thousand_tons
        ) * 100,
        2
    ) AS truck_dependency_pct

FROM freight_by_state AS freight

LEFT JOIN
    `seismic-elf-479821-p4.freight_analysis.state_fips_lookup`
    AS states

ON freight.dms_origst = states.state_code

-- Rank origin states by truck dependency
ORDER BY truck_dependency_pct DESC;
