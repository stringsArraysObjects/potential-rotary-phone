-- wrong query
SELECT price + amount AS total FROM items
-- corrected query
SELECT price * amount AS total FROM items;