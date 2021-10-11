WITH result AS (
    select cardbox.cardbox_id,
           cardbox.width,
           cardbox.height,
           sum(duration) as total
    from cardbox
        join card on card.cardbox = cardbox.cardbox_id
        join tester on tester.card = card.card_id
        join testing_scheme on testing_scheme.tester = tester.tester_id
        join control on control.control_id = testing_scheme.control
    group by cardbox.cardbox_id,
             card.card_id
) SELECT * FROM result WHERE (total = (SELECT MAX(total) FROM result));