repeat wait() until game:IsLoaded()

local G = getgenv and getgenv() or _G or shared
G.Get = setmetatable({}, {__index = function(A, B) return game:GetService(B) end})

for i,v in pairs(game.GetChildren(game)) do
    G[v.ClassName] = v
end

G.Player = Players.LocalPlayer
G.wait = task.wait
G.spawn = task.spawn
G.Heartbeat = RunService.Heartbeat
G.Stepped = RunService.Stepped
G.RenderStepped = RunService.RenderStepped
G.Error = ScriptContext.Error
G.MessageOut = LogService.MessageOut
G.Kick = Player.Kick
G.Idled = Player.Idled
local getconstants=debug.getconstants or getconstants
local getidentity=get_thread_context or getthreadcontext or getidentity or syn.get_thread_identity
local setidentity=set_thread_context or setthreadcontext or setidentity or syn.set_thread_identity
local hookfunc=hookfunction or hookfunc or detour_function
for a,b in next,getgc()do 
    if type(b)=="function"and islclosure(b)then 
        local c=getconstants(b)
        if table.find(c,"Detected")and table.find(c,"crash")then 
            hookfunc(b,function()return task.wait(math.huge)end)
        end 
    end 
end 

for a,b in next,getgc(true)do 
    if rawget(b,"indexInstance")and type(rawget(b,"indexInstance"))=="table"then 
        hookfunc(b.tvk,function()return game:GetService("CoreGui"):WaitForChild("nil/nil/Nigger, Hellp %%%#()*()$*#))(*#(%&)(%(&%#&)&*%4")end)
    end 
end

local Name = game.PlaceId .. ".json"
local Des = {}
if makefolder and not isfile("Kiaro") then
    makefolder("Kiaro")
end

G.Settings = {}
local Pcall = pcall(function()
    if isfile("Kiaro//" .. Name) then
        readfile("Kiaro//" .. Name)
    else
        writefile("Kiaro//" .. Name, HttpService:JSONEncode(Des))
    end
end)

if isfile("Kiaro//" .. Name) and readfile("Kiaro//" .. Name) then
    Settings = HttpService:JSONDecode(readfile("Kiaro//" .. Name))
end

local Hack = {
    "Kick",
    "kick",
}

local Uh = {
    Player.Idled,
    ScriptContext.Error,
    LogService.MessageOut,
}

local Hacker = nil
Hacker = hookmetamethod(game, "__namecall", newcclosure(function(...)
    local Self, Key = ...
    if table.find(Hack, getnamecallmethod()) and Self == Player then
        return
    end
    if type(Self) == "Instance" then
        return Hacker(...)
    end
    return Hacker(...)
end))

if game.GameId ~= 4777817887 then
	local OldHook = nil
	OldHook = hookfunction(Instance.new("RemoteEvent").FireServer, newcclosure(function(...)
		local Self, Key = ...
		if Self.Name == "" then
			return 
		end
		return OldHook(...)
	end))
end

if setfflag then
    setfflag("HumanoidParallelRemoveNoPhysics", "False")
    setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
end
if setfpscap then
    setfpscap(100)
end

G.GetFunction = function(A)
    for i,v in next, getgc() do
        if type(v) == "function" and getinfo(v).name == A and islclosure(v) then
            return v 
        end
    end
end

G.Teleport = function(A, B, Toggle)
    if Toggle and A and B then
        A.CFrame = B
    end
    return A, B, Toggle
end

G.DisableConnection = function(A)
    for i,v in next, getconnections(A) do 
        v:Disable()
    end
    return A
end

G.FireConnection = function(A)
    for i,v in next, getconnections(A) do
        v:Fire()
    end
end

G.Tween = function(A, B, C)
    if A and B then
        local Time = (B.Position - A.Position).Magnitude / C 
        local Info = TweenInfo.new(Time, Enum.EasingStyle.Linear)
        local Tween = TweenService:Create(A, Info, {CFrame = CFrame.new(B.Position)})
        Tween:Play()
        if Tween.Completed then
            Tween.Completed:Wait()
        end
    end
    return A, B, C
end

G.Save = function()
    pcall(function()
        writefile("Kiaro//" .. Name, HttpService:JSONEncode(Settings))
    end)
end

G.ServerHop = function()
    spawn(function()
        while wait() do
            pcall(function()
                local Gay = HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. game.PlaceId .. '/servers/Public?sortOrder=Asc&limit=100'))
                for i,v in next, Gay.data do
                    if v.playing < v.maxPlayers then
                        TeleportService:TeleportToPlaceInstance(game.PlaceId, v.id, Player)
                        break
                    end
                end
            end)
            wait(4)
        end
    end)
end

G.Rejoin = function()
    return TeleportService:Teleport(game.PlaceId, Player)
end

G.NoClip = function(A)
    return A:ChangeState(11)
end
G.NoClip2 = function(A)
    for i,v in next, A:GetChildren() do
        if v:IsA("BasePart") then
            v.CanCollide = false 
        end
    end
end
G.SendNotification = function(Title, Text, Icon, Duration)
    return StarterGui:SetCore("SendNotification", {Title = Title, Text = Text, Icon = Icon, Duration = Duration})
end

G.Mag = function(A, B)
    return (A.Position - B.Position).Magnitude
end
ScriptContext:SetTimeout(0)
if game.GameId ~= 111958650 then
	for i,v in next, Uh do 
		DisableConnection(v)
	end
end
