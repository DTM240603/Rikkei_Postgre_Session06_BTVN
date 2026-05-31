CREATE SCHEMA bt08;
SET search_path TO bt08;

CREATE TABLE Customer (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Orders (
    id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount NUMERIC(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customer(id)
);

-- Thêm dữ liệu vào bảng Customer
INSERT INTO Customer (name)
VALUES
    ('Nguyễn Văn A'),
    ('Trần Thị B'),
    ('Lê Văn C'),
    ('Phạm Thị D'),
    ('Hoàng Thị E'),
    ('Võ Văn F');

-- Thêm dữ liệu vào bảng Orders
INSERT INTO Orders (customer_id, order_date, total_amount)
VALUES
    (1, '2024-01-15', 12000000.00),
    (2, '2024-05-20', 18500000.00),
    (3, '2024-10-08', 25000000.00),

    (1, '2025-02-12', 8000000.00),
    (4, '2025-04-18', 15000000.00),
    (2, '2025-07-25', 22000000.00),
    (5, '2025-11-30', 30000000.00),

    (3, '2026-01-10', 5500000.00),
    (4, '2026-03-22', 9000000.00),
    (1, '2026-06-05', 11000000.00);

-- 1. Hiển thị tên khách hàng và tổng tiền đã mua, sắp xếp giảm dần
SELECT
    c.name AS "Tên khách hàng",
    COALESCE(SUM(o.total_amount), 0) AS "Tổng tiền đã mua"
FROM customer c
         LEFT JOIN orders o ON c.id = o.customer_id
GROUP BY c.id, c.name
ORDER BY "Tổng tiền đã mua" DESC;

-- 2. Tìm khách hàng có tổng chi tiêu cao nhất bằng Subquery với MAX
SELECT
    c.name AS "Tên khách hàng",
    SUM(o.total_amount) AS "Tổng chi tiêu"
FROM customer c
         JOIN orders o ON c.id = o.customer_id
GROUP BY c.id, c.name
HAVING SUM(o.total_amount) = (
    SELECT MAX(customer_total)
    FROM (
             SELECT
                 customer_id,
                 SUM(total_amount) AS customer_total
             FROM orders
             GROUP BY customer_id
         ) AS revenue_table
);

-- 3. Liệt kê khách hàng chưa từng mua hàng
SELECT
    c.id AS "Mã khách hàng",
    c.name AS "Tên khách hàng"
FROM customer c
         LEFT JOIN orders o ON c.id = o.customer_id
WHERE o.id IS NULL;

-- 4. Hiển thị khách hàng có tổng chi tiêu lớn hơn trung bình của toàn bộ khách hàng
SELECT
    c.name AS "Tên khách hàng",
    COALESCE(SUM(o.total_amount), 0) AS "Tổng chi tiêu"
FROM customer c
         LEFT JOIN orders o ON c.id = o.customer_id
GROUP BY c.id, c.name
HAVING COALESCE(SUM(o.total_amount), 0) > (
    SELECT AVG(customer_total)
    FROM (
             SELECT
                 c2.id,
                 COALESCE(SUM(o2.total_amount), 0) AS customer_total
             FROM customer c2
                      LEFT JOIN orders o2 ON c2.id = o2.customer_id
             GROUP BY c2.id
         ) AS average_table
)
ORDER BY "Tổng chi tiêu" DESC;