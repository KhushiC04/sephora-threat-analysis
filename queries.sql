-- ============================================================
-- Sephora Threat Analysis — SQL Queries (Azure SQL Database)
-- Database: sephora-threat-db | Server: khushi-sephora-server1
-- Note: numbers below reflect the corrected dataset (word-boundary
-- dupe-detection fix + combined_threat_score formula fix)
-- ============================================================

-- 1. Create the summary table
CREATE TABLE threat_summary (
    category NVARCHAR(50),
    dupe_mentions INT,
    regulation_flagged_products INT,
    dupe_score FLOAT,
    regulation_score FLOAT,
    combined_threat_score FLOAT
);

-- 2. Load the category-level results (computed in Python)
INSERT INTO threat_summary (category, dupe_mentions, regulation_flagged_products, dupe_score, regulation_score, combined_threat_score)
VALUES
('Skincare', 1090, 635, 100.0, 100.00, 100.00),
('Hair', 0, 242, 0.0, 38.11, 19.06),
('Makeup', 0, 72, 0.0, 11.34, 5.67),
('Bath & Body', 0, 40, 0.0, 6.30, 3.15),
('Mini Size', 0, 22, 0.0, 3.46, 1.73),
('Men', 0, 13, 0.0, 2.05, 1.02),
('Fragrance', 0, 1, 0.0, 0.16, 0.08),
('Gifts', 0, 0, 0.0, 0.0, 0.0),
('Tools & Brushes', 0, 0, 0.0, 0.0, 0.0);

-- 3. Rank every category by combined threat score
SELECT * FROM threat_summary
ORDER BY combined_threat_score DESC;

-- 4. Find categories under regulatory scrutiny but with no dupe activity yet
-- ("watch list" — could face dupe pressure next)
SELECT category, regulation_flagged_products, dupe_mentions
FROM threat_summary
WHERE regulation_flagged_products > 0 AND dupe_mentions = 0
ORDER BY regulation_flagged_products DESC;

-- 5. Calculate each category's % share of total regulation-flagged products
-- (uses a subquery to get the grand total, then computes each row's share of it)
SELECT
    category,
    regulation_flagged_products,
    ROUND(regulation_flagged_products * 100.0 / (SELECT SUM(regulation_flagged_products) FROM threat_summary), 2) AS pct_of_total_flagged
FROM threat_summary
ORDER BY pct_of_total_flagged DESC;
