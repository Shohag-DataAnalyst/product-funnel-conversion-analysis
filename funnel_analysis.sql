SELECT 
	COUNT(*) AS total_users,
	COUNT(signup_date) AS signed_up,
	COUNT(onboarding_complete_date) AS onboard,
	COUNT(first_feature_use_date) AS activated,
	SUM(convented_to_paid) AS paid_users 
FROM user_funnel;


SELECT
	ROUND(COUNT(signup_date)::decimal / COUNT(*) * 100, 2) AS visit_to_signup_pct,
	ROUND(COUNT(onboarding_complete_date)::decimal / COUNT(signup_date) * 100, 2) AS signup_to_onboarding_pct,
	ROUND(COUNT(first_feature_use_date)::decimal / COUNT(onboarding_complete_date) * 100, 2) AS onboarding_to_activation_pct,
	ROUND(SUM(convented_to_paid)::decimal / COUNT(first_feature_use_date) * 100, 2) AS activation_to_paid_pct
FROM user_funnel;


SELECT
	PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY days_signup_to_onboarding) AS median_days_signup_to_onboarding
	AVG(days_signup_to_onboarding) AS avg_days_signup_to_onboarding
FROM user_funnel``````
WHERE days_signup_to_onboarding IS NOT NULL;


SELECT 
	PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY days_signup_to_paid) AS median_days_to_paid
FROM user_funnel
WHERE convented_to_paid = 1;


SELECT 
	convented_to_paid,
	AVG(days_signup_to_onboarding) AS avg_signup_to_onboarding,
	AVG(days_onboarding_to_feature) AS avg_onboarding_to_feature
FROM user_funnel
GROUP BY convented_to_paid;


SELECT
	AVG(s.total_revenue) AS avg_lifetime_revenue,
	AVG(s.tenure_months) AS avg_tenure
FROM subscription AS s 
JOIN user_funnel AS F 
ON s.user_id = f.user_id 
WHERE f.convented_to_paid = 1;





