WITH RECURSIVE
months AS (
    SELECT DATE '2024-01-01' AS month_start
    UNION ALL
    SELECT (month_start + INTERVAL '1 month')::DATE
    FROM months
    WHERE month_start < DATE '2024-12-01'
),

active_employees AS (
    SELECT
        m.month_start,
        COUNT(e.id) AS employees_count
    FROM months m
    LEFT JOIN employees e
      ON e.hire_date <= m.month_start
      AND (e.termination_date IS NULL OR e.termination_date >= m.month_start)
    GROUP BY m.month_start
),

terminations AS (
    SELECT
        DATE_TRUNC('month', termination_date)::DATE AS term_month,
        COUNT(id) AS term_count
    FROM employees
    WHERE termination_date BETWEEN '2024-01-01' AND '2024-12-31'
    GROUP BY term_month
),

experience_distribution AS (
    SELECT
        m.month_start,
        CASE
            WHEN e.experience_years BETWEEN 0 AND 2 THEN '0-2'
            WHEN e.experience_years BETWEEN 3 AND 5 THEN '3-5'
            ELSE '6+'
        END AS exp_group,
        COUNT(e.id) AS count_by_exp
    FROM months m
    LEFT JOIN employees e
      ON e.hire_date <= m.month_start
      AND (e.termination_date IS NULL OR e.termination_date >= m.month_start)
    GROUP BY m.month_start, exp_group
),

avg_hiring_time AS (
    SELECT
        DATE_TRUNC('month', publish_date)::DATE AS pub_month,
        AVG(hire_date - publish_date) AS avg_days_to_hire
    FROM vacancies
    WHERE publish_date BETWEEN '2024-01-01' AND '2024-12-31'
      AND hire_date IS NOT NULL
    GROUP BY pub_month
),

performance_by_experience AS (
    SELECT
        m.month_start,
        CASE
            WHEN e.experience_years BETWEEN 0 AND 2 THEN '0-2'
            WHEN e.experience_years BETWEEN 3 AND 5 THEN '3-5'
            ELSE '6+'
        END AS exp_group,
        AVG(e.performance_score) AS avg_performance
    FROM months m
    LEFT JOIN employees e
      ON e.hire_date <= m.month_start
      AND (e.termination_date IS NULL OR e.termination_date >= m.month_start)
    GROUP BY m.month_start, exp_group
)

SELECT
    m.month_start AS month,
    COALESCE(t.term_count, 0) AS terminations,
    COALESCE(a.employees_count, 0) AS active_employees,
    CASE WHEN a.employees_count > 0 THEN ROUND(COALESCE(t.term_count, 0)::numeric / a.employees_count, 4) ELSE 0 END AS turnover_rate,
    ed.exp_group,
    ed.count_by_exp,
    COALESCE(ah.avg_days_to_hire, 0) AS avg_days_to_hire,
    COALESCE(pb.avg_performance, 0) AS avg_performance_score
FROM months m
LEFT JOIN terminations t ON t.term_month = m.month_start
LEFT JOIN active_employees a ON a.month_start = m.month_start
LEFT JOIN experience_distribution ed ON ed.month_start = m.month_start
LEFT JOIN avg_hiring_time ah ON ah.pub_month = m.month_start
LEFT JOIN performance_by_experience pb ON pb.month_start = m.month_start AND pb.exp_group = ed.exp_group
ORDER BY m.month_start, ed.exp_group;
