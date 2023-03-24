local MyModule = {}
local Signalify = require(game.ReplicatedStorage.Signalify.signalify)



MyModule.Signalify = {}

local Signals

function MyModule.Signalify.initialize()
    Signals = Signalify.createSignals({
        ["MyVeryFirstSignal"] = {}
    })
end

return MyModule