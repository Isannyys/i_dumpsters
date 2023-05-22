
Config = {}

Config.Props = {"prop_dumpster_01a", "prop_dumpster_02a", "prop_dumpster_02b","prop_dumpster_4a","prop_dumpster_4b"} -- Prop list

Config.StartButton = 38 -- Default E (https://docs.fivem.net/docs/game-references/controls/)
Config.StopButton = 73 -- Default X while searching (https://docs.fivem.net/docs/game-references/controls/)
Config.SearchTime = 10000 -- In MS, default 10000 ms

Config.DumpsterLoot = { -- Chances 0-100% and MaxAmount not matter. You can add as many items as you want.
    {name = "bread", Chance = 30, MaxAmount = 2},
    {name = "water", Chance = 50, MaxAmount = 5},
}

-- locales en
Config.SearchText = 'Press ~b~E~s~ to search dumpster'
Config.AlreadySearched = 'You already searched this dumpster!'
Config.StopSearching = 'You stopped searching!'
Config.NotFound = 'You didnt find anything!'
Config.FoundSomething = 'You found '

--[[

    locales fi
Config.SearchText = 'Paina ~b~E~s~ tutkiaksesi roskista'
Config.AlreadySearched = 'Olet jo tutkinut tämän roskiksen!'
Config.StopSearching = 'Tutkiminen keskeytetty!'
Config.NotFound = 'Et löytänyt mitään!'
Config.FoundSomething = 'Löysit '

--]]