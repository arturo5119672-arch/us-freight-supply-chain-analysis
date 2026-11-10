# us-freight-supply-chain-analysis
Analyzing U.S. freight transportation data to identify supply chain vulnerabilities, transportation dependencies, and regional freight patterns using SQL, Google Sheets, and Tableau.

# US Supply Chain Vulnerability & Freight Dependency Analysis

## Project Overview

This project analyzes U.S. freight transportation data from the Freight Analysis Framework (FAF6) to explore transportation dependencies, regional freight patterns, and potential supply chain vulnerabilities.

The analysis uses Google Sheets for initial data exploration, SQL (BigQuery) for data validation and analysis, and Tableau for data visualization.

## Initial Data Exploration — Google Sheets

Google Sheets was used to explore the FAF6 dataset and perform preliminary data quality checks before further SQL analysis.

### Methods
- Used SUM to calculate the total of the `tons_2022` column.
- Used AVERAGE to calculate the mean value per numeric record.
- Used COUNTIF to check for records with zero tonnage.
- Used MIN and MAX to examine the range of tonnage values.
- Explored freight transportation modes and their distribution.

### Preliminary Results
- Sum of `tons_2022`: 19,632,954.41
- Average `tons_2022` value: 32.75
- Minimum recorded value: 0.000001
- Maximum recorded value: 238,492.9794
- Records with exactly zero tonnage: 0

These results represent the data included in the working spreadsheet. Dataset units, coverage, and aggregation levels require further validation before drawing national-level conclusions.
