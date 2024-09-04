local CommandLibrary = {}

local prefix = "!"
local commands = {}

function CommandLibrary:CreateGUI()
    local gui = Instance.new("ScreenGui")
    gui.Name = "CommandLibraryGUI"
    gui.Parent = game.CoreGui

    local background = Instance.new("Frame")
    background.Size = UDim2.new(0.4, 0, 0.5, 0)
    background.Position = UDim2.new(0.3, 0, 0.25, 0)
    background.BackgroundTransparency = 0.2
    background.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    background.BorderSizePixel = 0
    background.Active = true
    background.Draggable = true
    background.Parent = gui

    local uicorner = Instance.new("UICorner")
    uicorner.CornerRadius = UDim.new(0, 12)
    uicorner.Parent = background

    local textbox = Instance.new("TextBox")
    textbox.Size = UDim2.new(0.8, 0, 0.1, 0)
    textbox.Position = UDim2.new(0.1, 0, 0.1, 0)
    textbox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
    textbox.Font = Enum.Font.Gotham
    textbox.TextSize = 14
    textbox.PlaceholderText = "Type a command..."
    textbox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
    textbox.ClearTextOnFocus = true
    textbox.Parent = background

    local textboxCorner = Instance.new("UICorner")
    textboxCorner.CornerRadius = UDim.new(0, 8)
    textboxCorner.Parent = textbox

    textbox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            local text = textbox.Text
            textbox.Text = ""
            local command, args = self:ParseCommand(text)
            if command then
                if commands[command] then
                    commands[command](args)
                else
                    print("Command not found: " .. command)
                end
            end
        end
    end)

    local cmdsGui = Instance.new("Frame")
    cmdsGui.Size = UDim2.new(0.5, 0, 0.6, 0)
    cmdsGui.Position = UDim2.new(0.25, 0, 0.2, 0)
    cmdsGui.BackgroundTransparency = 0.2
    cmdsGui.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    cmdsGui.Visible = false
    cmdsGui.Parent = gui

    local cmdsGuiCorner = Instance.new("UICorner")
    cmdsGuiCorner.CornerRadius = UDim.new(0, 12)
    cmdsGuiCorner.Parent = cmdsGui

    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0.2, 0, 0.1, 0)
    closeButton.Position = UDim2.new(0.4, 0, 0.8, 0)
    closeButton.Text = "Close"
    closeButton.Font = Enum.Font.GothamBold
    closeButton.TextSize = 14
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    closeButton.Parent = cmdsGui

    local closeButtonCorner = Instance.new("UICorner")
    closeButtonCorner.CornerRadius = UDim.new(0, 8)
    closeButtonCorner.Parent = closeButton

    local cmdsList = Instance.new("TextLabel")
    cmdsList.Size = UDim2.new(0.8, 0, 0.7, 0)
    cmdsList.Position = UDim2.new(0.1, 0, 0.1, 0)
    cmdsList.Text = "Commands:\n"
    cmdsList.TextColor3 = Color3.fromRGB(255, 255, 255)
    cmdsList.Font = Enum.Font.Gotham
    cmdsList.TextSize = 14
    cmdsList.TextWrapped = true
    cmdsList.TextYAlignment = Enum.TextYAlignment.Top
    cmdsList.BackgroundTransparency = 1
    cmdsList.Parent = cmdsGui

    closeButton.MouseButton1Click:Connect(function()
        cmdsGui.Visible = false
    end)

    CommandLibrary:AddCommand("cmds", function()
        cmdsList.Text = "Commands:\n"
        for cmd, _ in pairs(commands) do
            cmdsList.Text = cmdsList.Text .. prefix .. cmd .. "\n"
        end
        cmdsGui.Visible = true
    end)
end

function CommandLibrary:AddCommand(name, callback)
    commands[name] = callback
end

function CommandLibrary:SetPrefix(newPrefix)
    prefix = newPrefix
end

function CommandLibrary:ParseCommand(text)
    if string.sub(text, 1, #prefix) == prefix then
        local split = string.split(string.sub(text, #prefix + 1), " ")
        local command = split[1]
        table.remove(split, 1)
        return command, split
    end
end

return CommandLibrary
