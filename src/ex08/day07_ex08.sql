SELECT person.address, pizzeria.name, COUNT(pizzeria.name) AS count_of_orders
    FROM person_order JOIN menu ON person_order.menu_id = menu.id
    JOIN person ON person_order.person_id = person.id
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    GROUP BY pizzeria.name, person.address
    ORDER BY person.address;
