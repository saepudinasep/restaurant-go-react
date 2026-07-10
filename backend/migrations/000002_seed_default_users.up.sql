-- Seed 3 user contoh, 1 untuk masing-masing role.
-- Password plain untuk ketiganya: "password123"
-- Hash bcrypt di bawah ini SUDAH diverifikasi valid untuk password tersebut.
INSERT INTO
    users (name, email, password, role)
VALUES (
        'Budi Santoso',
        'admin@smkrestaurant.sch.id',
        '$2b$10$VjIkvf.t.bkW1LX1AaWPOeipgi2rG5gVWOMEx1IG3nisl80rOO0bK',
        'admin'
    ),
    (
        'Siti Aminah',
        'chef1@smkrestaurant.sch.id',
        '$2b$10$VjIkvf.t.bkW1LX1AaWPOeipgi2rG5gVWOMEx1IG3nisl80rOO0bK',
        'chef'
    ),
    (
        'Rudi Hartono',
        'chef2@smkrestaurant.sch.id',
        '$2b$10$VjIkvf.t.bkW1LX1AaWPOeipgi2rG5gVWOMEx1IG3nisl80rOO0bK',
        'chef'
    ),
    (
        'Dewi Lestari',
        'cashier1@smkrestaurant.sch.id',
        '$2b$10$VjIkvf.t.bkW1LX1AaWPOeipgi2rG5gVWOMEx1IG3nisl80rOO0bK',
        'cashier'
    ),
    (
        'Agus Setiawan',
        'cashier2@smkrestaurant.sch.id',
        '$2b$10$VjIkvf.t.bkW1LX1AaWPOeipgi2rG5gVWOMEx1IG3nisl80rOO0bK',
        'cashier'
    );