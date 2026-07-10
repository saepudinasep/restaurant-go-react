INSERT INTO
    detail_orders (
        header_orders_id,
        menus_id,
        qty,
        price,
        message,
        status
    )
VALUES
    -- order 2018010001
    (
        (
            SELECT id
            FROM header_orders
            WHERE
                order_code = '2018010001'
        ),
        (
            SELECT id
            FROM menus
            WHERE
                name = 'Ayam Telur Asin'
        ),
        2,
        90000,
        NULL,
        'deliver'
    ),
    (
        (
            SELECT id
            FROM header_orders
            WHERE
                order_code = '2018010001'
        ),
        (
            SELECT id
            FROM menus
            WHERE
                name = 'Gurame Asam Manis'
        ),
        1,
        125000,
        'Pedas sedang',
        'deliver'
    ),
    (
        (
            SELECT id
            FROM header_orders
            WHERE
                order_code = '2018010001'
        ),
        (
            SELECT id
            FROM menus
            WHERE
                name = 'Kangkung Balacan'
        ),
        2,
        25000,
        NULL,
        'deliver'
    ),
    (
        (
            SELECT id
            FROM header_orders
            WHERE
                order_code = '2018010001'
        ),
        (
            SELECT id
            FROM menus
            WHERE
                name = 'Nasi Putih'
        ),
        6,
        5000,
        NULL,
        'deliver'
    ),

-- order 2018010002
(
    (
        SELECT id
        FROM header_orders
        WHERE
            order_code = '2018010002'
    ),
    (
        SELECT id
        FROM menus
        WHERE
            name = 'Cumi Lada Garam'
    ),
    1,
    70000,
    NULL,
    'deliver'
),
(
    (
        SELECT id
        FROM header_orders
        WHERE
            order_code = '2018010002'
    ),
    (
        SELECT id
        FROM menus
        WHERE
            name = 'Udang Mayonaise'
    ),
    1,
    80000,
    'Tanpa mayonaise ekstra',
    'deliver'
),
(
    (
        SELECT id
        FROM header_orders
        WHERE
            order_code = '2018010002'
    ),
    (
        SELECT id
        FROM menus
        WHERE
            name = 'Nasi Putih'
    ),
    1,
    5000,
    NULL,
    'deliver'
),

-- order 2018010003
(
    (
        SELECT id
        FROM header_orders
        WHERE
            order_code = '2018010003'
    ),
    (
        SELECT id
        FROM menus
        WHERE
            name = 'Kangkung Balacan'
    ),
    2,
    25000,
    NULL,
    'cooking'
),
(
    (
        SELECT id
        FROM header_orders
        WHERE
            order_code = '2018010003'
    ),
    (
        SELECT id
        FROM menus
        WHERE
            name = 'Nasi Putih'
    ),
    6,
    5000,
    NULL,
    'deliver'
),
(
    (
        SELECT id
        FROM header_orders
        WHERE
            order_code = '2018010003'
    ),
    (
        SELECT id
        FROM menus
        WHERE
            name = 'Gurame Asam Manis'
    ),
    1,
    125000,
    NULL,
    'cooking'
),
(
    (
        SELECT id
        FROM header_orders
        WHERE
            order_code = '2018010003'
    ),
    (
        SELECT id
        FROM menus
        WHERE
            name = 'Ayam Telur Asin'
    ),
    2,
    90000,
    NULL,
    'pending'
);