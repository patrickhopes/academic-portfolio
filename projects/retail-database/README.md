# Retail Sales and Service Database

This academic group project models a consumer electronics retailer's sales and service operations. It connects business requirements to a relational database covering products, customers, stores, employees, orders, returns, warranties, and services.

## Files

| File | Contents |
| --- | --- |
| [database.sql](database.sql) | Original MySQL-style DDL, sample inserts, inspection queries, and store sales aggregation |
| [report.pdf](report.pdf) | Business requirements, business rules, conceptual and relational diagrams, implementation screenshots, and reporting examples |

## Technical scope

The SQL script creates 11 tables: supplier, category, warranty, store, customer, employee, product, orders, order_data, product_return, and service. It uses primary keys, foreign keys, a composite order-detail key, and cascading relationships. The store sales report joins stores, orders, and order details and calculates order counts, units sold, and gross sales.

The report additionally documents other business queries, views, and procedures with screenshots. Those additional view and procedure definitions are not included as executable code in the supplied SQL file.

## Run the supplied SQL

Use MySQL or MySQL Workbench with a new empty practice schema. Select that schema before running `database.sql`; the script itself does not create or select a database. Execute the script in order, then inspect the final store sales query. Re-running the full script in the same populated schema will encounter existing tables and IDs, so use a fresh schema for a repeat run.

The example customer email addresses use `example.com`, and phone numbers use the 555 range. This is a sample-data academic case study; the report's business description references Best Buy without implying an engagement with the company.

## Collaboration

IS 4420. Original contributors: Devin Stuelund, Janet Lopez, and Patrick Hopes. Individual responsibilities are not specified in the supplied files. Original team attribution is preserved.
