local Signalify = {}
Signalify.__index = Signalify

local Signal = {}
Signal.__index = Signal


----------


type table = { [number] : string}

local serverPackages = nil


function Signalify.initialize(packages : Folder)
    local startTime = tick()
    serverPackages = packages
    print("Initializing Signalify...")
    for _,module in ipairs(packages:GetChildren()) do
        if module:IsA("ModuleScript") then
            local requiredModule = require(module)
            requiredModule.Signalify.initialize()
        end
    end
    local totalTime = tick() - startTime
    print("Signalify started. It took " .. totalTime .. " seconds to initialize.")
end


function Signal.new(id : string)
    local self = setmetatable({}, Signal)
    self.id = id
    return self
end

function Signal:Fire(...)
    local args = ...
    for _,code in ipairs(serverPackages:GetChildren()) do
        if code:IsA("ModuleScript") then
            local requiredCode = require(code)
            requiredCode.Signalify[self.id](args)
        end
      
    end
end

function Signalify.createSignals(signalList: { [string]: { string } }): { [string]: typeof(Signal) }
    local Signals = {}
    for name, _ in signalList do
        Signals[name] = Signal.new(name)
    end
    print(Signals)
    return Signals
end

return Signalify
