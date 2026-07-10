CREATE TABLE IF NOT EXISTS detail_orders (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    header_orders_id BIGINT NOT NULL,
    menus_id BIGINT NOT NULL,
    qty INT NOT NULL DEFAULT 1,
    price INT NOT NULL, -- snapshot harga saat order, jangan ambil live dari menu
    message VARCHAR(255) NULL, -- catatan khusus per item
    status ENUM(
        'pending',
        'cooking',
        'deliver'
    ) NOT NULL DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_detail_orders_header_orders FOREIGN KEY (header_orders_id) REFERENCES header_orders (id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_detail_orders_menus FOREIGN KEY (menus_id) REFERENCES menus (id) ON UPDATE CASCADE ON DELETE RESTRICT,
    INDEX idx_detail_orders_header_orders (header_orders_id),
    INDEX idx_detail_orders_menus (menus_id)
) ENGINE = InnoDB;