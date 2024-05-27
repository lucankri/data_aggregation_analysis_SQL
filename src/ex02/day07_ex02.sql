WITH cte_visit AS
(
    SELECT pizzeria.name, COUNT(person_id) AS count, 'visit' AS action_type
        FROM pizzeria JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
        GROUP BY pizzeria.name
        ORDER BY count DESC
        LIMIT 3
), cte_order AS
(
    SELECT pizzeria.name, COUNT(person_id) AS count, 'order' AS action_type
        FROM person_order JOIN menu ON person_order.menu_id = menu.id
        JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
        GROUP BY pizzeria.name
        ORDER BY count DESC
        LIMIT 3
)
SELECT * FROM cte_visit
UNION
SELECT * FROM cte_order
ORDER BY action_type, count DESC;
