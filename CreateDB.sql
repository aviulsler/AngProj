CREATE TABLE abteilung (
                           abtnr integer NOT NULL,
                           name character varying(20)
);

CREATE TABLE abtleitung (
                            abtnr integer NOT NULL,
                            abtchef integer NOT NULL
);

CREATE TABLE angestellter (
                              persnr integer NOT NULL,
                              name TEXT NOT NULL,
                              vorname TEXT NOT NULL,
                              tel integer,
                              salaer numeric(7,2) NOT NULL,
                              chef integer,
                              abtnr integer NOT NULL,
                              wohnort character varying(20),
                              eintrittsdatum date DEFAULT ('now'::text)::date,
                              bonus numeric(7,2) DEFAULT 0
);

CREATE TABLE projekt (
                         projnr integer NOT NULL,
                         bezeichnung character(20),
                         startzeit date,
                         dauer integer,
                         aufwand integer,
                         projleiter integer
);

CREATE TABLE projektzuteilung (
                                  persnr integer NOT NULL,
                                  projnr integer NOT NULL,
                                  zeitanteil integer NOT NULL,
                                  startzeit date,
                                  dauer integer
);

CREATE SEQUENCE s_angestellter
    START WITH 2000
    INCREMENT BY 10
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

INSERT INTO abteilung VALUES (1, 'Verkauf');
INSERT INTO abteilung VALUES (2, 'Marketing');
INSERT INTO abteilung VALUES (3, 'Entwicklung');
INSERT INTO abteilung VALUES (4, 'Finanzen');
INSERT INTO abteilung VALUES (5, 'QS');

INSERT INTO abtleitung VALUES (1, 1001);
INSERT INTO abtleitung VALUES (2, 1002);
INSERT INTO abtleitung VALUES (3, 1010);
INSERT INTO abtleitung VALUES (4, 3000);

INSERT INTO angestellter VALUES (1001, 'Marxer', 'Markus', 234, 10580.00, NULL, 1, 'Luzern', '2014-10-21', 0.00);
INSERT INTO angestellter VALUES (1002, 'Widmer', 'Anna', 301, 12010.00, NULL, 2, 'Adligenswil', '2014-10-21', 0.00);
INSERT INTO angestellter VALUES (1010, 'Steiner', 'Hans', 409, 10867.00, NULL, 3, 'Hitzkirch', '2014-10-21', 0.00);
INSERT INTO angestellter VALUES (1019, 'Affolter', 'Vreni', 233, 4123.00, 1001, 1, 'Zürich', '2014-10-21', 0.00);
INSERT INTO angestellter VALUES (1100, 'Widmer', 'Karl', 450, 7500.00, 1010, 3, 'Emmen', '2014-10-21', 0.00);
INSERT INTO angestellter VALUES (1123, 'Meier', 'Franz', 240, 9765.00, 1001, 1, 'Zug', '2014-10-21', 0.00);
INSERT INTO angestellter VALUES (2098, 'Zürcher', 'Hedi', 249, 10019.00, 1001, 1, 'Horw', '2014-10-21', 0.00);
INSERT INTO angestellter VALUES (2109, 'Heiniger', 'Urs', 345, 4098.00, 1002, 2, 'Luzern', '2014-10-21', 0.00);
INSERT INTO angestellter VALUES (2298, 'Pauli', 'Monika', 478, 5089.00, 1010, 3, 'Luzern', '2014-10-21', 0.00);
INSERT INTO angestellter VALUES (2345, 'Becker', 'Fritz', 310, 6346.00, 1002, 2, 'Hochdorf', '2014-10-21', 0.00);
INSERT INTO angestellter VALUES (2567, 'Ammann', 'Fritz', 467, 7890.00, 1010, 3, 'Baar', '2014-10-21', 0.00);
INSERT INTO angestellter VALUES (2601, 'Wehrli', 'Anton', NULL, 5980.00, 2567, 3, 'Luzern', '2014-10-21', 0.00);
INSERT INTO angestellter VALUES (2666, 'Beeler', 'Hans', NULL, 3780.00, 2567, 3, 'Rotkreuz', '2014-10-21', 0.00);
INSERT INTO angestellter VALUES (2701, 'Graber', 'Berta', 451, 4590.00, 1100, 3, 'Sursee', '2014-10-21', 0.00);
INSERT INTO angestellter VALUES (3000, 'Aarburg', 'Werner', 400, 9000.00, 1100, 3, 'Abtwil', '2014-10-21', 0.00);
INSERT INTO angestellter VALUES (3019, 'Kern', 'Veronika', 401, 4800.00, 3000, 3, 'Sins', '2014-10-21', 0.00);
INSERT INTO angestellter VALUES (3333, 'Wernli', 'Peter', 112, 8978.00, 1001, 1, 'Luzern', '2014-10-21', 0.00);
INSERT INTO angestellter VALUES (3338, 'Kramer', 'Luise', NULL, 4000.00, 3000, 3, 'Luzern', '2014-10-21', 0.00);
INSERT INTO angestellter VALUES (4000, 'Rey', 'Herbert', 480, 15000.00, NULL, 4, 'Adligenswil', '2014-10-21', 0.00);
INSERT INTO angestellter VALUES (4010, 'Danuser', 'Vreni', 481, 5100.00, 4000, 4, 'Luzern', '2014-10-21', 0.00);
INSERT INTO angestellter VALUES (2000, 'Schnell', 'Marie', 601, 5100.00, 4000, 4, 'Luzern', '2014-10-21', 0.00);
INSERT INTO angestellter VALUES (2010, 'Gschwind', 'Fritz', 602, 5900.00, 4000, 4, 'Luzern', '2014-10-21', 0.00);
INSERT INTO angestellter VALUES (2020, 'Test', 'Hans', 602, 5900.00, 4000, 4, 'Luzern', '2014-10-21', 0.00);

INSERT INTO projekt VALUES (25, 'Saturn              ', '1994-01-01', 30, 120, 1001);
INSERT INTO projekt VALUES (26, 'Mars                ', '1992-12-01', 500, 1000, 1100);
INSERT INTO projekt VALUES (27, 'Uranus              ', NULL, NULL, NULL, 1100);
INSERT INTO projekt VALUES (30, 'Jupiter             ', '1993-02-12', 10, 50, 1001);

INSERT INTO projektzuteilung VALUES (1001, 26, 30, NULL, NULL);
INSERT INTO projektzuteilung VALUES (1001, 27, 30, NULL, NULL);
INSERT INTO projektzuteilung VALUES (1001, 30, 10, NULL, NULL);
INSERT INTO projektzuteilung VALUES (1019, 25, 90, NULL, NULL);
INSERT INTO projektzuteilung VALUES (1100, 26, 50, NULL, NULL);
INSERT INTO projektzuteilung VALUES (1123, 25, 50, '1994-01-01', NULL);
INSERT INTO projektzuteilung VALUES (1123, 30, 90, NULL, NULL);
INSERT INTO projektzuteilung VALUES (2098, 26, 20, NULL, NULL);
INSERT INTO projektzuteilung VALUES (2098, 27, 31, NULL, NULL);
INSERT INTO projektzuteilung VALUES (2298, 26, 89, NULL, NULL);
INSERT INTO projektzuteilung VALUES (2601, 25, 30, NULL, NULL);
INSERT INTO projektzuteilung VALUES (2601, 26, 40, NULL, NULL);
INSERT INTO projektzuteilung VALUES (2601, 30, 40, NULL, NULL);
INSERT INTO projektzuteilung VALUES (2701, 26, 90, NULL, NULL);

SELECT pg_catalog.setval('s_angestellter', 2000, false);

ALTER TABLE ONLY abteilung
    ADD CONSTRAINT abteilung_pkey PRIMARY KEY (abtnr);

ALTER TABLE ONLY abtleitung
    ADD CONSTRAINT abtleitung_abtchef_key UNIQUE (abtchef);

ALTER TABLE ONLY abtleitung
    ADD CONSTRAINT abtleitung_pkey PRIMARY KEY (abtnr);

ALTER TABLE ONLY angestellter
    ADD CONSTRAINT angestellter_pkey PRIMARY KEY (persnr);

ALTER TABLE ONLY projekt
    ADD CONSTRAINT projekt_pkey PRIMARY KEY (projnr);

ALTER TABLE ONLY projektzuteilung
    ADD CONSTRAINT projektzuteilung_pkey PRIMARY KEY (persnr, projnr);

ALTER TABLE ONLY abtleitung
    ADD CONSTRAINT fk_abtlabt FOREIGN KEY (abtnr) REFERENCES abteilung(abtnr) ON DELETE CASCADE;

ALTER TABLE ONLY abtleitung
    ADD CONSTRAINT fk_abtlang FOREIGN KEY (abtchef) REFERENCES angestellter(persnr) ON DELETE CASCADE;

ALTER TABLE ONLY angestellter
    ADD CONSTRAINT fk_angabt FOREIGN KEY (abtnr) REFERENCES abteilung(abtnr);

ALTER TABLE ONLY angestellter
    ADD CONSTRAINT fk_angang FOREIGN KEY (chef) REFERENCES angestellter(persnr);

ALTER TABLE ONLY projekt
    ADD CONSTRAINT fk_projang FOREIGN KEY (projleiter) REFERENCES angestellter(persnr);

ALTER TABLE ONLY projektzuteilung
    ADD CONSTRAINT fk_projzang FOREIGN KEY (persnr) REFERENCES angestellter(persnr) ON DELETE CASCADE;

ALTER TABLE ONLY projektzuteilung
    ADD CONSTRAINT fk_projzproj FOREIGN KEY (projnr) REFERENCES projekt(projnr) ON DELETE CASCADE;