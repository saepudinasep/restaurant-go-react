DELETE FROM users
WHERE
    email IN (
        'admin@smkrestaurant.sch.id',
        'chef1@smkrestaurant.sch.id',
        'chef2@smkrestaurant.sch.id',
        'cashier1@smkrestaurant.sch.id',
        'cashier2@smkrestaurant.sch.id'
    );