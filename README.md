# Sephora Under Threat: Which Product Category Faces the Highest Combined Risk?

**A business analytics case study on dupe culture and age-restriction regulation in the beauty industry.**

## Business Question
Sephora is being squeezed from two directions at once:
- **From below** — "dupe culture" (customers hunting for cheaper alternatives to premium products, amplified by TikTok/Reddit)
- **From above** — age-restriction regulation on anti-aging skincare ingredients (e.g., Connecticut's 2024 settlement with Sephora, California's proposed AB 728)

**Which product category absorbs the most damage from both threats combined?**

## Key Finding
**Skincare** faces the highest combined threat by a wide margin:
- **100%** of all "dupe" mentions across 1M+ customer reviews belong to Skincare products
- **62%** of all regulation-flagged products (containing retinol, glycolic acid, salicylic acid, or lactic acid) are Skincare — nearly 3x the next-highest category (Hair, 24%)
- Skincare also carries the 2nd-highest average price ($60.51) and high customer loyalty (4.23/5 rating) — meaning it has the most revenue at stake if either threat materializes further

## Recommendation
1. **Defend**: Expand exclusive/limited-edition skincare lines, strengthen loyalty perks specifically for high-price skincare, and use review data to identify which SKUs get "duped" most for prioritized reformulation or repricing.
2. **Get ahead**: Proactively audit and label the 635 flagged skincare products before regulators mandate it; build an age-appropriate product finder now; monitor Hair and Makeup, which share Skincare's regulation exposure without the dupe pressure yet.

## Tools & Methodology

| Tool | What it did |
|---|---|
| **Python (Google Colab)** | Loaded and cleaned the Sephora Products & Reviews dataset (8,494 products, 1M+ reviews). Used NLP text search (`str.contains`) to find "dupe" mentions across all reviews, merged results with product categories, and built a normalized 0–100 combined threat score (average of dupe-mention share and regulation-flag share per category). |
| **SQL (Azure SQL Database)** | Created and queried a cloud-hosted `threat_summary` table. Wrote ranking queries (`ORDER BY`), filter queries (`WHERE`) to find categories with regulation exposure but no dupe activity yet, and a subquery to calculate each category's % share of total regulation-flagged products. |
| **Excel** | Built a pivot table and pivot chart for quick, stakeholder-friendly exploration of the summary data. |
| **Power BI** | Combined all findings into one interactive dashboard: a ranked bar chart, a dupe-vs-regulation comparison chart, a headline KPI card, and a detail table — styled with a custom black/gold/blush theme reflecting the beauty industry context. |

## Dataset
[Sephora Products and Skincare Reviews](https://www.kaggle.com/datasets/nadyinky/sephora-products-and-skincare-reviews) (Kaggle) — 8,494 products and ~1.09M customer reviews.

## Repository Structure
```
├── Python/          → Jupyter notebook: data cleaning, NLP dupe-detection, threat scoring
├── SQL/             → Query screenshots and SQL scripts (Azure SQL Database)
├── Excel/           → Pivot table + chart summary workbook
├── PowerBI/         → Interactive dashboard (.pbix) + exported view
└── README.md
```


## Author
**Khushi Chandel** — Final Year, Thakur College of Engineering and Technology, Mumbai
Aspiring Data/Business Analyst — Fashion, Beauty & Entertainment industries
