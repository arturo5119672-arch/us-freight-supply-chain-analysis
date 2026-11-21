# US Supply Chain Vulnerability & Freight Dependency Analysis

## Project Overview

This project analyzes U.S. freight transportation patterns using 2022 Freight Analysis Framework (FAF6) data to explore transportation-mode dependency, regional freight concentration, and potential supply chain exposure.

The analysis combines Google Sheets, SQL (Google BigQuery), and Tableau to transform freight records into interpretable business insights.

## Business Questions

1. Which transportation modes handle the largest share of domestic freight tonnage?
2. Which states generate the highest truck freight volumes?
3. How does truck transportation dependency vary across states?
4. What potential supply chain risks could be associated with high truck dependency?

## Tools & Technologies

- **SQL / Google BigQuery:** Data aggregation, filtering, conditional calculations, and validation.
- **Google Sheets:** Initial exploratory analysis and descriptive statistics.
- **Tableau Public:** Geographic visualizations, freight comparisons, and interactive dashboards.
- **GitHub:** SQL documentation and project presentation.

## Data Source & Methodology

**Source:** Freight Analysis Framework (FAF6)

**Analysis year:** 2022

**Scope:** Domestic freight movements (`trade_type = 1`).

**Geographic aggregation:** State of origin (`dms_origst`).

**Measurement:** Freight tonnage, reported in thousands of tons.

Truck dependency is calculated as:

`Truck Dependency (%) = (Truck Freight Tonnage / Total Freight Tonnage) × 100`

The metric represents the share of domestic freight tonnage originating in a state and transported by truck. It does not measure all freight passing through the state's infrastructure.

## Data Exploration & Validation

Google Sheets was used for initial exploration, including SUM, AVERAGE, COUNTIF, MIN, and MAX calculations.

SQL validation in BigQuery confirmed:

- 155,016 domestic freight records.
- Zero exact duplicate rows within the domestic dataset.
- Consistent totals between state-level and transportation-mode aggregations.
- 51 geographic units covering the 50 states and Washington, D.C.
- Truck dependency percentages recalculated from the underlying freight volumes.

## Key Findings

### 1. Trucks Dominate Domestic Freight Tonnage

Truck transportation accounts for approximately **65.0%** of domestic freight tonnage in the analyzed dataset.

### 2. Texas Leads in Truck Freight Volume

Texas records approximately **1.18 billion tons** of originating truck freight, followed by California with approximately **920 million tons**.

### 3. Truck Dependency Varies Across States

Florida records a truck dependency rate of **91.41%**, while Wyoming records **14.82%**.

These differences highlight how transportation-mode composition varies geographically.

### 4. Pipeline and Rail Play Significant Roles

Pipeline and rail represent the second- and third-largest transportation categories by domestic freight tonnage, respectively.

### 5. Potential Supply Chain Implications

Regions with high truck dependency may face greater exposure to trucking-related disruptions, such as driver shortages, fuel-price changes, or highway interruptions.

However, freight tonnage alone does not establish actual supply chain vulnerability. Additional infrastructure, commodity, and transportation-capacity data would be required.

## Tableau Visualizations

Explore the published analysis:

https://public.tableau.com/app/profile/arturo.encarnacion/viz/state_truck_dependency_2022_csv_/TruckDependencybyState

The project includes:

- Truck Dependency by State
- Top 10 States by Truck Dependency
- Top 10 States by Truck Freight Volume
- Freight Volume by Transportation Mode

## Limitations

- The analysis uses 2022 data and does not represent current freight conditions.
- Results describe freight originating in each state, not all freight traveling through it.
- High transportation dependency indicates concentration, not necessarily disruption risk.
- The analysis measures tonnage rather than shipment value, costs, or transportation capacity.

## Conclusion

This project demonstrates how SQL, exploratory analysis, and data visualization can identify transportation dependencies and regional freight patterns.

The results provide a descriptive foundation for further supply chain risk assessment, while highlighting the importance of validating assumptions and clearly defining analytical metrics.
