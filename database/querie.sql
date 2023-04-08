SELECT * FROM items
JOIN games ON items.id = games.item_id
JOIN authors ON items.author_id = authors.id;
