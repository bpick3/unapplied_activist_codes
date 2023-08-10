WITH Common AS (
    SELECT
        a.activist_code_id,
        a.activist_code_name,
        a.activist_code_description,
        a.is_active,
        a.report_question,
        a.created_by_committee_id,
        c.committee_name,
        a.datetime_created,
        extract(date from max(b.datetime_modified)) AS last_date_applied,
        count(distinct b.myv_van_id) AS qty
    FROM 'demsXXsp.vansync.activist_codes' a
    LEFT JOIN 'demsXXsp.vansync.contacts_activist_codes_myv' b ON a.activist_code_id = b.activist_code_id
    JOIN 'demsXXsp.vansync.committees_activist_codes' cac ON a.created_by_committee_id = cac.committee_id
    JOIN 'demsXXsp.vansync.committees' c ON cac.committee_id = c.committee_id
    GROUP BY a.activist_code_id, a.activist_code_name, a.activist_code_description, a.is_active, a.report_question, a.created_by_committee_id, a.datetime_created, c.committee_name
    HAVING qty IS NULL OR qty = 0
    AND a.is_active = true
)
SELECT
    activist_code_id,
    'My Voters' AS category,
    activist_code_name,
    activist_code_description,
    is_active,
    created_by_committee_id,
    committee_name,
    datetime_created,
    report_question,
    last_date_applied,
    0 AS qty  -- Set qty to 0 for consistency
FROM Common

UNION ALL

SELECT
    activist_code_id,
    'My Campaign' AS category,
    activist_code_name,
    activist_code_description,
    is_active,
    created_by_committee_id,
    committee_name,
    datetime_created,
    report_question,
    last_date_applied,
    0 AS qty  -- Set qty to 0 for consistency
FROM Common;
