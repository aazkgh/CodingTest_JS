SELECT I.REST_ID, I.REST_NAME, I.FOOD_TYPE, I.FAVORITES, I.ADDRESS, R.SCORE
FROM REST_INFO AS I
INNER JOIN (
    SELECT REST_ID, ROUND(AVG(REVIEW_SCORE),2) AS SCORE 
    FROM REST_REVIEW
    GROUP BY REST_ID) AS R ON I.REST_ID = R.REST_ID
WHERE I.ADDRESS LIKE '서울%'
ORDER BY R.SCORE DESC, I.FAVORITES DESC