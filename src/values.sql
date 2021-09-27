-- scheme
INSERT INTO scheme(type, height, width, model, country) VALUES ('Structural', 24.1, 16.4, 'ID-1.8', 'China');
INSERT INTO scheme(type, height, width, country) VALUES ('Functional', 34.25, 18.6, 'Russia');
-- control
INSERT INTO control(time) VALUES ('2020-09-11 00:00:00');
INSERT INTO control(time) VALUES ('1999-11-23 12:23:59');
INSERT INTO control(time) VALUES ('2000-01-11 00:59:59');
-- color
INSERT INTO color(name, red, green, blue) VALUES ('red', 255, 0, 0);
INSERT INTO color(name, red, green, blue) VALUES ('white', 255, 255, 255);
INSERT INTO color(name, red, green, blue) VALUES ('black', 0, 0, 0);
INSERT INTO color(name, red, green, blue) VALUES ('blue', 0, 0, 255);
INSERT INTO color(name, red, green, blue) VALUES ('green', 0, 255, 0);
INSERT INTO color(name, red, green, blue) VALUES ('yellow', 255, 255, 0);
-- cardbox
INSERT INTO cardbox(width, height, color) VALUES (34.5, 56.25, 1);
INSERT INTO cardbox(width, height, color) VALUES (32.99, 48.09, 5);
-- card
INSERT INTO card(name, format, cardbox, color) VALUES ('lithium-ion', 'ID-1', 2, 4);
INSERT INTO card(name, color) VALUES ('electric-card', 3);
INSERT INTO card(name, format, color) VALUES ('turbo-io', 'ID-3', 1);
INSERT INTO card(name, format, color) VALUES ('electric-card', 'ID-2', 4);
-- tester
INSERT INTO tester(name, year, card) VALUES ('Service type tester', 2008, 2);
INSERT INTO tester(name, year, company, card) VALUES ('Quick-check in-circuit checker', 2018, 'IO', 4);
-- testing_scheme
INSERT INTO testing_scheme(tester, scheme, control) VALUES (1, 2, 3);
INSERT INTO testing_scheme(tester, scheme, control) VALUES (2, 1, 2);
-- display
INSERT INTO display(resolution, diagonal, power_saver) VALUES ('4:3', 13.4, false);
INSERT INTO display(resolution, diagonal, power_saver) VALUES ('16:9', 15.6, true);
-- button
INSERT INTO button(radius, color) VALUES (2.5, 4);
INSERT INTO button(radius) VALUES (2.1);
INSERT INTO button(radius) VALUES (2.75);
-- microscope
INSERT INTO microscope(type, weight, model, country) VALUES ('Electric', 24.3, 'MX-33.1', 'Canada');
INSERT INTO microscope(type, weight, model, country) VALUES ('Mechanic', 12.34, 'Ascm-1.1.0', 'Norway');
-- lens
INSERT INTO lens(type, curvature_radius, microscope) VALUES ('Biconvex', 23.4, 2);
INSERT INTO lens(type, curvature_radius) VALUES ('Plano-convex', 23.4);
INSERT INTO lens(type, curvature_radius, focal_length, microscope) VALUES ('Negative meniscus', 12.44, 13.05, 1);
-- composition
INSERT INTO composition(tester, display, button, microscope) VALUES (2, 2, 3, 1);
INSERT INTO composition(tester, display, button, microscope) VALUES (1, 1, 1, 2);