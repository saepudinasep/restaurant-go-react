CREATE TABLE IF NOT EXISTS header_orders (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    order_code VARCHAR(20) NOT NULL UNIQUE, -- e.g. 2018010001, bisa digenerate di app layer
    users_id BIGINT NOT NULL,
    members_id BIGINT NOT NULL,
    order_date DATE NOT NULL,
    payment_type ENUM(
        'cash',
        'debit',
        'credit_card'
    ) NULL,
    bank_name VARCHAR(50) NULL,
    total_amount INT NOT NULL DEFAULT 0,
    status ENUM(
        'pending',
        'cooking',
        'deliver',
        'paid',
        'cancelled'
    ) NOT NULL DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_header_orders_users FOREIGN KEY (users_id) REFERENCES users (id) ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_header_orders_members FOREIGN KEY (members_id) REFERENCES members (id) ON UPDATE CASCADE ON DELETE RESTRICT,
    INDEX idx_header_orders_users (users_id),
    INDEX idx_header_orders_members (members_id)
) ENGINE = InnoDB;