shovelKnightGUID = "f8dbb1"
cardsGUID = "dde65c"

-- Parameters for the button used to go to the next round. --

button_parameters = {}
button_parameters.click_function = 'nextRound'
button_parameters.function_owner = nil
button_parameters.label = 'Next Round'
button_parameters.position = {2.65,0.2,3.5}
button_parameters.rotation = {0,0,0}
button_parameters.width = 700
button_parameters.height = 500
button_parameters.font_size = 100

function onLoad()
    shovelKnight = getObjectFromGUID(shovelKnightGUID)
    shovelKnight.createButton(button_parameters)

    cards = getObjectFromGUID(cardsGUID)

    for i = 1, 10 do
        cards.shuffle()
    end
end

function nextRound()
    cards = getObjectFromGUID(cardsGUID)
    seated = getSeatedPlayers()

    for k, v in pairs(seated) do
        player = Player[v]
        table = player.getHandObjects()
        cardCount = 0
        for f, q in pairs(table) do
            cardCount = cardCount + 1
        end
        
        if cardCount < 7 then
            toGive = 7 - cardCount
            cards.deal(toGive, v)
        end
    end

    for i = 1, 3 do
        cards.shuffle()
    end
end

--[[ The onUpdate event is called once per frame. --]]
function onUpdate()
    --[[ print('onUpdate loop!') --]]
end
