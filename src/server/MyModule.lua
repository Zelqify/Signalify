local MyModule = {}
local Signalify = require(game.ReplicatedStorage.Signalify.signalify)



MyModule.Signalify = {}

local Signals

function MyModule.Signalify.initialize()
    Signals = Signalify.createSignals({
        ["MyVeryFirstSignal"] = {}
    })
    Signals.MyVeryFirstSignal:Fire("HELLO")
end


function MyModule.Signalify.MyVeryFirstSignal(...)
    print(...)
end

return MyModule