CREATE TABLE "passengers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "concourses" (
    "id" INTEGER,
    "concourse" INTEGER NOT NULL UNIQUE,
    PRIMARY KEY("id")
);

CREATE TABLE "airlines" (
    "id" INTEGER,
    "airline_name" TEXT NOT NULL,
    "concourse_id" INTEGER,
    PRIMARY KEY("id")
    FOREIGN KEY("concourse_id") REFERENCES "concourses"("id")
);

CREATE TABLE "flights" (
    "id" INTEGER,
    "flight_number" INTEGER NOT NULL,
    "airline_id" INTEGER,
    "from_airline_code" TEXT NOT NULL,
    "to_airline_code" TEXT NOT NULL,
    "depature_datetime" TEXT NOT NULL,
    "arrival_datetime" TEXT NOT NULL,
    PRIMARY KEY("id")
    FOREIGN KEY("airline_id") REFERENCES "airlines"("id")
);

CREATE TABLE "check_ins" (
    "id" INTEGER,
    "passenger_id" INTEGER,
    "checkin_datetime" TEXT NOT NULL,
    "flight_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("passenger_id") REFERENCES "passengers"("id"),
    FOREIGN KEY("flight_id") REFERENCES "flights"("id")
);
