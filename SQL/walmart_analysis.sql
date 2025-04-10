USE walmart_db;
SELECT * FROM walmart;

-- Produk apa yang paling banyak terjual di setiap cabang?
SELECT 
    branch,
    category,
    SUM(quantity) AS total_sold
FROM walmart
GROUP BY branch, category
ORDER BY branch, total_sold DESC;

-- Metode pembayaran apa yang paling sering digunakan?
SELECT 
    payment_method,
    COUNT(*) AS total_transactions
FROM walmart
GROUP BY payment_method
ORDER BY total_transactions DESC;

-- Hari dengan total penjualan tertinggi?
SELECT 
    day_of_week,
    SUM(total_sales) AS total_sales
FROM walmart
GROUP BY day_of_week
ORDER BY total_sales DESC
LIMIT 5;

-- Kota mana yang berbelanja lebih banyak?
SELECT 
    city,
    SUM(total_sales) AS total_spent,
    COUNT(*) AS total_transactions,
    ROUND(AVG(profit_margin),2) AS avg_provit_margin
FROM walmart
GROUP BY city
ORDER BY total_spent DESC;

-- Berapa rata-rata rating untuk tiap lini produk?
SELECT 
    category,
    ROUND(AVG(rating), 2) AS avg_rating
FROM walmart
GROUP BY category
ORDER BY avg_rating DESC;

-- Waktu tersibuk untuk transaksi (pagi, siang, malam)?
SELECT 
    CASE 
        WHEN hour BETWEEN 0 AND 11 THEN 'Morning'
        WHEN hour BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day,
    COUNT(*) AS total_transactions
FROM walmart
GROUP BY time_of_day
ORDER BY total_transactions DESC;
