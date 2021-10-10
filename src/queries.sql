-- showing a total duration
SELECT cardbox.cardbox_id, cardbox.width, cardbox.height, SUM(duration) AS total_duration
FROM cardbox
    JOIN card           ON card.cardbox           = cardbox.cardbox_id
    JOIN tester         ON tester.card            = card.card_id
    JOIN testing_scheme ON testing_scheme.tester  = tester.tester_id
    JOIN control        ON testing_scheme.control = control.control_id
GROUP BY cardbox.cardbox_id,
         card.card_id
ORDER BY total_duration DESC LIMIT 1;
-- without showing a total duration
SELECT cardbox.cardbox_id, cardbox.width, cardbox.height
FROM cardbox
         JOIN card           ON card.cardbox           = cardbox.cardbox_id
         JOIN tester         ON tester.card            = card.card_id
         JOIN testing_scheme ON testing_scheme.tester  = tester.tester_id
         JOIN control        ON testing_scheme.control = control.control_id
GROUP BY cardbox.cardbox_id,
         card.card_id
ORDER BY SUM(duration)       DESC LIMIT 1;