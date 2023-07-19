INSERT INTO `collections` (`id`, `name`, `temp_min`, `temp_max`, `created_at`, `updated_at`) VALUES
(1, 'Summer collection', 17, 100, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(2, 'Autumn collection', 1, 17, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(3, 'Spring collection', 4, 17, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(4, 'Winter collection', -100, 1, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(5, 'Miscellaneous', -100, 100, '2019-10-23 00:00:00', '2019-10-23 00:00:00');

INSERT INTO `conditions` (`id`, `code`, `name`, `created_at`, `updated_at`) VALUES
(1, 'clear', 'Clear', '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(2, 'isolated-clouds', 'Isolated clouds', '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(3, 'scattered-clouds', 'Scattered clouds', '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(4, 'overcast', 'Overcast', '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(5, 'light-rain', 'Light rain', '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(6, 'moderate-rain', 'Moderate rain', '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(7, 'heavy-rain', 'Heavy rain', '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(8, 'sleet', 'Sleet', '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(9, 'light-snow', 'Light snow', '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(10, 'moderate-snow', 'Moderate snow', '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(11, 'heavy-snow', 'Heavy snow', '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(12, 'fog', 'Fog', '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(13, 'na', 'N/A', '2019-10-23 00:00:00', '2019-10-23 00:00:00');

INSERT INTO `products` (`id`, `code`, `name`, `price`, `collection_id`, `created_at`, `updated_at`) VALUES
(1, 'SUM001', 'White shorts', 14.99, 1, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(2, 'SUM002', 'Black T-shirt', 8.99, 1, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(3, 'SUM003', 'Black sunglasses', 5.99, 1, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(4, 'SUM004', 'Red dress', 19.99, 1, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(5, 'SUM005', 'Yellow hat', 7.99, 1, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(6, 'SUM006', 'Blue flip-flops', 9.99, 1, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(7, 'SPR001', 'Blue jeans', 24.99, 3, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(8, 'SPR002', 'Black jumper', 14.99, 3, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(9, 'SPR003', 'Grey jacket', 18.99, 3, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(10, 'SPR004', 'White sneakers', 34.99, 3, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(11, 'WIN001', 'Black skiing pants', 44.99, 4, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(12, 'WIN002', 'Green skiing jacket', 49.99, 4, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(13, 'WIN003', 'Grey wool scarf', 5.99, 4, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(14, 'WIN004', 'Grey winter cap', 7.99, 4, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(15, 'WIN005', 'Blue winter jacket', 58.99, 4, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(16, 'AUT001', 'Black jeans', 24.99, 2, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(17, 'AUT002', 'White scarf', 3.99, 2, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(18, 'AUT003', 'Red cap', 4.99, 2, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(19, 'AUT004', 'Brown shirt', 18.99, 2, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(20, 'MSC001', 'Blue umberlla', 14.99, 5, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(21, 'MSC002', 'Orange snow showel', 11.99, 5, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(22, 'MSC003', 'Sunscreen', 4.99, 1, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(23, 'MSC004', 'Blue kite', 18.99, 5, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(24, 'MSC005', 'Blue tent', 54.99, 5, '2019-10-23 00:00:00', '2019-10-23 00:00:00');

INSERT INTO `recommendations` (`id`, `condition_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(2, 1, 2, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(3, 1, 3, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(4, 1, 4, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(5, 1, 5, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(6, 1, 6, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(7, 1, 7, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(8, 1, 9, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(9, 1, 10, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(10, 1, 22, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(11, 1, 16, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(12, 1, 15, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(13, 1, 19, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(14, 1, 22, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(15, 2, 7, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(16, 2, 8, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(17, 2, 9, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(18, 2, 16, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(19, 2, 17, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(20, 3, 18, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(21, 3, 17, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(22, 3, 16, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(23, 3, 19, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(24, 3, 24, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(25, 4, 24, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(26, 4, 23, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(27, 4, 17, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(28, 4, 18, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(29, 5, 20, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(30, 5, 8, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(31, 5, 7, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(32, 6, 20, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(33, 6, 19, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(34, 6, 10, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(35, 7, 20, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(36, 7, 16, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(37, 7, 17, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(38, 8, 20, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(39, 8, 19, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(40, 8, 16, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(41, 8, 8, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(42, 9, 7, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(43, 9, 12, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(44, 9, 15, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(45, 9, 14, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(46, 10, 11, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(47, 10, 21, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(48, 10, 14, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(49, 10, 12, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(50, 11, 11, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(51, 11, 12, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(52, 11, 13, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(53, 11, 21, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(54, 12, 7, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(55, 12, 18, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(56, 12, 19, '2019-10-23 00:00:00', '2019-10-23 00:00:00'),
(57, 12, 24, '2019-10-23 00:00:00', '2019-10-23 00:00:00');
