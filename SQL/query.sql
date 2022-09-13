SELECT 
    AVG(DAILY_ARPDAU.arpdau) AS avg_daily_arpdau
FROM
    (
        SELECT 
            CAST(event_time AS DATE) 					             AS report_date, 
            SUM(CAST(event_value AS NUMERIC(6, 2)) / (COUNT(DISTINCT user_id) * 1.0) AS arpdau		
        FROM 
            events    
        WHERE 
            event_name LIKE '%launch%' OR event_name LIKE '%purchase%'
        GROUP BY 
            1 
    ) DAILY_ARPDAU
