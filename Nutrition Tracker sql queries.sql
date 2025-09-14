CREATE TABLE nutrition (
    food TEXT,
    calories INT,
    protein_g FLOAT,
    fat_g FLOAT,
    carbs_g FLOAT
);

INSERT INTO nutrition (food, calories, protein_g, fat_g, carbs_g) VALUES
('Apple', 52, 0.3, 0.2, 14.0),
('Banana', 96, 1.3, 0.3, 27.0),
('Chicken Breast', 165, 31.0, 3.6, 0.0),
('Rice', 130, 2.7, 0.3, 28.0),
('Broccoli', 55, 3.7, 0.6, 11.0);

1. Sabhi food items dekhne ke liye

SELECT * FROM nutrition;

2. Sabse jyada calories wale food ka naam

SELECT food, calories
FROM nutrition
ORDER BY calories DESC
LIMIT 1;

3. Protein-rich foods (protein > 10g)

SELECT food, protein_g
FROM nutrition
WHERE protein_g > 10
ORDER BY protein_g DESC;

4. Average macros (calories, protein, fat, carbs)

SELECT 
    AVG(calories) AS avg_calories,
    AVG(protein_g) AS avg_protein,
    AVG(fat_g) AS avg_fat,
    AVG(carbs_g) AS avg_carbs
FROM nutrition;

5. Healthy options (low fat < 5g and high protein > 5g)

SELECT food, protein_g, fat_g
FROM nutrition
WHERE protein_g > 5 AND fat_g < 5;

6. Add a category (High/Medium/Low calories)

SELECT food, calories,
    CASE 
        WHEN calories > 200 THEN 'High Calorie'
        WHEN calories BETWEEN 100 AND 200 THEN 'Medium Calorie'
        ELSE 'Low Calorie'
    END AS calorie_category
FROM nutrition;

7. Foods with balanced macros (protein > 10g, fat < 10g, carbs < 20g)

SELECT food, calories, protein_g, fat_g, carbs_g
FROM nutrition
WHERE protein_g > 10 AND fat_g < 10 AND carbs_g < 20;

8. Which food gives max protein per calorie? (Efficiency check)

SELECT 
    food,
    calories,
    protein_g,
    ROUND((protein_g::numeric / calories::numeric), 3) AS protein_per_calorie
FROM nutrition;

9. Which food gives max carbs per calorie?

SELECT 
    food,
    ROUND((carbs_g::numeric / calories::numeric), 3) AS carbs_per_calorie
FROM nutrition
WHERE calories > 0
ORDER BY carbs_per_calorie DESC
LIMIT 10;

10. Which food gives max fat per calorie?

SELECT 
    food,
    ROUND((fat_g::numeric / calories::numeric), 3) AS fat_per_calorie
FROM nutrition
WHERE calories > 0
ORDER BY fat_per_calorie DESC
LIMIT 10;

