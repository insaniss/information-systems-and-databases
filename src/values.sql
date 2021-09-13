-- scheme
INSERT INTO scheme(type, width, height) VALUES ('S-2-34', 14, 21);
INSERT INTO scheme(type, width, height) VALUES ('X-04', 13, 17);
INSERT INTO scheme(type, width, height) VALUES ('S-2-34', 16, 28);
-- control
INSERT INTO control(date) VALUES ('2020-09-11 00:00:00');
INSERT INTO control(date) VALUES ('1999-11-23 12:23:59');
INSERT INTO control(date) VALUES ('2000-01-11 00:59:59');
-- color
INSERT INTO color(name) VALUES ('red');
INSERT INTO color(name) VALUES ('white');
INSERT INTO color(name) VALUES ('black');
INSERT INTO color(name) VALUES ('blue');
INSERT INTO color(name) VALUES ('green');
INSERT INTO color(name) VALUES ('grey');
INSERT INTO color(name) VALUES ('pink');
-- card
INSERT INTO card(name, color) VALUES ('D-2', 3);
INSERT INTO card(name, color) VALUES ('S-4', 2);
INSERT INTO card(name, color) VALUES ('D-3', 2);
INSERT INTO card(name, color) VALUES ('D-7', 7);
-- cardbox
INSERT INTO cardbox(card_one, card_two, card_three, color) VALUES (1, 2, 4, 3);
-- tester
INSERT INTO tester(name, year, company, card) VALUES ('АЕ-35', 2019, 'Testlio', 2);
INSERT INTO tester(name, year, card) VALUES ('AA-02', 2007, 3);
-- testing_scheme
INSERT INTO testing_scheme(tester, scheme, control) VALUES (2, 3, 1);
INSERT INTO testing_scheme(tester, scheme, control) VALUES (2, 1, 2);
INSERT INTO testing_scheme(tester, scheme, control) VALUES (1, 2, 3);
-- display
INSERT INTO display(resolution, diagonal) VALUES ('4:3', 32);
INSERT INTO display(resolution, diagonal) VALUES ('3:2', 64);
-- button
INSERT INTO button(radius, color) VALUES (2, 1);
INSERT INTO button(radius, color) VALUES (2, 1);
INSERT INTO button(radius, color) VALUES (1, 4);
-- lens
INSERT INTO lens(radius, focal_length, curvature_radius) VALUES (3, 17, 5);
INSERT INTO lens(radius, focal_length, curvature_radius) VALUES (2, 15, 6);
-- microscope
INSERT INTO microscope(name, height, lens) VALUES ('Stereo', 18, 1);
INSERT INTO microscope(name, height, lens) VALUES ('Inverted', 22, 2);
-- composition
INSERT INTO composition(tester, display, button, microscope) VALUES (1, 2, 2, 1);
INSERT INTO composition(tester, display, button, microscope) VALUES (2, 1, 3, 2);