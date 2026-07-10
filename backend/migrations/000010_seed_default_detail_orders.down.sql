DELETE FROM detail_orders
WHERE
    header_orders_id IN (
        SELECT id
        FROM header_orders
        WHERE
            order_code IN (
                '2018010001',
                '2018010002',
                '2018010003'
            )
    );