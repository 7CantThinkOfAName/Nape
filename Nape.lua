local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Nape 🔥", "Synapse")

if game.PlaceId == 6872265039 --BEDWARS
local General = Window:NewTab("General")
local VapeSection = Tab:NewSection("Vape")



VapeSection:NewButton("Vape", "Executes Vape script (Created by 7GrandDad)", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
end)


local OtherScriptsSection = Tab:NewSection("Other Scripts")



OtherScriptsSection:NewButton("Rise", "Execute RiseForRoblox (Also made by 7GrandDad)", function()
    local riseoptions = {
        CustomText = "",
        Theme = "Rise Blend",
        RenderToggle = true,
        ShowRenderModules = true,
        R = 1,
        G = 1,
        B = 1
    }
    
    local risethemes = {
        ["Rise Blend"] = {
            TextGUIColor1 = Color3.fromRGB(71, 233, 160),
            TextGUIColor2 = Color3.fromRGB(71, 148, 253),
        },
        ["Rise"] = {
            TextGUIColor1 = Color3.fromRGB(255, 255, 255),
            TextGUIColor2 = Color3.fromRGB(255, 255, 255),
        },
        ["Rise Christmas"] = {
            TextGUIColor1 = Color3.fromRGB(255, 12, 12),
            TextGUIColor2 = Color3.fromRGB(255, 255, 255),
        },
        ["Rise Cotton Candy"] = {
            TextGUIColor1 = Color3.fromRGB(241, 111, 204),
            TextGUIColor2 = Color3.fromRGB(101, 246, 254),
        },
        ["Rice"] = {
            TextGUIColor1 = Color3.fromRGB(190, 0, 255),
            TextGUIColor2 = Color3.fromRGB(0, 190, 255),
        },
    }
    
    if isfolder("rise") == false then
        makefolder("rise")
    end
    if isfolder("rise/assets") == false then
        makefolder("rise/assets")
    end
    
    local function SaveSettings()
        writefile("rise/settings.json", game:GetService("HttpService"):JSONEncode(riseoptions))
    end
    
    local lplr = game:GetService("Players").LocalPlayer
    local getasset = getsynasset or getcustomasset or function(location) return "rbxasset://"..location end
    local queueteleport = syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport or function() end
    local requestfunc = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or request or function(tab)
        if tab.Method == "GET" then
            return {
                Body = game:HttpGet(tab.Url, true),
                Headers = {},
                StatusCode = 200
            }
        else
            return {
                Body = "bad exploit",
                Headers = {},
                StatusCode = 404
            }
        end
    end 
    local betterisfile = function(file)
        local suc, res = pcall(function() return readfile(file) end)
        return suc and res ~= nil
    end
    local setthreadidentityfunc = syn and syn.set_thread_identity or set_thread_identity or setidentity or setthreadidentity
    local getthreadidentityfunc = syn and syn.get_thread_identity or get_thread_identity or getidentity or getthreadidentity
    local function GetURL(scripturl, rise)
        if shared.VapeDeveloper then
            if not betterisfile((rise and "rise/" or "vape/")..scripturl) then
                error("File not found : "..(rise and "rise/" or "vape/")..scripturl)
            end
            return readfile((rise and "rise/" or "vape/")..scripturl)
        else
            local res = game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/"..(rise and "RiseForRoblox" or "VapeV4ForRoblox").."/main/"..scripturl, true)
            assert(res ~= "404: Not Found", "File not found")
            return res
        end
    end
    
    local VapeGui
    spawn(function()
        repeat task.wait() until shared.GuiLibrary
        VapeGui = shared.GuiLibrary
        VapeGui["MainGui"].ScaledGui.Visible = false
    end)
    loadstring(GetURL("NewMainScript.lua"))()
    shared.VapeIndependent = true
    if not VapeGui then VapeGui = shared.GuiLibrary end
    local cachedassets = {}
    local function getcustomassetfunc(path)
        if not betterisfile(path) then
            spawn(function()
                local textlabel = Instance.new("TextLabel")
                textlabel.Size = UDim2.new(1, 0, 0, 36)
                textlabel.Text = "Downloading "..path
                textlabel.BackgroundTransparency = 1
                textlabel.TextStrokeTransparency = 0
                textlabel.TextSize = 30
                textlabel.Font = Enum.Font.SourceSans
                textlabel.TextColor3 = Color3.new(1, 1, 1)
                textlabel.Position = UDim2.new(0, 0, 0, -36)
                textlabel.Parent = VapeGui["MainGui"]
                repeat wait() until betterisfile(path)
                textlabel:Remove()
            end)
            local req = requestfunc({
                Url = "https://raw.githubusercontent.com/7GrandDadPGN/RiseForRoblox/main/"..path:gsub("rise/assets", "assets"),
                Method = "GET"
            })
            writefile(path, req.Body)
        end
        if cachedassets[path] == nil then
            cachedassets[path] = getasset(path) 
        end
        return cachedassets[path]
    end
    
    local teleportfunc = game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(State)
        if State == Enum.TeleportState.Started then
            local teleportstr = 'shared.VapeSwitchServers = true if shared.VapeDeveloper then loadstring(readfile("rise/main.lua"))() else loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/RiseForRoblox/main/main.lua", true))() end'
            if shared.VapeDeveloper then
                teleportstr = 'shared.VapeDeveloper = true '..teleportstr
            end
            if shared.VapePrivate then
                teleportstr = 'shared.VapePrivate = true '..teleportstr
            end
            VapeGui["SaveSettings"]()
            queueteleport(teleportstr)
        end
    end)
    
    local guilib = loadstring(GetURL("guilib.lua", true))()
    guilib.ScreenGui.MainFrame.Visible = VapeGui["MainBlur"].Enabled
    local windowtabs = {
        Combat = guilib:CreateCategory({
            Name = "Combat",
            Icon = "⚔️"
        }),
        Blatant = guilib:CreateCategory({
            Name = "Blatant",
            Icon = "⚠️"
        }),
        Render = guilib:CreateCategory({
            Name = "Render",
            Icon = "👁️"
        }),
        Utility = guilib:CreateCategory({
            Name = "Utility",
            Icon = "🛠️"
        }),
        World = guilib:CreateCategory({
            Name = "World",
            Icon = "🌎"
        }),
        Info = guilib:CreateCategory({
            Name = "Info",
            Icon = "ℹ️"
        })
    }
    
    local infolab1 = windowtabs.Info:CreateLabel()
    infolab1.Size = UDim2.new(0, 200, 0, 70)
    infolab1.Position = UDim2.new(0, 124, 0, 155)
    infolab1.TextColor3 = Color3.fromRGB(180, 180, 180)
    infolab1.TextSize = 90
    infolab1.Font = Enum.Font.SourceSans
    infolab1.Text = "Rise"
    infolab1.TextXAlignment = Enum.TextXAlignment.Left
    infolab1.TextYAlignment = Enum.TextYAlignment.Bottom
    infolab1.BackgroundTransparency = 1
    local infolab2 = windowtabs.Info:CreateLabel()
    infolab2.Size = UDim2.new(0, 200, 0, 70)
    infolab2.Position = UDim2.new(0, 250, 0, 136)
    infolab2.TextColor3 = Color3.fromRGB(130, 130, 130)
    infolab2.TextSize = 40
    infolab2.Font = Enum.Font.SourceSans
    infolab2.Text = "roblox"
    infolab2.TextXAlignment = Enum.TextXAlignment.Left
    infolab2.TextYAlignment = Enum.TextYAlignment.Top
    infolab2.BackgroundTransparency = 1
    local infolab3 = windowtabs.Info:CreateLabel()
    infolab3.Size = UDim2.new(0, 200, 0, 70)
    infolab3.Position = UDim2.new(0, 124, 0, 263)
    infolab3.TextColor3 = Color3.fromRGB(180, 180, 180)
    infolab3.TextSize = 30
    infolab3.Font = Enum.Font.SourceSansLight
    infolab3.Text = "Registered to xylex"
    infolab3.TextXAlignment = Enum.TextXAlignment.Left
    infolab3.TextYAlignment = Enum.TextYAlignment.Top
    infolab3.BackgroundTransparency = 1
    local infolab4 = windowtabs.Info:CreateLabel()
    infolab4.Size = UDim2.new(0, 200, 0, 70)
    infolab4.Position = UDim2.new(0, 124, 0, 320)
    infolab4.TextColor3 = Color3.fromRGB(130, 130, 130)
    infolab4.TextSize = 30
    infolab4.Font = Enum.Font.SourceSansLight
    infolab4.Text = [[
    Orignal Client by Alan32, Technio
    Strikeless, Nicklas, Auth,
    Hazsi, Solastis
    and Billionare
    intent.store
    riseclient.com
        
    Roblox Port by 7GrandDad
    All rights goto the Rise Team
    ]]
    infolab4.TextXAlignment = Enum.TextXAlignment.Left
    infolab4.TextYAlignment = Enum.TextYAlignment.Top
    infolab4.BackgroundTransparency = 1
    
    VapeGui["MainGui"].ScaledGui.Visible = false
    VapeGui["MainBlur"].Size = 0
    VapeGui["MainBlur"]:GetPropertyChangedSignal("Enabled"):connect(function()
        guilib.ScreenGui.MainFrame.Visible = VapeGui["MainBlur"].Enabled
        if VapeGui["MainBlur"].Enabled then
            guilib.ScreenGui.MainFrame.Size = UDim2.new(0, 664, 0, 560)
            guilib.ScreenGui.MainFrame.Position = UDim2.new(0.5, -264, 0.5, -294)
            guilib.ScreenGui.MainFrame:TweenSize(UDim2.new(0, 830, 0, 700), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.2, true)
            guilib.ScreenGui.MainFrame:TweenPosition(UDim2.new(0.5, -330, 0.5, -368), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.2, true)
        end
    end)
    
    local windowbuttons = {}
    local tab = {}
    local tab2 = {}
    for i,v in pairs(VapeGui["ObjectsThatCanBeSaved"]) do 
        if v.Type == "OptionsButton" then
            table.insert(tab, v)
        end
        if v.Type == "Toggle" then
            table.insert(tab2, v)
        end
        if v.Type == "Slider" then
            table.insert(tab2, v)
        end
        if v.Type == "Dropdown" then
            table.insert(tab2, v)
        end
        if v.Type == "TextBox" then
            table.insert(tab2, v)
        end
        if v.Type == "ColorSlider" then
            table.insert(tab2, v)
        end
    end
    table.sort(tab, function(a, b) 
        if a.Type ~= "OptionsButton" then
            a = {Object = {Name = tostring(a["Object"].Parent):gsub("Children", "")..a["Object"].Name}}
        else
            a = {Object = {Name = a["Object"].Name}}
        end
        if b.Type ~= "OptionsButton" then
            b = {Object = {Name = tostring(b["Object"].Parent):gsub("Children", "")..b["Object"].Name}}
        else
            b = {Object = {Name = b["Object"].Name}}
        end
        return a["Object"].Name:lower() < b["Object"].Name:lower() 
    end)
    --[[table.sort(tab2, function(a, b) 
        a = {Object = {Name = tostring(a["Object"].Parent):gsub("Children", "")..a["Object"].Name}}
        b = {Object = {Name = tostring(b["Object"].Parent):gsub("Children", "")..b["Object"].Name}}
        return a["Object"].Name:lower() < b["Object"].Name:lower() 
    end)]]
    for i,v in pairs(tab) do 
        if v.Type == "OptionsButton" then 
            local old = v["Api"]["ToggleButton"]
            local newstr = tostring(v["Object"]):gsub("Button", "")
            windowbuttons[newstr] = windowtabs[tostring(v["Object"].Parent.Parent)]:CreateButton({
                Name = newstr,
                Function = function(callback)
                    if callback ~= v["Api"]["Enabled"] then
                        old(true)
                    end
                end,
                HoverText = v["Api"]["HoverText"] or ""
            })
            v["Api"]["ToggleButton"] = function(clicked, toggle)
                local res = old(clicked, toggle)
                windowbuttons[newstr]:ToggleButton(false, v["Api"]["Enabled"])
                return res
            end
            windowbuttons[newstr]:ToggleButton(false, v["Api"]["Enabled"])
        end
    end
    for i,v in pairs(tab2) do 
        if v.Type == "Toggle" and tostring(v["Object"].Parent.Parent.Parent) ~= "ClickGui" and VapeGui["ObjectsThatCanBeSaved"][tostring(v["Object"].Parent):gsub("Children", "OptionsButton")] and VapeGui["ObjectsThatCanBeSaved"][tostring(v["Object"].Parent):gsub("Children", "OptionsButton")]["ChildrenObject"] == v["Object"].Parent then
            local newstr = tostring(v["Object"].Parent):gsub("Children", "")
            local old = v["Api"]["ToggleButton"]
            local tog = windowbuttons[newstr]:CreateToggle({
                Name = tostring(v["Object"]):gsub("Button", ""),
                Function = function(callback)
                    if callback ~= v["Api"]["Enabled"] then
                        old(not v["Api"]["Enabled"])
                    end
                end
            })
            v["Api"]["ToggleButton"] = function(clicked, toggle)
                local res = old(clicked, toggle)
                tog:ToggleButton(false, v["Api"]["Enabled"])
                return res
            end
            tog:SetLayoutOrder(v["Object"].LayoutOrder)
            tog:ToggleButton(false, v["Api"]["Enabled"])
            tog.Object.Visible = v["Object"].Visible
            v["Object"]:GetPropertyChangedSignal("Visible"):connect(function()
                tog.Object.Visible = v["Object"].Visible
             end)
        end
        if v.Type == "Slider" and VapeGui["ObjectsThatCanBeSaved"][tostring(v["Object"].Parent):gsub("Children", "OptionsButton")] and VapeGui["ObjectsThatCanBeSaved"][tostring(v["Object"].Parent):gsub("Children", "OptionsButton")]["ChildrenObject"] == v["Object"].Parent then
             local newstr = tostring(v["Object"].Parent):gsub("Children", "")
             local old = v["Api"]["SetValue"]
             local slider = windowbuttons[newstr]:CreateSlider({
                Name = v["Object"].Name,
                Min = v["Api"]["Min"],
                Max = v["Api"]["Max"],
                Function = function(s) -- 500 (MaxValue) | 0 (MinValue)
                    if s ~= v["Api"]["Value"] then
                        old(s)
                    end
                end
             })
             slider:SetLayoutOrder(v["Object"].LayoutOrder)
             v["Api"]["SetValue"] = function(value, ...)
                 local res = old(value, ...)
                 slider:SetValue(value)
                 return res
             end
             v["Api"]["SetValue"](tonumber(v["Api"]["Value"]))
             slider.Object.Visible = v["Object"].Visible
             v["Object"]:GetPropertyChangedSignal("Visible"):connect(function()
                slider.Object.Visible = v["Object"].Visible
             end)
        end
        if v.Type == "Dropdown" and VapeGui["ObjectsThatCanBeSaved"][tostring(v["Object"].Parent):gsub("Children", "OptionsButton")] and VapeGui["ObjectsThatCanBeSaved"][tostring(v["Object"].Parent):gsub("Children", "OptionsButton")]["ChildrenObject"] == v["Object"].Parent then
            local newstr = tostring(v["Object"].Parent):gsub("Children", "")
            local old = v["Api"]["SetValue"]
            local drop = windowbuttons[newstr]:CreateDropdown({
                Name = v["Object"].Name,
                List = v["Api"]["List"],
                Function = function(s)
                    if s ~= v["Api"]["Value"] then
                        old(s)
                    end
                end
            })
            drop:SetValue(v["Api"]["Value"])
            drop:SetLayoutOrder(v["Object"].LayoutOrder)
            drop.Object.Visible = v["Object"].Visible
            v["Object"]:GetPropertyChangedSignal("Visible"):connect(function()
                drop.Object.Visible = v["Object"].Visible
            end)
        end
        if v.Type == "TextBox" and VapeGui["ObjectsThatCanBeSaved"][tostring(v["Object"].Parent):gsub("Children", "OptionsButton")] and VapeGui["ObjectsThatCanBeSaved"][tostring(v["Object"].Parent):gsub("Children", "OptionsButton")]["ChildrenObject"] == v["Object"].Parent then
            local newstr = tostring(v["Object"].Parent):gsub("Children", "")
            local old = v["Api"]["SetValue"]
            local drop = {["Value"] = ""}
            drop = windowbuttons[newstr]:CreateTextBox({
                Name = v["Object"].Name,
                TempText = v["Object"].AddBoxBKG.AddBox.PlaceholderText,
                Function = function(val)
                    if val ~= v["Api"]["Value"] then
                        old(drop["Value"], false)
                    end
                end
            })
            drop:SetValue(v["Api"]["Value"])
            drop:SetLayoutOrder(v["Object"].LayoutOrder)
            drop.Object.Visible = v["Object"].Visible
            v["Object"]:GetPropertyChangedSignal("Visible"):connect(function()
                drop.Object.Visible = v["Object"].Visible
            end)
        end
    end
    
    local oldtab
    local oldfunc
    local olduninject = VapeGui.SelfDestruct
    VapeGui.SelfDestruct = function(...)
        guilib.ScreenGui:Remove()
        if oldtab and oldfunc then 
            oldtab.ProcessCompletedChatMessage = oldfunc
        end
        if teleportfunc then 
            teleportfunc:Disconnect()
        end
        return olduninject(...)
    end
    windowtabs.World:CreateButton({
        Name = "UnInject",
        Function = function(callback)
            VapeGui.SelfDestruct()
        end
    })
    
    local modal = Instance.new("TextButton")
    modal.Size = UDim2.new(0, 0, 0, 0)
    modal.BorderSizePixel = 0
    modal.Text = ""
    modal.Modal = true
    modal.Parent = guilib.ScreenGui.MainFrame
    local targetinfo = Instance.new("Frame")
    targetinfo.Size = UDim2.new(0, 258, 0, 80)
    targetinfo.Visible = false
    targetinfo.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    targetinfo.BackgroundTransparency = 0.5
    targetinfo.Position = UDim2.new(0.5, 72, 0.5, 54)
    targetinfo.ClipsDescendants = true
    targetinfo.Parent = guilib.ScreenGui
    local targetinfoscale = Instance.new("UIScale")
    targetinfoscale.Parent = targetinfo
    targetinfo:GetPropertyChangedSignal("Size"):connect(function()
        targetinfoscale.Scale = targetinfo.Size.X.Offset / 258
    end)
    local targetinfocorner = Instance.new("UICorner")
    targetinfocorner.CornerRadius = UDim.new(0, 8)
    targetinfocorner.Parent = targetinfo
    local targetinfopictureframe = Instance.new("Frame")
    targetinfopictureframe.Size = UDim2.new(0, 64, 0, 63)
    targetinfopictureframe.AnchorPoint = Vector2.new(0.5, 0.5)
    targetinfopictureframe.Position = UDim2.new(0, 38, 0, 39)
    targetinfopictureframe.BackgroundTransparency = 0.8
    targetinfopictureframe.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    targetinfopictureframe.Parent = targetinfo
    local targetinfopictureframecorner = Instance.new("UICorner")
    targetinfopictureframecorner.CornerRadius = UDim.new(0, 128)
    targetinfopictureframecorner.Parent = targetinfopictureframe
    local targetinfopicture = Instance.new("ImageLabel")
    targetinfopicture.Size = UDim2.new(1, -4, 1, -4)
    targetinfopicture.Position = UDim2.new(0, 2, 0, 2)
    targetinfopicture.BackgroundTransparency = 1
    targetinfopicture.ScaleType = Enum.ScaleType.Fit
    targetinfopicture.Image = 'rbxthumb://type=AvatarHeadShot&id=1&w=420&h=420'
    targetinfopicture.Parent = targetinfopictureframe
    local targetinfopicturecorner = Instance.new("UICorner")
    targetinfopicturecorner.CornerRadius = UDim.new(0, 128)
    targetinfopicturecorner.Parent = targetinfopicture
    local targetinfohealthbar = Instance.new("Frame")
    targetinfohealthbar.Position = UDim2.new(0, 74, 0, 55)
    targetinfohealthbar.BackgroundColor3 = Color3.fromRGB(133, 77, 195)
    targetinfohealthbar.BorderSizePixel = 0
    targetinfohealthbar.Size = UDim2.new(0, 140, 0, 10)
    targetinfohealthbar.Parent = targetinfo
    local notificationwindow = Instance.new("Frame")
    notificationwindow.Size = UDim2.new(1, 0, 1, 0)
    notificationwindow.BackgroundTransparency = 1
    notificationwindow.Parent = guilib.ScreenGui
    spawn(function()
        local num = 0
        repeat
            task.wait(0.01)
            local colornew = risethemes[riseoptions.Theme].TextGUIColor1
            if num < 1 then
                colornew = risethemes[riseoptions.Theme].TextGUIColor1:lerp(risethemes[riseoptions.Theme].TextGUIColor2, num)
            elseif num < 2 then 
                colornew = risethemes[riseoptions.Theme].TextGUIColor2:lerp(risethemes[riseoptions.Theme].TextGUIColor1, num - 1)
            else
                num = 0
            end
            targetinfohealthbar.BackgroundColor3 = colornew
            for i,v in pairs(notificationwindow:GetChildren()) do 
                if v:IsA("Frame") then 
                    pcall(function()
                        v.Frame.BackgroundColor3 = colornew
                        v.TextLabel.TextColor3 = colornew
                        v.TextLabel2.TextColor3 = colornew
                    end)
                end
            end
            num = num + 0.03
        until guilib.ScreenGui == nil or guilib.ScreenGui.Parent == nil
    end)
    local targetinfoname = Instance.new("TextLabel")
    targetinfoname.Font = Enum.Font.TitilliumWeb
    targetinfoname.TextSize = 40
    targetinfoname.BackgroundTransparency = 1 
    targetinfoname.TextColor3 = Color3.new(1, 1, 1)
    targetinfoname.Text = "Target info"
    targetinfoname.TextXAlignment = Enum.TextXAlignment.Left
    targetinfoname.Size = UDim2.new(1, -72, 0, 40)
    targetinfoname.TextScaled = true
    targetinfoname.Position = UDim2.new(0, 72, 0, 13)
    targetinfoname.Parent = targetinfo
    local targetinfohealthtext = Instance.new("TextLabel")
    targetinfohealthtext.Font = Enum.Font.TitilliumWeb
    targetinfohealthtext.TextSize = 26
    targetinfohealthtext.BackgroundTransparency = 1 
    targetinfohealthtext.TextColor3 = Color3.new(1, 1, 1)
    targetinfohealthtext.Text = "20.0"
    targetinfohealthtext.TextXAlignment = Enum.TextXAlignment.Left
    targetinfohealthtext.Size = UDim2.new(0, 20, 0, 30)
    targetinfohealthtext.Position = UDim2.new(0, 219, 0, 43)
    targetinfohealthtext.Parent = targetinfo
    local targetinfodamage = Instance.new("Frame")
    targetinfodamage.BackgroundTransparency = 1
    targetinfodamage.BorderSizePixel = 0
    targetinfodamage.BackgroundColor3 = Color3.new(1, 0, 0)
    targetinfodamage.Size = UDim2.new(1, 0, 1, 0)
    targetinfodamage.Parent = targetinfopictureframe
    local targetinfodamagecorner = Instance.new("UICorner")
    targetinfodamagecorner.CornerRadius = UDim.new(0, 128)
    targetinfodamagecorner.Parent = targetinfodamage
    local targetvape = shared.VapeTargetInfo
    local oldupdate = targetvape.UpdateInfo
    local lasthealth = 100
    local lastplr
    local healthanim
    local targetvisible = false
    targetvape.UpdateInfo = function(tab, targetsize)
        targetvisible = (targetsize > 0)
        if (targetsize > 0) then
            pcall(function()
                targetinfo:TweenSizeAndPosition(UDim2.new(0, 258, 0, 80), UDim2.new(0.5, 72, 0.5, 54), Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0, true)
            end)
            targetinfo.Visible = true
        else
            spawn(function()
                for i = 1, 30 do 
                    task.wait(0.01)
                    if targetvisible then return end
                end
                pcall(function()
                    targetinfo:TweenSizeAndPosition(UDim2.new(0, 0, 0, 0), UDim2.new(0.5, 144, 0.5, 108), Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0.2, true)
                end)
                for i = 1, 30 do 
                    task.wait(0.01)
                    if targetvisible then return end
                end
                targetinfo.Visible = false
            end)
        end
        for i,v in pairs(tab) do
            local plr = game:GetService("Players"):FindFirstChild(i)
            if lastplr ~= plr then 
                lastplr = plr
            else
                if v["Health"] < lasthealth then 
                    targetinfopictureframe.Size = UDim2.new(0, 59, 0, 58)
                    targetinfopictureframe:TweenSize(UDim2.new(0, 64, 0, 63), Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0.4, true)
                    if healthanim then 
                        healthanim:Cancel()
                    end
                    targetinfodamage.BackgroundTransparency = 0.4
                    healthanim = game:GetService("TweenService"):Create(targetinfodamage, TweenInfo.new(0.4), {BackgroundTransparency = 1})
                    healthanim:Play()
                end
            end
            lasthealth = v["Health"]
            targetinfopicture.Image = 'rbxthumb://type=AvatarHeadShot&id='..v["UserId"]..'&w=420&h=420'
            targetinfohealthbar:TweenSize(UDim2.new(0, 140 * (v["Health"] / v["MaxHealth"]), 0, 10), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.2, true)
            local healthtext = (math.floor((v["Health"] / 5) * 10) / 10)
            targetinfohealthtext.Text = healthtext..(tostring(healthtext):len() < 3 and ".0" or "")
            targetinfoname.Text = plr and plr.DisplayName or "Player"
        end
        return oldupdate(tab, targetsize)
    end
    
    local function bettertween(obj, newpos, dir, style, tim, override)
        spawn(function()
            local frame = Instance.new("Frame")
            frame.Visible = false
            frame.Position = obj.Position
            frame.Parent = guilib.ScreenGui
            frame:GetPropertyChangedSignal("Position"):connect(function()
                obj.Position = UDim2.new(obj.Position.X.Scale, obj.Position.X.Offset, frame.Position.Y.Scale, frame.Position.Y.Offset)
            end)
            frame:TweenPosition(newpos, dir, style, tim, override)
            frame.Parent = nil
            task.wait(tim)
            frame:Remove()
        end)
    end
    
    local function bettertween2(obj, newpos, dir, style, tim, override)
        spawn(function()
            local frame = Instance.new("Frame")
            frame.Visible = false
            frame.Position = obj.Position
            frame.Parent = guilib.ScreenGui
            frame:GetPropertyChangedSignal("Position"):connect(function()
                obj.Position = UDim2.new(frame.Position.X.Scale, frame.Position.X.Offset, obj.Position.Y.Scale, obj.Position.Y.Offset)
            end)
            pcall(function()
                frame:TweenPosition(newpos, dir, style, tim, override)
            end)
            frame.Parent = nil
            task.wait(tim)
            frame:Remove()
        end)
    end
    
    notificationwindow.ChildRemoved:connect(function()
        for i,v in pairs(notificationwindow:GetChildren()) do
            bettertween(v, UDim2.new(1, v.Position.X.Offset, 1, -(150 + 80 * (i - 1))), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.15, true)
        end
    end)
    
    local function removeTags(str)
        str = str:gsub("<br%s*/>", "\n")
        return (str:gsub("<[^<>]->", ""))
    end
    
    local risetext = Instance.new("TextLabel")
    risetext.Text = "Rise"
    risetext.Font = Enum.Font.TitilliumWeb
    risetext.TextSize = 53
    risetext.TextColor3 = Color3.new(1, 1, 1)
    risetext.BackgroundTransparency = 1
    risetext.TextYAlignment = Enum.TextYAlignment.Top
    risetext.TextXAlignment = Enum.TextXAlignment.Left
    risetext.Size = UDim2.new(0, 400, 0, 60)
    risetext.Position = UDim2.new(0, 6, 0, -10)
    risetext.Parent = guilib.ScreenGui
    local risetext2 = risetext:Clone()
    risetext2.TextColor3 = Color3.new(0, 0, 0)
    risetext2.Position = UDim2.new(0, 1, 0, 1)
    risetext2.ZIndex = 0
    risetext2.TextTransparency = 0.65
    risetext2.Parent = risetext
    local risegradient = Instance.new("UIGradient")
    risegradient.Rotation = 180
    risegradient.Parent = risetext
    local risetextversion = risetext:Clone()
    local risetextcustom = risetext:Clone()
    risetextversion.TextSize = 26
    risetextversion.Text = "5.94"
    risetextversion.Position = UDim2.new(0, 66, 0, 6)
    risetextversion.Parent = risetext
    risetextversion.TextLabel.TextSize = 26
    risetextversion.TextLabel.Text = risetextversion.Text
    risetextcustom.TextSize = 26
    risetextcustom.Text = riseoptions.CustomText or ""
    risetextcustom.Position = UDim2.new(0, 66, 0, 22)
    risetextcustom.Parent = risetext
    risetextcustom.TextLabel.TextSize = 26
    risetextcustom.TextLabel.Text = risetextcustom.Text
    
    pcall(function()
        for i,v in pairs(getconnections(game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.OnNewMessage.OnClientEvent)) do
            if v.Function and #debug.getupvalues(v.Function) > 0 and type(debug.getupvalues(v.Function)[1]) == "table" and getmetatable(debug.getupvalues(v.Function)[1]) and getmetatable(debug.getupvalues(v.Function)[1]).GetChannel then
                oldfunc = getmetatable(debug.getupvalues(v.Function)[1].ChatBar.CommandProcessor).ProcessCompletedChatMessage
                oldtab = getmetatable(debug.getupvalues(v.Function)[1].ChatBar.CommandProcessor)
                getmetatable(debug.getupvalues(v.Function)[1].ChatBar.CommandProcessor).ProcessCompletedChatMessage = function(self, message, chatwindow)
                    local res = oldfunc(self, message, chatwindow)
                    if message:sub(1, 5) == ".bind" then
                        local args = message:split(" ")
                        table.remove(args, 1)
                        if #args >= 2 then
                            local module = VapeGui["ObjectsThatCanBeSaved"][args[1].."OptionsButton"]
                            print(module)
                            if module then 
                                local suc, res = pcall(function() return Enum.KeyCode[args[2]] end)
                                print(suc, res)
                                if suc or args[2] == "None" then
                                    local oldiden = getthreadidentityfunc()
                                    setthreadidentityfunc(8)
                                    module["Api"]["SetKeybind"](suc and res.Name or "")
                                    VapeGui["CreateNotification"]("", "Set "..args[1].."'s bind to "..args[2]:upper()..".", 5)
                                    setthreadidentityfunc(oldiden)
                                end
                            end
                        end
                        return true
                    elseif message:sub(1, 11) == ".clientname" then
                        local args = message:split(" ")
                        table.remove(args, 1)
                        if #args >= 1 then
                            local oldiden = getthreadidentityfunc()
                            setthreadidentityfunc(8)
                            local clientname = ""
                            for i,v in pairs(args) do clientname = clientname..v.." " end
                            risetextcustom.Text = clientname
                            risetextcustom.TextLabel.Text = clientname
                            riseoptions.CustomText = clientname
                            setthreadidentityfunc(oldiden)
                        end
                        return true
                    end
                    return res
                end
            end
        end
    end)
    
    spawn(function()
        local val = 0
        repeat
            task.wait(0.01)
            local tab = {}
            val = val + 0.001
            if val > 1 then 
                
                val = val - 1
            end
            for i = 1, 10 do 
                table.insert(tab, ColorSequenceKeypoint.new(((i / 10) + val) % 1, i % 2 == 0 and risethemes[riseoptions.Theme].TextGUIColor2 or risethemes[riseoptions.Theme].TextGUIColor1))
            end
            table.sort(tab, function(a, b)
                return a.Time < b.Time
            end)
            local tab2 = {}
            for i2,v2 in pairs(tab) do 
                if i2 == 1 and v2.Time ~= 0 then 
                    local lastcolor = tab[1].Value:lerp(tab[#tab].Value, math.clamp((tab[#tab].Time - 0.9) * 10, 0, 1))
                    table.insert(tab2, ColorSequenceKeypoint.new(0, lastcolor:lerp(v2.Value, (v2.Time * 10) - 1)))
                elseif i2 == #tab and v2.Time ~= 1 then 
                    table.insert(tab2, ColorSequenceKeypoint.new(1, tab[1].Value:lerp(v2.Value, math.clamp((v2.Time - 0.9) * 10, 0, 1))))
                end
                table.insert(tab2, v2)
            end
            table.sort(tab2, function(a, b)
                return a.Time < b.Time
            end)
            pcall(function()
                risegradient.Color = ColorSequence.new(tab2)
                risetextversion.UIGradient.Color = ColorSequence.new(tab2)
                risetextcustom.UIGradient.Color = ColorSequence.new(tab2)
            end)
        until guilib.ScreenGui == nil or guilib.ScreenGui.Parent == nil
    end)
    
    local risearraylist = Instance.new("Frame")
    risearraylist.Size = UDim2.new(1, 0, 1, 0)
    risearraylist.Position = UDim2.new(0, -10, 0, 10)
    risearraylist.BackgroundTransparency = 1
    risearraylist.Parent = guilib.ScreenGui
    local risearraylistlayout = Instance.new("UIListLayout")
    risearraylistlayout.VerticalAlignment = Enum.VerticalAlignment.Top
    risearraylistlayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    risearraylistlayout.SortOrder = Enum.SortOrder.LayoutOrder
    risearraylistlayout.Parent = risearraylist
    local newnum = 0
    
    local function refreshbars(textlists)
        local size = 0
        for i3,v3 in pairs(textlists) do 
            size = size + 22
        end
        risearraylistlayout.Parent = nil
        risearraylist:ClearAllChildren()
        risearraylistlayout.Parent = risearraylist
        for i2,v2 in pairs(textlists) do
            local newstr = v2.Text:gsub(":", " ")
            local textsize = v2.Size or Vector2.new(0, 0)
            local calcnum = (newnum + (i2 / 10)) % 2
            local frame = Instance.new("TextLabel")
            frame.BorderSizePixel = 0
            frame.BackgroundTransparency = 0.62
            frame.Text = newstr
            frame.TextSize = 30
            frame.TextColor3 = Color3.new(1, 0, 0)
            if calcnum < 1 then 
                frame.TextColor3 = risethemes[riseoptions.Theme].TextGUIColor1:lerp(risethemes[riseoptions.Theme].TextGUIColor2, calcnum)
            elseif calcnum < 2 then 
                frame.TextColor3 = risethemes[riseoptions.Theme].TextGUIColor2:lerp(risethemes[riseoptions.Theme].TextGUIColor1, calcnum - 1)
            else
                frame.TextColor3 = risethemes[riseoptions.Theme].TextGUIColor1
            end
            frame.Font = Enum.Font.TitilliumWeb
            frame.BackgroundColor3 = Color3.new(0,0,0)
            frame.Visible = true
            frame.ZIndex = (#textlists - i2) + 1
            frame.LayoutOrder = i2
            frame.Size = UDim2.new(0, textsize.X + 10, 0, 22)
            frame.Parent = risearraylist
            if i2 == 1 then 
                local image = Instance.new("ImageLabel")
                image.Size = UDim2.new(1, 0, 0, 6)
                image.ImageTransparency = 0
                image.Position = UDim2.new(0, 0, 0, -6)
                image.Rotation = 180
                image.BackgroundTransparency = 1
                image.ImageColor3 = Color3.new(0, 0, 0)
                image.ZIndex = 0
                image.Image = getcustomassetfunc("rise/assets/WindowBlurLine.png")
                image.BorderSizePixel = 0
                image.Parent = frame
                local imagecorner1 = Instance.new("ImageLabel")
                imagecorner1.Size = UDim2.new(0, 6, 0, 6)
                imagecorner1.ImageTransparency = 0
                imagecorner1.Position = UDim2.new(0, -6, 0, -6)
                imagecorner1.BackgroundTransparency = 1
                imagecorner1.ImageColor3 = Color3.new(0, 0, 0)
                imagecorner1.ZIndex = 0
                imagecorner1.Image = getcustomassetfunc("rise/assets/WindowBlurCorner.png")
                imagecorner1.BorderSizePixel = 0
                imagecorner1.Parent = frame
                local imagecorner2 = Instance.new("ImageLabel")
                imagecorner2.Size = UDim2.new(0, 6, 0, 6)
                imagecorner2.ImageTransparency = 0
                imagecorner2.Position = UDim2.new(1, 0, 0, -6)
                imagecorner2.Rotation = 90
                imagecorner2.BackgroundTransparency = 1
                imagecorner2.ImageColor3 = Color3.new(0, 0, 0)
                imagecorner2.ZIndex = 0
                imagecorner2.Image = getcustomassetfunc("rise/assets/WindowBlurCorner.png")
                imagecorner2.BorderSizePixel = 0
                imagecorner2.Parent = frame
                local imagerightline = Instance.new("ImageLabel")
                imagerightline.Size = UDim2.new(0, 6, 0, size)
                imagerightline.ImageTransparency = 0
                imagerightline.Position = UDim2.new(1, 0, 0, 0)
                imagerightline.Rotation = 180
                imagerightline.BackgroundTransparency = 1
                imagerightline.ImageColor3 = Color3.new(0, 0, 0)
                imagerightline.ZIndex = 0
                imagerightline.Image = getcustomassetfunc("rise/assets/WindowBlurLine2.png")
                imagerightline.BorderSizePixel = 0
                imagerightline.Parent = frame
            end
            if i2 == #textlists then 
                local imagecorner4 = Instance.new("ImageLabel")
                imagecorner4.Size = UDim2.new(0, 6, 0, 6)
                imagecorner4.ImageTransparency = 0
                imagecorner4.Position = UDim2.new(1, 0, 1, 0)
                imagecorner4.BackgroundTransparency = 1
                imagecorner4.Rotation = 180
                imagecorner4.ImageColor3 = Color3.new(0, 0, 0)
                imagecorner4.ZIndex = 0
                imagecorner4.Image = getcustomassetfunc("rise/assets/WindowBlurCorner.png")
                imagecorner4.BorderSizePixel = 0
                imagecorner4.Parent = frame
            end
            local imagecorner3 = Instance.new("ImageLabel")
            imagecorner3.Size = UDim2.new(0, 6, 0, 6)
            imagecorner3.ImageTransparency = 0
            imagecorner3.Position = UDim2.new(0, -6, 1, 0)
            imagecorner3.BackgroundTransparency = 1
            imagecorner3.Rotation = 270
            imagecorner3.ImageColor3 = Color3.new(0, 0, 0)
            imagecorner3.ZIndex = 0
            imagecorner3.Image = getcustomassetfunc("rise/assets/WindowBlurCorner.png")
            imagecorner3.BorderSizePixel = 0
            imagecorner3.Parent = frame
            local imagebottom = Instance.new("ImageLabel")
            if i2 ~= #textlists then
                local nextone = textlists[i2 + 1]
                local textsize = nextone.Size + Vector2.new(10, 0)
                imagebottom.Size = UDim2.new(0, math.clamp((frame.Size.X.Offset - textsize.X) - 1, 0, 1000), 0, 6)
            else
                imagebottom.Size = UDim2.new(1, 0, 0, 6)
            end
            imagebottom.ImageTransparency = 0
            imagebottom.Position = UDim2.new(0, 0, 1, 0)
            imagebottom.Rotation = 0
            imagebottom.BackgroundTransparency = 1
            imagebottom.ImageColor3 = Color3.new(0, 0, 0)
            imagebottom.ZIndex = 0
            imagebottom.Image = getcustomassetfunc("rise/assets/WindowBlurLine.png")
            imagebottom.BorderSizePixel = 0
            imagebottom.Parent = frame
            local imageleftline = Instance.new("ImageLabel")
            imageleftline.Size = UDim2.new(0, 6, 1, 0)
            imageleftline.ImageTransparency = 0
            imageleftline.Position = UDim2.new(0, -6, 0, 0)
            imageleftline.Rotation = 0
            imageleftline.BackgroundTransparency = 1
            imageleftline.ImageColor3 = Color3.new(0, 0, 0)
            imageleftline.ZIndex = 0
            imageleftline.Image = getcustomassetfunc("rise/assets/WindowBlurLine2.png")
            imageleftline.BorderSizePixel = 0
            imageleftline.Parent = frame
        end
    end
    
    VapeGui.CreateNotification = function(top, bottom, duration, customicon)
        local offset = #notificationwindow:GetChildren()
        local togglecheck = (bottom:find("Enabled") or bottom:find("Disabled"))
        if (togglecheck and (not riseoptions.RenderToggle)) then return end
        local togglecheck2 = bottom:find("Enabled") and true or false
        local newtext = removeTags(togglecheck and (togglecheck2 and "Enabled " or "Disabled ")..bottom:split(" ")[1] or bottom)
        local calculatedsize = game:GetService("TextService"):GetTextSize(newtext, 13, Enum.Font.Gotham, Vector2.new(100000, 13))
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, calculatedsize.X + 20, 0, 60)
        frame.Position = UDim2.new(1, 0, 1, -(150 + 80 * offset))
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0,0)
        frame.BorderSizePixel = 0
        frame.Parent = notificationwindow
        frame.Visible = true
        frame.ClipsDescendants = false
        local uicorner = Instance.new("UICorner")
        uicorner.CornerRadius = UDim.new(0, 4)
        uicorner.Parent = frame
        local textlabel1 = Instance.new("TextLabel")
        textlabel1.Font = Enum.Font.Gotham
        textlabel1.TextSize = 13
        textlabel1.RichText = true
        textlabel1.TextTransparency = 0.1
        textlabel1.TextColor3 = risethemes[riseoptions.Theme].TextGUIColor1
        textlabel1.BackgroundTransparency = 1
        textlabel1.Position = UDim2.new(0, 10, 0, 10)
        textlabel1.TextXAlignment = Enum.TextXAlignment.Left
        textlabel1.TextYAlignment = Enum.TextYAlignment.Top
        textlabel1.Text = "Notification"
        textlabel1.Parent = frame
        local textlabel2 = textlabel1:Clone()
        textlabel2.Position = UDim2.new(0, 10, 0, 30)
        textlabel2.Font = Enum.Font.Gotham
        textlabel2.Name = "TextLabel2"
        textlabel2.TextTransparency = 0
        textlabel2.RichText = true
        local frame2 = Instance.new("Frame")
        frame2.AnchorPoint = Vector2.new(1, 0)
        frame2.Size = UDim2.new(1, 0, 0, 4)
        frame2.Position = UDim2.new(1, 0, 1, -4)
        frame2.BackgroundColor3 = Color3.fromRGB(71, 233, 175)
        frame2.BorderSizePixel = 0
        frame2.Parent = frame
        textlabel2.Text = newtext
        textlabel2.Parent = frame
        spawn(function()
            pcall(function()
                bettertween2(frame, UDim2.new(1, -(calculatedsize.X + 20), 1, -(120 + 80 * offset)), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.2, true)
                wait(0.2)
                frame2:TweenSize(UDim2.new(0, 0, 0, 4), Enum.EasingDirection.In, Enum.EasingStyle.Linear, duration, true)
                wait(duration)
                bettertween2(frame, UDim2.new(1, 0, 1, frame.Position.Y.Offset), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.2, true)
                wait(0.2)
                frame:Remove()
            end)
        end)
        return frame
    end
    
    local function UpdateHud()
        local text = ""
        local text2 = ""
        local tableofmodules = {}
        local sizes = {}
        local first = true
        
        for i,v in pairs(VapeGui["ObjectsThatCanBeSaved"]) do
            if v["Type"] == "OptionsButton" and v["Api"]["Name"] ~= "Text GUI" then
                if v["Api"]["Enabled"] then
                    if not riseoptions.ShowRenderModules then
                        if v["Object"].Parent.Parent.Name == "Render" then continue end
                    end
                    table.insert(tableofmodules, {["Text"] = v["Api"]["Name"], ["ExtraText"] = v["Api"]["GetExtraText"]})
                    sizes[v["Api"]["Name"]] = game:GetService("TextService"):GetTextSize(v["Api"]["Name"], 30, Enum.Font.TitilliumWeb, Vector2.new(1000000, 1000000))
                end
            end
        end
        table.sort(tableofmodules, function(a, b) 
            textsize1 = sizes[a["Text"]]
            textsize2 = sizes[b["Text"]]
            return textsize1.X > textsize2.X 
        end)
        local textlists = {}
        for i2,v2 in pairs(tableofmodules) do
            table.insert(textlists, {Text = v2["Text"], Size = sizes[v2["Text"]] or Vector2.new(0, 0)})
        end
        refreshbars(textlists)
    end
    
    UpdateHud()
    VapeGui["UpdateHudEvent"].Event:connect(UpdateHud)
    spawn(function()
        repeat 
            task.wait(0.01)
            newnum = (newnum + 0.01) % 2
        until guilib.ScreenGui == nil or guilib.ScreenGui.Parent == nil
    end)
    
    spawn(function()
        repeat 
            task.wait(0.01)
            local num = newnum
            local list = risearraylist:GetChildren()
            table.remove(list, table.find(list, risearraylistlayout))
            for i,v in pairs(list) do
                local calcnum = (newnum + (i / 10)) % 2
                if calcnum < 1 then 
                    v.TextColor3 = risethemes[riseoptions.Theme].TextGUIColor1:lerp(risethemes[riseoptions.Theme].TextGUIColor2, calcnum)
                elseif calcnum < 2 then 
                    v.TextColor3 = risethemes[riseoptions.Theme].TextGUIColor2:lerp(risethemes[riseoptions.Theme].TextGUIColor1, calcnum - 1)
                else
                    v.TextColor3 = risethemes[riseoptions.Theme].TextGUIColor1
                end
            end
        until guilib.ScreenGui == nil or guilib.ScreenGui.Parent == nil
    end)
    
    local Interface = windowtabs.Render:CreateButton({
        Name = "Interface",
        Function = function() end
    })
    local risethemelist = {}
    for i,v in pairs(risethemes) do table.insert(risethemelist, i) end
    local InterfaceTheme = Interface:CreateDropdown({
        Name = "Theme",
        List = risethemelist,
        Function = function(val)
            riseoptions.Theme = val
        end
    })
    local InterfaceRenderR = Interface:CreateSlider({
        Name = "Red",
        Min = 0,
        Max = 255,
        Function = function(val)
            riseoptions.R = val / 255
            risethemes.Rise.TextGUIColor1 = Color3.new(riseoptions.R, riseoptions.G, riseoptions.B)
            local h, s, v = Color3.toHSV(risethemes.Rise.TextGUIColor1)
            risethemes.Rise.TextGUIColor2 = Color3.fromHSV(h, s, math.clamp(v - 0.3, 0, 1))
        end
    })
    local InterfaceRenderG = Interface:CreateSlider({
        Name = "Green",
        Min = 0,
        Max = 255,
        Function = function(val)
            riseoptions.G = val / 255
            risethemes.Rise.TextGUIColor1 = Color3.new(riseoptions.R, riseoptions.G, riseoptions.B)
            local h, s, v = Color3.toHSV(risethemes.Rise.TextGUIColor1)
            risethemes.Rise.TextGUIColor2 = Color3.fromHSV(h, s, math.clamp(v - 0.3, 0, 1))
        end
    })
    local InterfaceRenderB = Interface:CreateSlider({
        Name = "Blue",
        Min = 0,
        Max = 255,
        Function = function(val)
            riseoptions.B = val / 255
            risethemes.Rise.TextGUIColor1 = Color3.new(riseoptions.R, riseoptions.G, riseoptions.B)
            local h, s, v = Color3.toHSV(risethemes.Rise.TextGUIColor1)
            risethemes.Rise.TextGUIColor2 = Color3.fromHSV(h, s, math.clamp(v - 0.3, 0, 1))
        end
    })
    local InterfaceRenderNotifications = Interface:CreateToggle({
        Name = "Show Notifications on Toggle",
        Function = function(callback)
            riseoptions.RenderToggle = callback
        end
    })
    local InterfaceRenderList = Interface:CreateToggle({
        Name = "Show Render Modules on List",
        Function = function(callback)
            riseoptions.ShowRenderModules = callback
            VapeGui["UpdateHudEvent"]:Fire()
        end
    })
    
    local function LoadSettings()
        local suc, res = pcall(function() return game:GetService("HttpService"):JSONDecode(readfile("rise/settings.json")) end)
        if suc and type(res) == "table" then 
            if risethemes[res.Theme] == nil then
                res.Theme = "Rise Blend"
            end
            riseoptions = res
            if InterfaceTheme then 
                InterfaceTheme:SetValue(riseoptions.Theme)
            end
            if InterfaceRenderList then 
                InterfaceRenderList:ToggleButton(false, riseoptions.ShowRenderModules)
            end
            if InterfaceRenderNotifications then 
                InterfaceRenderNotifications:ToggleButton(false, riseoptions.RenderToggle)
            end
            if InterfaceRenderR then 
                InterfaceRenderR:SetValue(math.floor(riseoptions.R * 255))
            end
            if InterfaceRenderG then 
                InterfaceRenderG:SetValue(math.floor(riseoptions.G * 255))
            end
            if InterfaceRenderB then 
                InterfaceRenderB:SetValue(math.floor(riseoptions.B * 255))
            end
            if risetextcustom then
                risetextcustom.Text = riseoptions.CustomText
                risetextcustom.TextLabel.Text = riseoptions.CustomText
            end
        end
    end
    
    
    LoadSettings()
    spawn(function()
        repeat
            task.wait(10)
            if (guilib.ScreenGui == nil or guilib.ScreenGui.Parent == nil) then break end
            SaveSettings()
        until (guilib.ScreenGui == nil or guilib.ScreenGui.Parent == nil)
    end)
end)



OtherScriptsSection:NewButton("engoware", "Executes engoware (Made by engo)", function()
    --[[
    Main.lua - Main file for engoware.
    
    written by: @engo#0320
]]

if not game:IsLoaded() then 
    game.Loaded:Wait()
end

local startTick = tick()

local request = (syn and syn.request) or request or http_request or (http and http.request)
local queueteleport = syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport
local setthreadidentityfunc = syn and syn.set_thread_identity or set_thread_identity or setidentity or setthreadidentity
local getthreadidentityfunc = syn and syn.get_thread_identity or get_thread_identity or getidentity or getthreadidentity
local UIS = game:GetService("UserInputService")
local ts = game:GetService("TweenService")
local Players = game:GetService("Players")
local lplr = Players.LocalPlayer
local entity, GuiLibrary
local override = {
    [6872265039] = "bedwars_lobby",
    [8444591321] = "bedwars",
    [6872274481] = "bedwars",
    [8560631822] = "bedwars",
    [863266079] = "ar2"
}
local funcs = {}; do
    function funcs:require(url, bypass, bypass2)
        if (not url:match("http")) and isfile(url) then
            return readfile(url)
        end

        local newUrl = (bypass and "https://raw.githubusercontent.com/joeengo/" or "https://raw.githubusercontent.com/joeengo/engoware/main/") .. url:gsub("engoware/", ""):gsub("engoware\\", "")
        local response = request({
            Url = bypass2 and url or newUrl,
            Method = "GET",
        })
        if response.StatusCode == 200 then
            return response.Body
        end
    end

    function funcs:getPlaceIdentifier() 
        return tostring(override[game.PlaceId] or game.PlaceId)
    end

    function funcs:getPlaceScript() 
        local placeId = funcs:getPlaceIdentifier()
        local scriptName = (placeId .. ".lua")
        if scriptName then
            local path = "engoware/games/" .. scriptName
            return funcs:require(path) or ""
        end
    end

    function funcs:getUniversalScript()
        return funcs:require("engoware/games/universal.lua")
    end

    function funcs:getPrivateScript() 
        local placeId = funcs:getPlaceIdentifier()
        local scriptName = (placeId .. ".lua")
        if scriptName then
            local path = "engoware/private/" .. scriptName
            return funcs:require(path) or ""
        end
    end

    function funcs:run(code) 
        local func, err = loadstring(code)
        if not typeof(func) == 'function' then
            return warn("Failed to run code, error: " .. tostring(err))
        end
        return func()
    end

    function funcs:wlfind(tab, obj) 
        for i,v in next, tab do
            if v == obj or type(v) == "table" and v.hash == obj then
                return v
            end
        end
    end

    function funcs:connection(...) 
        return GuiLibrary.utils:connection(...)
    end

    function funcs:getObject(objectName, prop, val) 
        for i,v in next, GuiLibrary.Objects do 
            if i == objectName and v[prop] == val then 
                return v
            end
        end
    end

    local loops = {RenderStepped = {}, Heartbeat = {}, Stepped = {}}
    function funcs:bindToStepped(id, callback)
        if not loops.Stepped[id] then 
            loops.Stepped[id] = game:GetService("RunService").Stepped:Connect(callback)
        else
            warn("[engoware] attempt to bindToStepped to an already bound id: " .. tostring(id))
        end
    end

    function funcs:unbindFromStepped(id)
        if loops.Stepped[id] then
            loops.Stepped[id]:Disconnect()
            loops.Stepped[id] = nil
        end
    end

    function funcs:bindToRenderStepped(id, callback)
        if not loops.RenderStepped[id] then 
            loops.RenderStepped[id] = game:GetService("RunService").RenderStepped:Connect(callback)
        else
            warn("[engoware] attempt to bindToRenderStepped to an already bound id: " .. tostring(id))
        end
    end

    function funcs:unbindFromRenderStepped(id)
        if loops.RenderStepped[id] then
            loops.RenderStepped[id]:Disconnect()
            loops.RenderStepped[id] = nil
        end
    end

    function funcs:bindToHeartbeat(id, callback)
        if not loops.Heartbeat[id] then 
            loops.Heartbeat[id] = game:GetService("RunService").Heartbeat:Connect(callback)
        else
            warn("[engoware] attempt to bindToHeartbeat to an already bound id: " .. tostring(id))
        end
    end

    function funcs:unbindFromHeartbeat(id)
        if loops.Heartbeat[id] then
            loops.Heartbeat[id]:Disconnect()
            loops.Heartbeat[id] = nil
        end
    end

    function funcs:isAlive(plr: Player, stateCheck: boolean) 
        if not plr then 
            return entity.isAlive
        end

        local _, ent = entity.getEntityFromPlayer(plr)
        return ((not stateCheck) or ent and ent.Humanoid:GetState() ~= Enum.HumanoidStateType.Dead) and ent
    end 

    function funcs:isTargetable(plr: Player) 
        return funcs:isAlive(plr, true) and (plr.Character) and (not plr.Character:FindFirstChildOfClass("ForceField"))
    end

    function funcs:getClosestEntity(maxDist: number, teamCheck: boolean)
        local maxDist, val = maxDist or 9e9, nil
        if funcs:isAlive() then
            for i,v in next, entity.entityList do 
                if (v.Targetable or not teamCheck) and funcs:isTargetable(v.Player) then 
                    local dist = (lplr.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
                    if dist < maxDist then
                        maxDist, val = dist, v
                    end
                end
            end
        end
        return val
    end

    function funcs:getClosestEntityToMouse(maxDist: number, teamCheck: boolean, visCheck: boolean, visTable: table)
        local maxDist, val = maxDist or 9e9, nil
        if funcs:isAlive() then
            for i,v in next, entity.entityList do 
                if (v.Targetable or not teamCheck) and funcs:isTargetable(v.Player) then 
                    local Position, Visible = workspace.CurrentCamera:WorldToViewportPoint(v[visTable.TargetPart].Position)
                    if (not visTable.SkipVisible) and (not Visible) then 
                        continue
                    end

                    local Params = RaycastParams.new()
                    Params.FilterDescendantsInstances = {v.Character, workspace.CurrentCamera, lplr.Character, unpack(visTable.Ignore)}
                    Params.FilterType = Enum.RaycastFilterType.Blacklist
                    local Ray = workspace:Raycast(visTable.Origin, v[visTable.TargetPart].Position - visTable.Origin, Params)
                    local AreVisible = Ray and Ray.Instance == nil or not Ray
                    if visCheck and (not AreVisible) then
                        continue
                    end

                    local dist2 = (entity.character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
                    if visTable.MaxDist and dist2 > (visTable.MaxDist) then
                        continue
                    end

                    if visTable.Checks then
                        for i,check in next, visTable.Checks do 
                            if not check(visTable.Origin, v[visTable.TargetPart].Position - visTable.Origin) then
                                continue
                            end
                        end
                    end

                    local dist = (UIS:GetMouseLocation() - Vector2.new(Position.X, Position.Y)).Magnitude
                    if dist < maxDist then
                        maxDist, val = dist, v
                    end
                end
            end
        end
        return val
    end

    function funcs:getSortedEntities(maxDist: number, maxEntities: number, teamCheck: boolean, sortFunction)
        local maxDist, maxEntities, val = maxDist or 9e9, maxEntities or 9e9, {}
        if not funcs:isAlive() then
            maxDist = 99e99
        end
        
        local selfPos = funcs:isAlive() and entity.character.HumanoidRootPart.Position or Vector3.zero
        for i,v in next, entity.entityList do 
            if (v.Targetable or not teamCheck) and funcs:isTargetable(v.Player) then 
                local dist = (selfPos - v.HumanoidRootPart.Position).Magnitude
                if dist < maxDist then
                    table.insert(val, v)
                end
            end
        end

        local sortFunction = sortFunction or function(ent1, ent2)
            return (selfPos - ent1.HumanoidRootPart.Position).Magnitude < (selfPos - ent2.HumanoidRootPart.Position).Magnitude
        end
        table.sort(val, sortFunction)

        if #val > maxEntities then
            return table.move(val, 1, maxEntities, 1, {})
        end

        return val
    end

    function funcs:getEnemyColor(isEnemy) 
        if isEnemy then
            return Color3.new(1, 0.427450, 0.427450)
        end
        return Color3.new(0.470588, 1, 0.470588)
    end

    function funcs:getColorFromEntity(ent, useTeamColor, useColorTheme) 
        if ent.Team and ent.Team.TeamColor.Color and useTeamColor then
            return ent.Team.TeamColor.Color
        end

        if useColorTheme then 
            return GuiLibrary.utils:getColor()
        end

        return funcs:getEnemyColor(ent.Targetable)
    end

    function funcs:newWorker() 
        local worker = {}
        local tasks = {}
        worker.tasks = tasks
        function worker:add(x) 
            table.insert(tasks, x)
        end
        function worker:clean() 
            for i,v in next, tasks do 
                local typeOf = typeof(v)
                if typeOf == 'Instance' then 
                    v:Destroy()
                elseif typeOf == 'table' then
                    if v.__OBJECT and v.__OBJECT_EXISTS then 
                        v:Remove()
                    end
                elseif typeOf == 'RBXScriptConnection' then
                    if v.Connected then
                        v:Disconnect()
                    end
                elseif typeOf == 'function' then
                    v()
                end
                tasks[i] = nil
            end
        end
        return worker
    end

    function funcs:curve(p0, p1, p2, p3, t)
        local t2 = t * t
        local t3 = t2 * t
        return p0 * (1 - 3 * t + 3 * t2 - t3) + p1 * (3 * t - 6 * t2 + 3 * t3) + p2 * (3 * t2 - 3 * t3) + p3 * t3
    end

    function funcs:lookat(p, smooth) 
        local smooth = smooth + 1
        local targetPos = workspace.CurrentCamera:WorldToScreenPoint(p)
        local mousePos = workspace.CurrentCamera:WorldToScreenPoint(lplr:GetMouse().Hit.p)
        mousemoverel((targetPos.X-mousePos.X) / smooth,( targetPos.Y - mousePos.Y) / smooth)
    end

    local function createAngleInc(Start, DefaultInc, Goal) 
        local i = Start or 0
        return function(Inc) 
            local Inc = Inc or DefaultInc or 1
            i = math.clamp(i + Inc, Start, Goal)
            return i
        end
    end
    
    function funcs:orbit(Self, Target, Radius, Delay, Speed, StopIf)
        local AngleInc = createAngleInc(0, Speed, 360)
        for i = 1, 360 / Speed do
            local Angle = AngleInc(Speed)
            Self.CFrame = CFrame.new(Target.CFrame.p) * CFrame.Angles(0, math.rad(Angle), 0) * CFrame.new(0, 0.1, Radius)
            task.wait(Delay)
            if StopIf and StopIf() then
                return
            end
        end
    end

    function funcs:tweenNumber(start, goal, time, func, _end) 
        local start, goal, time = start or 0, goal or 1, time or 1
        local worker = funcs:newWorker()
        local N = Instance.new("NumberValue")
        N.Parent = engoware.GuiLibrary.ScreenGui
        N.Value = start
        N.Name = "TweeningNumber"
        worker:add(N.Changed:Connect(function(value)
            func(value)
        end))
        local t = ts:Create(N, TweenInfo.new(), {Value = goal})
        t:Play()
        worker:add(t.Completed:Connect(function()
            worker:clean()
            N:Destroy()
            _end()
        end))
    end
end

if not getgenv or (identifyexecutor and identifyexecutor():find("Arceus")) then
    return warn("[engoware] unsupported executor.")
end

if engoware then 
    return warn("[engoware] already loaded.")
end

entity = funcs:run(funcs:require("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/Libraries/entityHandler.lua", true, true))
entity.fullEntityRefresh()
GuiLibrary = funcs:run(funcs:require("engoware/GuiLibrary.lua"))

getgenv().engoware = {}
engoware.UninjectEvent = Instance.new("BindableEvent")
engoware.entity = entity
engoware.GuiLibrary = GuiLibrary
engoware.funcs = funcs
makefolder("engoware")
makefolder("engoware/configs")

local windows = {
    combat = GuiLibrary.CreateWindow({Name = "combat"}),
    exploit = GuiLibrary.CreateWindow({Name = "exploits"}),
    movement = GuiLibrary.CreateWindow({Name = "movement"}),
    utilities = GuiLibrary.CreateWindow({Name = "utilities"}),
    render = GuiLibrary.CreateWindow({Name = "render"}),
    misc = GuiLibrary.CreateWindow({Name = "misc"}),
    other = GuiLibrary.CreateWindow({Name = "other"}),
}

local UninjectButton; UninjectButton = windows.other.CreateOptionsButton({
    Name = "uninject",
    Function = function(callback)
        if callback then
            UninjectButton.Toggle()
            engoware.UninjectEvent:Fire()
        end
    end
})

local guiButton = windows.other.CreateOptionsButton({
    Name = "gui",
    Function = function(callback) 
        GuiLibrary.ClickGUI.Visible = callback
    end,
    Bind = "RightShift",
})
GuiLibrary.ClickGUI.Visible = false

local canScale = guiButton.CreateToggle({
    Name = "canScale",
    Function = function(callback)
        GuiLibrary.canScale = callback
    end,
    Default = true
})

local colorButton; colorButton = windows.other.CreateOptionsButton({
    Name = "colors",
    Function = function(callback)
        if not callback then
            colorButton.Toggle()
        end
    end,
})
if not colorButton.Enabled then
    colorButton.Toggle()
end

local hueSlider
local satSlider
local valSlider
local rainbowSmoothSlider
local rainbowToggle = colorButton.CreateToggle({
    Name = "rainbow",
    Function = function(callback)
        GuiLibrary.Rainbow = callback
        if not callback then
            GuiLibrary.utils:setColorTheme({H = hueSlider.Value / 360, S = satSlider.Value / 100, V = valSlider.Value / 100})
        end
    end,
})

rainbowSmoothSlider = colorButton.CreateSlider({
    Name = "rainbow smoothness",
    Function = function(value)
        GuiLibrary.RainbowSmoothness = value * 75
    end,
    Min = 10,
    Max = 100,
    Default = 23,
})

hueSlider = colorButton.CreateSlider({
    Name = "hue",
    Function = function(value)
        if GuiLibrary.Rainbow then 
            return
        end
        local old = GuiLibrary.utils:getColorTheme(true)
        GuiLibrary.utils:setColorTheme({
            H = value / 360,
            S = old.S,
            V = old.V,
        })
    end,
    Min = 0,
    Max = 360,
    Round = 0,
    Default = 150,
})

satSlider = colorButton.CreateSlider({
    Name = "sat",
    Function = function(value)
        local old = GuiLibrary.utils:getColorTheme(true)
        GuiLibrary.utils:setColorTheme({
            H = old.H,
            S = value / 100,
            V = old.V,
        })
    end,
    Min = 0,
    Max = 100,
    Round = 0,
    Default = 100,
})

valSlider = colorButton.CreateSlider({
    Name = "val",
    Function = function(value)
        local old = GuiLibrary.utils:getColorTheme(true)
        GuiLibrary.utils:setColorTheme({
            H = old.H,
            S = old.S,
            V = value / 100,
        })
    end,
    Min = 0,
    Max = 100,
    Round = 0,
    Default = 100,
})

local arrayListApi = {}
local arrayListWindow = GuiLibrary.CreateCustomWindow({
    Name = "array list",
})
local arrayListToggle = {}

local keyStrokesToggle = {}
local keystrokesAPI = {}
local keyStrokesWindow = GuiLibrary.CreateCustomWindow({Name = "keystrokes"})

local HUDButton = windows.other.CreateOptionsButton({
    Name = "hud",
    Function = function(callback)
        if arrayListToggle.Enabled then
            arrayListWindow.Instance.Visible = callback
        end
        if keyStrokesToggle.Enabled then
            keyStrokesWindow.Instance.Visible = callback
        else
            keyStrokesWindow.Instance.Visible = false
            if keystrokesAPI.Connection then 
                keystrokesAPI.Connection:Disconnect()  
                keystrokesAPI.Connection = nil
            end
            if keystrokesAPI.Connection2 then 
                keystrokesAPI.Connection2:Disconnect()  
                keystrokesAPI.Connection2 = nil
            end
        end
    end,
})
arrayListToggle = HUDButton.CreateToggle({
    Name = "array list",
    Function = function(callback)
        if HUDButton.Enabled then
            arrayListWindow.Instance.Visible = callback
        end
    end,
})

do 
    local ArrayList = arrayListWindow.new("Frame")
    ArrayList.Name = "ArrayList"
    ArrayList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ArrayList.BackgroundTransparency = 1.000
    ArrayList.Position = UDim2.new(-0.551886797, 0, 0, 0)
    ArrayList.Size = UDim2.new(0, 329, 0, 372)
    arrayListApi.ArrayListInstance = ArrayList
    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.Parent = ArrayList
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    local Watermark = Instance.new("TextLabel")
    Watermark.Name = "Watermark"
    Watermark.Parent = ArrayList
    Watermark.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Watermark.BackgroundTransparency = 1.000
    Watermark.Position = UDim2.new(-0.887538016, 0, 0.161490679, 0)
    Watermark.Size = UDim2.new(0, 621, 0.1556832382, 0)
    Watermark.Font = Enum.Font.Code
    Watermark.Text = "engoware"
    Watermark.TextColor3 = GuiLibrary.utils:getColorOfObject(Watermark)
    GuiLibrary.utils:connection(GuiLibrary.ColorUpdate:Connect(function()
        Watermark.TextColor3 = GuiLibrary.utils:getColorOfObject(Watermark)
    end))
    Watermark.TextScaled = true
    Watermark.TextSize = 14.000
    Watermark.TextStrokeTransparency = 0
    Watermark.TextWrapped = true
    Watermark.TextXAlignment = Enum.TextXAlignment.Right
    arrayListApi.Watermark = Watermark
    local WatermarkText = Instance.new("TextLabel")
    WatermarkText.Name = "Watermark"
    WatermarkText.Parent = ArrayList
    WatermarkText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    WatermarkText.BackgroundTransparency = 1.000
    WatermarkText.Position = UDim2.new(-0.887538016, 0, 0.161490679, 0)
    WatermarkText.Size = UDim2.new(0, 621, 0.0856832382, 0)
    WatermarkText.Font = Enum.Font.Code
    WatermarkText.Text = "Custom Text!"
    WatermarkText.TextColor3 = GuiLibrary.utils:getColorOfObject(WatermarkText)
    GuiLibrary.utils:connection(GuiLibrary.ColorUpdate:Connect(function()
        WatermarkText.TextColor3 = GuiLibrary.utils:getColorOfObject(WatermarkText)
    end))
    WatermarkText.TextScaled = true
    WatermarkText.TextSize = 14.000
    WatermarkText.TextStrokeTransparency = 0
    WatermarkText.TextWrapped = true
    WatermarkText.TextXAlignment = Enum.TextXAlignment.Right
    arrayListApi.WatermarkText = WatermarkText

    function arrayListApi.handleEntry(name, enabled, wasKeyDown) 
        arrayListApi.Objects = arrayListApi.Objects or {}
        local ArrayListModule = arrayListApi.Objects[name] or Instance.new("TextLabel")
        ArrayListModule.Name = "ArrayListModule"
        ArrayListModule.Parent = ArrayList
        ArrayListModule.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ArrayListModule.BackgroundTransparency = 1.000
        ArrayListModule.Position = UDim2.new(-0.887538016, 0, 0.161490679, 0)
        ArrayListModule.Size = UDim2.new(0, 621, 0.0656832382, 0)
        ArrayListModule.Font = Enum.Font.Code
        ArrayListModule.Text = name
        ArrayListModule.TextColor3 = GuiLibrary.utils:getColorOfObject(ArrayListModule)
        GuiLibrary.utils:connection(GuiLibrary.ColorUpdate:Connect(function()
            ArrayListModule.TextColor3 = GuiLibrary.utils:getColorOfObject(ArrayListModule)
        end))
        ArrayListModule.TextScaled = true
        ArrayListModule.TextSize = 14.000
        ArrayListModule.TextStrokeTransparency = 0.500
        ArrayListModule.TextWrapped = true
        ArrayListModule.TextXAlignment = Enum.TextXAlignment.Right
        arrayListApi.Objects[name] = ArrayListModule
        if not enabled then 
            ArrayListModule:Destroy()
            arrayListApi.Objects[name] = nil
        end

        local children = ArrayList:GetChildren()
        table.sort(children, function(a,b)
            if not a:IsA("TextLabel") then 
                return false
            end
            if not b:IsA("TextLabel") then 
                return true
            end
            return a.TextBounds.X > b.TextBounds.X
        end)

        for i,v in next, children do 
            if v.Name:find("Watermark") then
                v.LayoutOrder = (v.Name:find("Text") and 2) or 0
                continue
            end
            if v:IsA("TextLabel") then
                v.LayoutOrder = i+2
            end
        end
        
    end

    function arrayListApi.SetScale(scale) 
        ArrayList.Size = UDim2.new(0, 329, 0, 372 * scale)
    end
end

arrayListWindow.CreateSlider({
    Name = "scale",
    Min = 0.5,
    Max = 2,
    Default = 1,
    Round = 1,
    Function = function(value)
        arrayListApi.SetScale(value)
    end,
})
GuiLibrary.ButtonUpdate:Connect(function(name, enabled, wasKeyDown) 
    arrayListApi.handleEntry(name, enabled, wasKeyDown)
end)
arrayListWindow.CreateToggle({
    Name = "watermark", 
    Function = function(callback)
        arrayListApi.Watermark.Visible = callback
    end,
    Default = true
})
local CustomText = arrayListWindow.CreateToggle({
    Name = "custom text",
    Function = function(callback)
        if arrayListApi.WatermarkText.Text ~= "" then
            arrayListApi.WatermarkText.Visible = callback
        else
            arrayListApi.WatermarkText.Visible = false
        end
    end,
})
arrayListWindow.CreateTextbox({
    Name = "custom text",
    Function = function(value)
        arrayListApi.WatermarkText.Text = value
        if value == "" then
            arrayListApi.WatermarkText.Visible = false
        else
            if CustomText.Enabled then 
                arrayListApi.WatermarkText.Visible = true
            end
        end
    end,
})


do 
    local Keystrokes = keyStrokesWindow.new("Frame")
    Keystrokes.Name = "Keystrokes"
    Keystrokes.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Keystrokes.BackgroundTransparency = 1.000
    Keystrokes.Position = UDim2.new(0, 0, 0, 0)
    Keystrokes.Size = UDim2.new(0, 230, 0, 260)
    local KeyW = Instance.new("Frame")
    KeyW.Name = "KeyW"
    KeyW.Parent = Keystrokes
    KeyW.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
    KeyW.BorderSizePixel = 0
    KeyW.BorderColor3 = Color3.fromRGB(0,0,0)
    KeyW.Position = UDim2.new(0.344901353, 0, 0, -0.03)
    KeyW.Size = UDim2.new(0.301369876, 0, 0.26, 0)
    local Text = Instance.new("TextLabel")
    Text.Name = "Text"
    Text.Parent = KeyW
    Text.AnchorPoint = Vector2.new(0.5, 0.5)
    Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Text.BackgroundTransparency = 1.000
    Text.Position = UDim2.new(0.5, 0, 0.5, 0)
    Text.Size = UDim2.new(0.600000024, 0, 0.600000024, 0)
    Text.Font = Enum.Font.Code
    Text.Text = "w"
    Text.TextColor3 = Color3.fromRGB(255, 255, 255)
    Text.TextScaled = true
    Text.TextSize = 16.000
    Text.TextWrapped = true
    local KeyS = Instance.new("Frame")
    KeyS.Name = "KeyS"
    KeyS.Parent = Keystrokes
    KeyS.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
    KeyS.BorderSizePixel = 0
    KeyS.BorderColor3 = Color3.fromRGB(0,0,0)
    KeyS.Position = UDim2.new(0.344901383, 0, 0.26, 0)
    KeyS.Size = UDim2.new(0.301369876, 0, 0.266, 0)
    local Text_2 = Instance.new("TextLabel")
    Text_2.Name = "Text"
    Text_2.Parent = KeyS
    Text_2.AnchorPoint = Vector2.new(0.5, 0.5)
    Text_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Text_2.BackgroundTransparency = 1.000
    Text_2.Position = UDim2.new(0.5, 0, 0.5, 0)
    Text_2.Size = UDim2.new(0.600000024, 0, 0.600000024, 0)
    Text_2.Font = Enum.Font.Code
    Text_2.Text = "s"
    Text_2.TextColor3 = Color3.fromRGB(255, 255, 255)
    Text_2.TextScaled = true
    Text_2.TextSize = 16.000
    Text_2.TextWrapped = true
    local KeyD = Instance.new("Frame")
    KeyD.Name = "KeyD"
    KeyD.Parent = Keystrokes
    KeyD.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
    KeyD.BorderSizePixel = 0
    KeyD.BorderColor3 = Color3.fromRGB(0,0,0)
    KeyD.Position = UDim2.new(0.646271288, 0, 0.26, 0)
    KeyD.Size = UDim2.new(0.301369876, 0, 0.266, 0)
    local Text_3 = Instance.new("TextLabel")
    Text_3.Name = "Text"
    Text_3.Parent = KeyD
    Text_3.AnchorPoint = Vector2.new(0.5, 0.5)
    Text_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Text_3.BackgroundTransparency = 1.000
    Text_3.Position = UDim2.new(0.5, 0, 0.5, 0)
    Text_3.Size = UDim2.new(0.600000024, 0, 0.600000024, 0)
    Text_3.Font = Enum.Font.Code
    Text_3.Text = "d"
    Text_3.TextColor3 = Color3.fromRGB(255, 255, 255)
    Text_3.TextScaled = true
    Text_3.TextSize = 16.000
    Text_3.TextWrapped = true
    local KeyA = Instance.new("Frame")
    KeyA.Name = "KeyA"
    KeyA.Parent = Keystrokes
    KeyA.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
    KeyA.BorderSizePixel = 0
    KeyA.BorderColor3 = Color3.fromRGB(0,0,0)
    KeyA.Position = UDim2.new(0.0435315035, 0, 0.26, 0)
    KeyA.Size = UDim2.new(0.301369876, 0, 0.266, 0)
    local Text_4 = Instance.new("TextLabel")
    Text_4.Name = "Text"
    Text_4.Parent = KeyA
    Text_4.AnchorPoint = Vector2.new(0.5, 0.5)
    Text_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Text_4.BackgroundTransparency = 1.000
    Text_4.Position = UDim2.new(0.5, 0, 0.5, 0)
    Text_4.Size = UDim2.new(0.600000024, 0, 0.600000024, 0)
    Text_4.Font = Enum.Font.Code
    Text_4.Text = "a"
    Text_4.TextColor3 = Color3.fromRGB(255, 255, 255)
    Text_4.TextScaled = true
    Text_4.TextSize = 16.000
    Text_4.TextWrapped = true
    local KeySpace = Instance.new("Frame")
    KeySpace.Name = "KeySpace"
    KeySpace.Parent = Keystrokes
    KeySpace.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
    KeySpace.BorderSizePixel = 0
    KeySpace.BorderColor3 = Color3.fromRGB(0,0,0)
    KeySpace.Position = UDim2.new(0.0433132015, 0, 0.767, 0)
    KeySpace.Size = UDim2.new(0.904328346, 0, 0.19, 0)
    local Text_5 = Instance.new("TextLabel")
    Text_5.Name = "Text"
    Text_5.Parent = KeySpace
    Text_5.AnchorPoint = Vector2.new(0.5, 0.5)
    Text_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Text_5.BackgroundTransparency = 1.000
    Text_5.Position = UDim2.new(0.499999374, 0, 0.421568632, 0)
    Text_5.Size = UDim2.new(0.866666317, 0, 0.843137264, 0)
    Text_5.Font = Enum.Font.Code
    Text_5.Text = "space"
    Text_5.TextColor3 = Color3.fromRGB(255, 255, 255)
    Text_5.TextScaled = true
    Text_5.TextSize = 16.000
    Text_5.TextWrapped = true
    Text_5.TextYAlignment = Enum.TextYAlignment.Top
    local LMB = Instance.new("Frame")
    LMB.Name = "lmb"
    LMB.Parent = Keystrokes
    LMB.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
    LMB.BorderSizePixel = 0
    LMB.BorderColor3 = Color3.fromRGB(0,0,0)
    LMB.Position = UDim2.new(0.043, 0, 0.526, 0)
    LMB.Size = UDim2.new(0.453, 0, 0.241, 0)
    local Text_6 = Instance.new("TextLabel")
    Text_6.Name = "Text"
    Text_6.Parent = LMB
    Text_6.AnchorPoint = Vector2.new(0.5, 0.5)
    Text_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Text_6.BackgroundTransparency = 1.000
    Text_6.Position = UDim2.new(0.490401864, 0, 0.396265358, 0)
    Text_6.Size = UDim2.new(0.600000024, 0, 0.456367731, 0)
    Text_6.Font = Enum.Font.Code
    Text_6.Text = "lmb"
    Text_6.TextColor3 = Color3.fromRGB(255, 255, 255)
    Text_6.TextScaled = true
    Text_6.TextSize = 16.000
    Text_6.TextWrapped = true
    local CPS = Instance.new("TextLabel")
    CPS.Name = "CPS"
    CPS.Parent = LMB
    CPS.AnchorPoint = Vector2.new(0.5, 0.5)
    CPS.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CPS.BackgroundTransparency = 1.000
    CPS.Position = UDim2.new(0.490401864, 0, 0.66377002, 0)
    CPS.Size = UDim2.new(0.600000024, 0, 0.272459656, 0)
    CPS.Font = Enum.Font.Code
    CPS.Text = "[0]"
    CPS.TextColor3 = Color3.fromRGB(255, 255, 255)
    CPS.TextScaled = true
    CPS.TextSize = 16.000
    CPS.TextWrapped = true
    local RMB = Instance.new("Frame")
    RMB.Name = "rmb"
    RMB.Parent = Keystrokes
    RMB.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
    RMB.BorderSizePixel = 0
    RMB.BorderColor3 = Color3.fromRGB(0,0,0)
    RMB.Position = UDim2.new(0.495999813, 0, 0.526000023, 0)
    RMB.Size = UDim2.new(0.451641679, 0, 0.240999997, 0)
    local Text_7 = Instance.new("TextLabel")
    Text_7.Name = "Text"
    Text_7.Parent = RMB
    Text_7.AnchorPoint = Vector2.new(0.5, 0.5)
    Text_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Text_7.BackgroundTransparency = 1.000
    Text_7.Position = UDim2.new(0.490372986, 0, 0.396265358, 0)
    Text_7.Size = UDim2.new(0.600000024, 0, 0.456367731, 0)
    Text_7.Font = Enum.Font.Code
    Text_7.Text = "rmb"
    Text_7.TextColor3 = Color3.fromRGB(255, 255, 255)
    Text_7.TextScaled = true
    Text_7.TextSize = 16.000
    Text_7.TextWrapped = true
    local CPS_2 = Instance.new("TextLabel")
    CPS_2.Name = "CPS"
    CPS_2.Parent = RMB
    CPS_2.AnchorPoint = Vector2.new(0.5, 0.5)
    CPS_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CPS_2.BackgroundTransparency = 1.000
    CPS_2.Position = UDim2.new(0.490372986, 0, 0.66377002, 0)
    CPS_2.Size = UDim2.new(0.600000024, 0, 0.272459656, 0)
    CPS_2.Font = Enum.Font.Code
    CPS_2.Text = "[0]"
    CPS_2.TextColor3 = Color3.fromRGB(255, 255, 255)
    CPS_2.TextScaled = true
    CPS_2.TextSize = 16.000
    CPS_2.TextWrapped = true
    keystrokesAPI.Instance = Keystrokes

    local function highlight(inst, state) 
        inst.BackgroundColor3 = state == true and Color3.fromRGB(17, 17, 17) or Color3.fromRGB(51, 51, 51)
    end

    local keystrokes = {
        W = KeyW,
        A = KeyA,
        S = KeyS,
        D = KeyD,
        Space = KeySpace,
        MouseButton1 = LMB,
        MouseButton2 = RMB,
        MouseButton1CPS = CPS,
        MouseButton2CPS = CPS_2
    }

    keystrokesAPI.Objects = keystrokes

    for i,v in next, keystrokes do 
        local label = (v.ClassName:find("Text") and v) or v:FindFirstChild("Text")
        GuiLibrary.utils:connection(GuiLibrary.ColorUpdate:Connect(function()
            label.TextColor3 = GuiLibrary.utils:getColorOfObject(v)
        end))
    end

    local clicks = {
        MouseButton1 = 0,
        MouseButton2 = 0,
    }

    function keystrokesAPI.handleInput(input, down)
        if typeof(keystrokes[input.KeyCode.Name]) == 'Instance' then 
            highlight(keystrokes[input.KeyCode.Name], down)
        elseif typeof(keystrokes[input.UserInputType.Name]) == 'Instance' then 
            highlight(keystrokes[input.UserInputType.Name], down)
            keystrokesAPI.updateCPS()
            if not down then
                clicks[input.UserInputType.Name] += 1
                keystrokesAPI.updateCPS()
                coroutine.wrap(function() 
                    task.wait(1)
                    clicks[input.UserInputType.Name] -= 1
                    keystrokesAPI.updateCPS()
                end)()
            end
        end
    end
    
    function keystrokesAPI.updateCPS() 
        for i,v in next, clicks do 
            local cps = keystrokes[i.."CPS"]
            cps.Text = "["..tostring(v).."]"
        end
    end

    function keystrokesAPI.init() 
        coroutine.wrap(function()
            task.wait(0.01)
            keystrokesAPI.Connection = game:GetService("UserInputService").InputBegan:Connect(function(i) keystrokesAPI.handleInput(i,false) end)
            keystrokesAPI.Connection2 = game:GetService("UserInputService").InputEnded:Connect(function(i) keystrokesAPI.handleInput(i, true) end)
        end)()
    end

end

keyStrokesToggle = HUDButton.CreateToggle({
    Name = "keystrokes",
    Function = function(callback) 
        if HUDButton.Enabled then
            keyStrokesWindow.Instance.Visible = callback
        end

        if callback then 
            keystrokesAPI.init()
        else
            if keystrokesAPI.Connection then 
                keystrokesAPI.Connection:Disconnect()  
                keystrokesAPI.Connection = nil
            end
            if keystrokesAPI.Connection2 then 
                keystrokesAPI.Connection2:Disconnect()  
                keystrokesAPI.Connection2 = nil
            end
        end
    end
})

keyStrokesWindow.CreateSlider({
    Name = "scale",
    Default = 1,
    Min = 0.1,
    Max = 2,
    Round = 1,
    Function = function(value) 
        keystrokesAPI.Instance.Size = UDim2.new(0, 230 * value, 0, 260 * value)
    end
})

keyStrokesWindow.CreateSlider({
    Name = "transparency",
    Default = 0,
    Min = 0,
    Max = 100,
    Round = 0,
    Function = function(value) 
        for i,v in next, keystrokesAPI.Objects do 
            if i:find("CPS") then continue end
            v.Transparency = value / 100
        end
    end
})

local universal = funcs:run(funcs:getUniversalScript())
local gameScript = funcs:run(funcs:getPlaceScript())
local privateScript = funcs:run(funcs:getPrivateScript())
function funcs:saveConfig() 
    if not engoware then 
        return
    end

    local configName = "default"
    local path = "engoware/configs/" .. funcs:getPlaceIdentifier() .. "/"
    local configPath = path .. configName .. ".json"

    local config = {}

    for i,v in next, GuiLibrary.Objects do 
        if v.Type == 'OptionsButton' then 
            config[i] = {Enabled = v.API.Enabled, Bind = v.API.Bind, Type = v.Type, Window = v.Window}
        elseif v.Type == 'Toggle' then
            config[i] = {Enabled = v.API.Enabled, Type = v.Type, OptionsButton = v.OptionsButton, CustomWindow = v.CustomWindow}
        elseif v.Type == 'Slider' then
            config[i] = {Value = v.API.Value, Type = v.Type, OptionsButton = v.OptionsButton, CustomWindow = v.CustomWindow}
        elseif v.Type == 'Dropdown' then
            config[i] = {Value = v.API.Value, Type = v.Type, OptionsButton = v.OptionsButton, CustomWindow = v.CustomWindow}
        elseif v.Type == 'Textbox' then
            config[i] = {Value = v.API.Value, Type = v.Type, OptionsButton = v.OptionsButton, CustomWindow = v.CustomWindow}
        elseif v.Type == 'MultiDropdown' then
            local values = v.API.Values
            for i,v in next, values do 
                v.Instance = nil
                v.SelectedInstance = nil
            end
            config[i] = {Values = values, Type = v.Type, OptionsButton = v.OptionsButton, CustomWindow = v.CustomWindow}
        elseif v.Type == 'Textlist' then
            config[i] = {Values = v.API.Values, Type = v.Type, OptionsButton = v.OptionsButton, CustomWindow = v.CustomWindow}
        elseif v.Type == 'CustomWindow' then
            config[i] = {Position = {X = {Scale = v.Instance.Position.X.Scale, Offset = v.Instance.Position.X.Offset}, Y = {Scale = v.Instance.Position.Y.Scale, Offset = v.Instance.Position.Y.Offset}}, Type = v.Type}
        end
    end

    makefolder(path)
    if isfile(configPath) then 
        delfile(configPath)
    end

    local success, returned = pcall(function() 
        return game:GetService("HttpService"):JSONEncode(config)
    end)

    if success then 
        writefile(configPath, returned)
    else
        warn("[engoware] failed to save config: " .. returned)
    end

    repeat task.wait() until isfile(configPath)
end

function funcs:loadConfig() 
    if not engoware then 
        return
    end

    local configName = "default"
    local path = "engoware/configs/" .. funcs:getPlaceIdentifier() .. "/"
    local configPath = path .. configName .. ".json"

    if not isfile(configPath) then 
        return
    end

    local success, returned = pcall(function() 
        return game:GetService("HttpService"):JSONDecode(readfile(configPath))
    end)

    if not success then 
        return warn("[engoware] failed to load config: " .. returned)
    end
    for i,v in next, returned do 
        local prop = v.Type == 'OptionsButton' and 'Window' or v.CustomWindow and 'CustomWindow' or 'OptionsButton'
        local object = funcs:getObject(i, prop, v[prop])
        if not object then 
            continue 
        end

        if v.Type == 'OptionsButton' then 
            if v.Bind and v.Bind ~= "" then
                object.API.SetBind(v.Bind)
            end
            if v.Enabled then
                object.API.Toggle()
            end
        elseif v.Type == 'Toggle' then
            if v.Enabled ~= object.API.Enabled then
                object.API.Toggle()
            end
        elseif v.Type == 'Slider' then
            object.API.Set(v.Value, true)
        elseif v.Type == 'Dropdown' then
            object.API.SetValue(v.Value)
        elseif v.Type == 'Textbox' then
            object.API.Set(v.Value)
        elseif v.Type == 'MultiDropdown' then
            for i,v in next, v.Values do 
                if v.Enabled then
                    object.API.ToggleValue(v.Value)
                end
            end
        elseif v.Type == 'Textlist' then
            for i,v in next, v.Values do 
                object.API.Add(v)
            end
        elseif v.Type == 'CustomWindow' then
            object.Instance.Position = UDim2.new(v.Position.X.Scale, v.Position.X.Offset, v.Position.Y.Scale, v.Position.Y.Offset)
        end
    end

end
funcs:loadConfig()

local teleportConnection = lplr.OnTeleport:Connect(function(State)
    if State == Enum.TeleportState.Started then
		local stringtp = [[
            if engoware_developer then 
                loadstring(readfile("engoware/Main.lua"))()
            else 
                loadstring(game:HttpGet("https://raw.githubusercontent.com/joeengo/engoware/main/Main.lua", true))() 
            end
        ]]
		queueteleport(stringtp)
        funcs:saveConfig()
    end
end)

local playerRemovingConnection = Players.PlayerRemoving:Connect(function(player)
    if player == lplr then 
        funcs:saveConfig()
    end
end)

coroutine.wrap(function() 
    repeat 
        for i = 1, 50 do 
            task.wait(0.1)
            if not engoware then 
                break
            end
        end
        funcs:saveConfig()
    until not engoware
end)()

engoware.UninjectEvent.Event:Connect(function() 
    funcs:saveConfig()
    getgenv().engoware = nil
    for i,v in next, GuiLibrary.Objects do 
        if v.Type == 'OptionsButton' and v.API.Enabled then 
            v.API.Toggle()
        end
        if v.Type == 'Toggle' and v.API.Enabled then 
            v.API.Toggle()
        end
    end
    teleportConnection:Disconnect()
    playerRemovingConnection:Disconnect()
    for i,v in next, GuiLibrary.Connections do 
        v:Disconnect()
    end
    GuiLibrary.ScreenGui:Destroy()
end)

if engoware_developer then
    print("[engoware] loaded in " .. tostring(tick() - startTick) .. "s.")
end
end)



Section:NewButton("Future", "Executes Future (idk who made it and who uses this shit lol)", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/joeengo/Future/main/loadstring.lua', true))() 
end)

