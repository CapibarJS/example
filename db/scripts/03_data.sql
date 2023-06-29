INSERT INTO "Account" ("login", "password") VALUES
  ('admin', 'admin'),
  ('user', 'admin');

INSERT INTO "Role" ("name") VALUES
  ('admin'),
  ('user');

INSERT INTO "AccountRole" ("accountId", "roleId") VALUES
  (1, 1),
  (2, 2);

INSERT INTO "ShipType" ("name") VALUES
  ('Frigate'),
  ('Tanker'),
  ('Fishing');

INSERT INTO "Ship" ("name", "shipTypeId") VALUES
  ('HMS Victory', 2),
  ('USS Enterprise', 2),
  ('Queen Mary 2', 1),
  ('SS Titanic', 1),
  ('HMAS Sydney', 3);

INSERT INTO "Island" ("name", "location", "area", "population")
VALUES
  ('Bali', 'Indonesia', 5780.0, 4225000),
  ('Corfu', 'Greece', 593.7, 102071),
  ('Santorini', 'Greece', 73.0, 15400),
  ('Maui', 'USA', 1884.0, 144444),
  ('Hainan', 'China', 35214.0, 9170000);
