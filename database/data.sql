/* Items */
INSERT into items(id, publish_date, archived, author_id) values (1, '2020-11-29', false, 1);
INSERT into items (id, publish_date, archived, author_id) values (2, '2000-06-24', false, 2);

/* authors */
INSERT into authors values (1, 'Yash', 'Solo');
INSERT into authors values (2, 'Muhammad', 'Nasir');

/* games */
INSERT into games (item_id, multiplayer, last_played_at) values (1, true, '2006-02-14');
INSERT into games (item_id, multiplayer, last_played_at) values (2, true, '2010-03-26');
