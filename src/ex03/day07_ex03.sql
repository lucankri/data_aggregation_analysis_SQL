WITH cte_visit AS
(
    SELECT pizzeria.name, COUNT(person_id) AS count
        FROM pizzeria JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
        GROUP BY pizzeria.name
        ORDER BY count DESC
), cte_order AS
(
    SELECT pizzeria.name, COUNT(person_id) AS count
        FROM person_order JOIN menu ON person_order.menu_id = menu.id
        JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
        GROUP BY pizzeria.name
        ORDER BY count DESC
)
SELECT pizzeria.name, COALESCE(cte_visit.count, 0) + COALESCE(cte_order.count, 0) AS total_count
    FROM pizzeria FULL JOIN cte_order ON cte_order.name = pizzeria.name
    FULL JOIN cte_visit ON cte_visit.name = pizzeria.name
    ORDER BY total_count DESC, pizzeria.name;
