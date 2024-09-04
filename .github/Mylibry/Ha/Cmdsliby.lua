local CommandLibrary = {}

local prefix = "!"
local commands = {}
local discordLink = "https://discord.com"
local youtubeLink = "https://youtube.com"

-- Function to create the GUI with a nice design
function CommandLibrary:CreateGUI()
    local gui = Instance.new("ScreenGui")
    gui.Name = "CommandLibraryGUI"
    gui.Parent = game.CoreGui

    local background = Instance.new("Frame")
    background.Size = UDim2.new(0.3, 0, 0.4, 0)  -- Smaller background
    background.Position = UDim2.new(0.35, 0, 0.3, 0)
    background.BackgroundTransparency = 0.2
    background.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    background.BorderSizePixel = 0
    background.Active = true
    background.Draggable = true
    background.Parent = gui

    local uicorner = Instance.new("UICorner")
    uicorner.CornerRadius = UDim.new(0, 12)
    uicorner.Parent = background

    -- Creating the TextBox with a nice design
    local textbox = Instance.new("TextBox")
    textbox.Size = UDim2.new(0.8, 0, 0.1, 0)
    textbox.Position = UDim2.new(0.1, 0, 0.1, 0)
    textbox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
    textbox.Font = Enum.Font.Gotham
    textbox.TextSize = 14
    textbox.PlaceholderText = "cmd here"  -- English placeholder
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

    -- Creating the !cmds GUI
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

    -- Adding the !cmds command
    CommandLibrary:AddCommand("cmds", function()
        cmdsList.Text = "Commands:\n"
        for cmd, _ in pairs(commands) do
            cmdsList.Text = cmdsList.Text .. prefix .. cmd .. "\n"
        end
        cmdsGui.Visible = true
    end)

    -- Discord button
    local discordButton = Instance.new("ImageButton")
    discordButton.Size = UDim2.new(0.1, 0, 0.1, 0)
    discordButton.Position = UDim2.new(0.05, 0, 0.85, 0)
    discordButton.Image = "rbxassetid://6035036180" -- Discord icon asset
    discordButton.BackgroundTransparency = 1
    discordButton.Parent = gui

    discordButton.MouseButton1Click:Connect(function()
        setclipboard(discordLink)  -- Copies the Discord link to clipboard
        print("Discord link copied: " .. discordLink)
    end)

    -- YouTube button
    local youtubeButton = Instance.new("ImageButton")
    youtubeButton.Size = UDim2.new(0.1, 0, 0.1, 0)
    youtubeButton.Position = UDim2.new(0.85, 0, 0.85, 0)
    youtubeButton.Image = "rbxassetid://6035047389" -- YouTube icon asset
    youtubeButton.BackgroundTransparency = 1
    youtubeButton.Parent = gui

    youtubeButton.MouseButton1Click:Connect(function()
        setclipboard(youtubeLink)  -- Copies the YouTube link to clipboard
        print("YouTube link copied: " .. youtubeLink)
    end)
end

-- Function to add commands
function CommandLibrary:AddCommand(name, callback)
    commands[name] = callback
end

-- Function to change the Discord link
function CommandLibrary:SetDiscordLink(newLink)
    discordLink = newLink
end

-- Function to change the YouTube link
function CommandLibrary:SetYoutubeLink(newLink)
    youtubeLink = newLink
end

-- Function to change the prefix
function CommandLibrary:SetPrefix(newPrefix)
    prefix = newPrefix
end

-- Function to parse the command input
function CommandLibrary:ParseCommand(text)
    if string.sub(text, 1, #prefix) == prefix then
        local split = string.split(string.sub(text, #prefix + 1), " ")
        local command = split[1]
        table.remove(split, 1)
        return command, split
    end
end

return CommandLibrary
