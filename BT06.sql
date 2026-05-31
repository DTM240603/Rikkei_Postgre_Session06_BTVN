CREATE SCHEMA bt06;
SET search_path TO bt06;

CREATE TABLE Orders (
    id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount NUMERIC(10,2)
);

INSERT INTO orders (customer_id, order_date, total_amount)
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

-- 1. Tính:
--    - Tổng doanh thu
--    - Tổng số đơn hàng
--    - Giá trị trung bình mỗi đơn
SELECT
    SUM(total_amount) "Tổng doanh thu",
    COUNT(id) "Số lượng đơn hàng",
    AVG(total_amount) "Giá trung bình"
FROM Orders;

-- 2. Nhóm đơn hàng theo năm đặt hàng:
--    - Dùng EXTRACT(YEAR FROM order_date)
SELECT
    EXTRACT(YEAR FROM order_date) AS "Năm",
    SUM(total_amount) AS "Tổng doanh thu"
FROM orders
GROUP BY EXTRACT(YEAR FROM order_date)
ORDER BY "Năm" ASC;

-- 3. Chỉ hiển thị những năm có doanh thu trên 50.000.000:
--    - Dùng HAVING
SELECT
    EXTRACT(YEAR FROM order_date) AS "Năm",
    SUM(total_amount) AS "Tổng doanh thu"
FROM orders
GROUP BY EXTRACT(YEAR FROM order_date)
HAVING SUM(total_amount) > 50000000
ORDER BY "Năm" ASC;

-- 4. Hiển thị 5 đơn hàng có giá trị cao nhất:
--    - Dùng ORDER BY total_amount DESC
--    - LIMIT 5
SELECT *
FROM orders
ORDER BY total_amount DESC
LIMIT 5;