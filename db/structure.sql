-- === Role ===

CREATE TABLE "Role" (
  "roleId" bigint generated always as identity,
  "name" varchar NOT NULL
);

ALTER TABLE "Role" ADD CONSTRAINT "pkRole" PRIMARY KEY ("roleId");

-- === Account ===

CREATE TABLE "Account" (
  "accountId" bigint generated always as identity,
  "login" varchar(64) NOT NULL,
  "password" varchar NOT NULL
);

ALTER TABLE "Account" ADD CONSTRAINT "pkAccount" PRIMARY KEY ("accountId");

-- === AccountRole ===

CREATE TABLE "AccountRole" (
  "accountId" bigint NOT NULL,
  "roleId" bigint NOT NULL
);

ALTER TABLE "AccountRole" ADD CONSTRAINT "pkAccountRole" PRIMARY KEY ("accountId", "roleId");
ALTER TABLE "AccountRole" ADD CONSTRAINT "fkAccountRoleAccount" FOREIGN KEY ("accountId") REFERENCES "Account" ("accountId");
ALTER TABLE "AccountRole" ADD CONSTRAINT "fkAccountRoleRole" FOREIGN KEY ("roleId") REFERENCES "Role" ("roleId");

-- === Island ===

CREATE TABLE "Island" (
  "islandId" bigint generated always as identity,
  "name" VARCHAR NOT NULL,
  "location" VARCHAR NOT NULL,
  "area" FLOAT NOT NULL,
  "population" INTEGER NOT NULL
);

ALTER TABLE "Island" ADD CONSTRAINT "pkIsland" PRIMARY KEY ("islandId");

-- === ShipType ===

CREATE TABLE "ShipType" (
  "shipTypeId" bigint generated always as identity,
  "name" varchar NOT NULL
);

ALTER TABLE "ShipType" ADD CONSTRAINT "pkShipType" PRIMARY KEY ("shipTypeId");

-- === Ship ===

CREATE TABLE "Ship" (
  "shipId" bigint generated always as identity,
  "name" varchar NOT NULL,
  "shipTypeId" bigint NOT NULL
);

ALTER TABLE "Ship" ADD CONSTRAINT "pkShip" PRIMARY KEY ("shipId");
ALTER TABLE "Ship" ADD CONSTRAINT "fkShipShipType" FOREIGN KEY ("shipTypeId") REFERENCES "ShipType" ("shipTypeId");

-- === Session ===

CREATE TABLE "Session" (
  "sessionId" bigint generated always as identity,
  "accountId" bigint NOT NULL,
  "token" varchar NOT NULL,
  "ip" inet NOT NULL,
  "data" jsonb NOT NULL
);

ALTER TABLE "Session" ADD CONSTRAINT "pkSession" PRIMARY KEY ("sessionId");
ALTER TABLE "Session" ADD CONSTRAINT "fkSessionAccount" FOREIGN KEY ("accountId") REFERENCES "Account" ("accountId");
