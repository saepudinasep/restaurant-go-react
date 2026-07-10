INSERT INTO
    header_orders (
        order_code,
        users_id,
        members_id,
        order_date,
        payment_type,
        bank_name,
        total_amount,
        status
    )
VALUES (
        '2018010001',
        (
            SELECT id
            FROM users
            WHERE
                email = 'cashier1@smkrestaurant.sch.id'
        ),
        (
            SELECT id
            FROM members
            WHERE
                email = 'andi.wijaya@gmail.com'
        ),
        '2024-06-01',
        'credit_card',
        'BNI',
        385000,
        'paid'
    ),
    (
        '2018010002',
        (
            SELECT id
            FROM users
            WHERE
                email = 'cashier2@smkrestaurant.sch.id'
        ),
        (
            SELECT id
            FROM members
            WHERE
                email = 'rina.marlina@gmail.com'
        ),
        '2024-06-02',
        'cash',
        NULL,
        155000,
        'deliver'
    ),
    (
        '2018010003',
        (
            SELECT id
            FROM users
            WHERE
                email = 'cashier1@smkrestaurant.sch.id'
        ),
        (
            SELECT id
            FROM members
            WHERE
                email = 'fajar.nugroho@gmail.com'
        ),
        '2024-06-03',
        'debit',
        'BCA',
        195000,
        'cooking'
    );