## Unapplied Activist Codes SQL Query

This SQL query retrieves unapplied activist codes from Phoenix (BigQuery). Unapplied activist codes are those for which there are no associated records in the related table.

## Prerequisites

- Phoenix access to the necessary tables: `demsXXsp.vansync.activist_codes`, `demsXXsp.vansync.contacts_activist_codes_myv`, `demsXXsp.vansync.committees_activist_codes`, and `demsXXsp.vansync.committees`.

## Usage

1. Make sure you have access to the necessary database and tables.
2. Replace `demsXXsp.vansync.activist_codes`, `demsXXsp.vansync.contacts_activist_codes_myv`, `demsXXsp.vansync.committees_activist_codes`, and `demsXXsp.vansync.committees` with the actual table names in your database.
3. Run the provided SQL query in your preferred SQL client or environment.

## Output

The query will provide a list of unapplied activist codes, categorized by 'My Voters' and 'My Campaign', along with relevant details.

## Notes

- This query assumes a specific database structure. Make sure to adapt it to your database schema if necessary.
- The query includes a `HAVING` clause to filter for unapplied codes based on the `qty` column and `is_active` condition.

Please replace the placeholders (`demsXXsp.vansync.activist_codes`, `demsXXsp.vansync.contacts_activist_codes_myv`, `demsXXsp.vansync.committees_activist_codes`, `demsXXsp.vansync.committees`, etc.) with the actual table names and database structure in your environment. Additionally, adjust the usage instructions and other details as needed to match your specific scenario.
