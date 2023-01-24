

SELECT * INTO vine_review_analysis FROM vine_table WHERE total_votes >= 20;

SELECT * FROM vine_review_analysis LIMIT 2;

SELECT * FROM vine_review_analysis WHERE CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >= 0.5;

SELECT * INTO paid_vine FROM vine_review_analysis WHERE vine = 'Y';

SELECT * INTO unpaid_vine FROM vine_review_analysis WHERE vine = 'N';

SELECT COUNT(*) FROM paid_vine;
-- total = 5333
SELECT COUNT(*) FROM paid_vine WHERE star_rating = '5';
-- total = 2069
SELECT COUNT(*) FROM unpaid_vine;
-- total = 156262
SELECT COUNT(*) FROM unpaid_vine WHERE star_rating = '5';
-- total = 56733

CREATE OR REPLACE FUNCTION percentage(x double precision, y double precision, OUT percentage double precision)
RETURNS double precision
AS
$percentage$
BEGIN
percentage := y/x * 100;
END;

$percentage$
LANGUAGE plpgsql;

-- Decimal added to end of integer due to using double precision in percentage function.
-- Otherwise returns incorrect answer.
SELECT percentage(5333.0, 2069.0) INTO paid_vine_percent;
-- Percentage = 38.8% or 39%
SELECT percentage(156262.0,56733.0) INTO unpaid_vine_percent;
-- Percentage = 36.3% or 36%

