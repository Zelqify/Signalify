local Signalify = {}
Signalify.__index = Signalify




----------


type table = { [number] : string}

function Signalify.initialize(packages : Folder)
    local startTime = tick()
    print("Initializing Signalify...")
    for _,module in ipairs(packages:GetChildren()) do
        if module:IsA("ModuleScript") then
            local requiredModule = require(module)
            requiredModule.Signalify.initialize()
        end
    end
    local totalTime = tick() - startTime
    print("Signalify initialization completed! It took {totalTime} seconds to initialize.")
end


function Signalify.createSignals(signalList : table)
    local Signals = {}
    for _,value in pairs(signalList) do 
        table.insert(Signals, value)
    end
    setmetatable(Signals, Signalify)
    return Signals
end



return Signalify



