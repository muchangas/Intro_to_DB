-- DDL to print the full description of the table Books
-- The query uses INFORMATION_SCHEMA.COLUMNS to comply with the constraint
-- of not using DESCRIBE or EXPLAIN.

SELECT
COLUMN_NAME, -- Required String
COLUMN_TYPE, -- Required String
IS_NULLABLE,
COLUMN_KEY,
COLUMN_DEFAULT,
EXTRA
FROM
INFORMATION_SCHEMA.COLUMNS -- Required String
WHERE
TABLE_SCHEMA = 'alx_book_store' -- Required String
AND TABLE_NAME = 'Books' -- Required String
ORDER BY
ORDINAL_POSITION;
