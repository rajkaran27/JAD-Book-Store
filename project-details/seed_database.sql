-- Seed the authors table
INSERT INTO authors (author_id, author_name)
VALUES
(1, 'HARUMI MURAKAMI'),
(2, 'JAMES CLEAR'),
(3, 'NAPOLEON HILL'),
(4, 'J.K. ROWLING'),
(5, 'AGATHA CHRISTIE'),
(6, 'ISAAC ASIMOV'),
(7, 'JANE AUSTEN'),
(8, 'DAN BROWN'),
(9, 'STEPHEN KING'),
(10, 'MICHELLE OBAMA'),
(11, 'NEIL GAIMAN');

-- Seed the categories table
INSERT INTO categories (category_id, category_name)
VALUES
(1, 'FICTION'),
(2, 'MYSTERY'),
(3, 'SCIENCE FICTION'),
(4, 'BIOGRAPHY'),
(5, 'HISTORICAL FICTION'),
(6, 'SELF-HELP'),
(7, 'SCIENCE'),
(8, 'HORROR'),
(9, 'ROMANCE'),
(10, 'THRILLER'),
(11, 'FANTASY');

-- Seed the publishers table
INSERT INTO publishers (publisher_id, publisher_name)
VALUES
(1, 'HACHETTE BOOK GROUP'),
(2, 'MACMILLAN PUBLISHERS'),
(3, 'SCHOLASTIC CORPORATION'),
(4, 'PENGUIN RANDOM HOUSE'),
(5, 'HARPERCOLLINS'),
(6, 'SIMON & SCHUSTER');

-- Seed the books table
INSERT INTO books (book_id, category_id, isbn, title, quantity, price, author_id, publisher_id, image)
VALUES
(1, 1, '9780747532743', 'HARRY POTTER AND THE PHILOSOPHER''S STONE', 10, 19.99, 4, 1, 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1170803558l/72193.jpg'),
(2, 2, '9780007119278', 'MURDER ON THE ORIENT EXPRESS', 8, 14.99, 5, 2, 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1486131451i/853510.jpg'),
(3, 3, '9780553380163', 'FOUNDATION', 5, 9.99, 6, 3, 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1417900846i/29579.jpg'),
(4, 2, '9780312330873', 'AND THEN THERE WERE NONE', 10, 14.99, 5, 2, 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1638425885i/16299.jpg'),
(5, 2, '9781734452594', 'THE MYSTERIOUS AFFAIR AT STYLES', 15, 14.99, 5, 2, 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1585632445i/52843028.jpg'),
(6, 1, '9780375704024', 'NORWEGIAN WOOD', 20, 17.99, 1, 3, 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1630460042i/11297.jpg'),
(7, 1, '9781400079278', 'KAFKA ON THE SHORE', 18, 18.99, 1, 3, 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1429638085i/4929.jpg'),
(8, 3, '9780553293371', 'FOUNDATION AND EMPIRE', 3, 12.99, 3, 3, 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1391454612i/29581.jpg'),
(9, 3, '9780553382587', 'SECOND FOUNDATION', 4, 11.99, 3, 3, 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1661015922i/29580.jpg'),
(10, 4, '9780141439518', 'PRIDE AND PREJUDICE', 8, 11.99, 7, 4, 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1320399351i/1885.jpg'),
(11, 5, '9780552172127', 'THE DA VINCI CODE', 12, 14.99, 8, 6, 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1463592438i/30228538.jpg'),
(12, 6, '9781501180989', 'THE SHINING', 5, 9.99, 9, 5, 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1353277730i/11588.jpg'),
(13, 7, '9781524763138', 'BECOMING', 10, 17.99, 10, 3, 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1528206996i/38746485.jpg'),
(14, 8, '9780062316642', 'AMERICAN GODS', 6, 12.99, 11, 2, 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1462924585i/30165203.jpg');
