-- CustomLibrary.lua

local CustomLibrary = {}

-- Function to create the ScreenGui
function CustomLibrary:CreateScreenGui(parent)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = parent
    return ScreenGui
end

-- Function to create the MainFrame
function CustomLibrary:CreateMainFrame(ScreenGui)
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0.6, 0, 0.6, 0)
    MainFrame.Position = UDim2.new(0.2, 0, 0.2, 0)
    MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui
    return MainFrame
end

-- Function to set a banner image
function CustomLibrary:SetBanner(Frame, imageID)
    local Banner = Instance.new("ImageLabel")
    Banner.Size = UDim2.new(1, 0, 0.2, 0)
    Banner.Position = UDim2.new(0, 0, 0, 0)
    Banner.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Banner.Image = "rbxassetid://" .. tostring(imageID)
    Banner.Parent = Frame
end

-- Function to create a channel
function CustomLibrary:CreateChannel(Frame, name, position, size)
    local ChannelFrame = Instance.new("Frame")
    ChannelFrame.Size = size
    ChannelFrame.Position = position
    ChannelFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    ChannelFrame.BorderSizePixel = 0
    ChannelFrame.Parent = Frame
    return ChannelFrame
end

-- Function to add a component to a channel
function CustomLibrary:AddComponentToChannel(Channel, type, text, position, size, callback)
    local Component
    if type == "Button" then
        Component = Instance.new("TextButton")
        Component.Text = text
        Component.BackgroundColor3 = Color3.fromRGB(0, 122, 204)
        Component.TextColor3 = Color3.fromRGB(255, 255, 255)
        Component.TextScaled = true
    end
    -- Add more component types as needed
    Component.Size = size
    Component.Position = position
    Component.Parent = Channel

    if callback then
        Component.MouseButton1Click:Connect(callback)
    end
end

-- Function to create a modern menu
function CustomLibrary:CreateModernMenu(Frame, title)
    local MenuFrame = Instance.new("Frame")
    MenuFrame.Size = UDim2.new(0.3, 0, 0.5, 0)
    MenuFrame.Position = UDim2.new(0.35, 0, 0.25, 0)
    MenuFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    MenuFrame.BorderSizePixel = 0
    MenuFrame.Parent = Frame

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, 0, 0.1, 0)
    TitleLabel.Position = UDim2.new(0, 0, 0, 0)
    TitleLabel.BackgroundColor3 = Color3.fromRGB(0, 122, 204)
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.Text = title
    TitleLabel.TextScaled = true
    TitleLabel.Parent = MenuFrame

    local function toggleMenu()
        MenuFrame.Visible = not MenuFrame.Visible
    end

    return MenuFrame, toggleMenu
end

-- Function to add a menu option
function CustomLibrary:AddMenuOption(MenuFrame, text, position, size, callback)
    local Option = Instance.new("TextButton")
    Option.Size = size
    Option.Position = position
    Option.BackgroundColor3 = Color3.fromRGB(0, 122, 204)
    Option.TextColor3 = Color3.fromRGB(255, 255, 255)
    Option.Text = text
    Option.TextScaled = true
    Option.Parent = MenuFrame

    if callback then
        Option.MouseButton1Click:Connect(callback)
    end
end

-- Function to create a key system
function CustomLibrary:CreateKeySystem(Frame, validKey)
    local KeyFrame = Instance.new("Frame")
    KeyFrame.Size = UDim2.new(0.5, 0, 0.3, 0)
    KeyFrame.Position = UDim2.new(0.25, 0, 0.35, 0)
    KeyFrame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    KeyFrame.BorderSizePixel = 0
    KeyFrame.Parent = Frame

    local KeyLabel = Instance.new("TextLabel")
    KeyLabel.Size = UDim2.new(1, 0, 0.2, 0)
    KeyLabel.Position = UDim2.new(0, 0, 0, 0)
    KeyLabel.BackgroundColor3 = Color3.fromRGB(0, 122, 204)
    KeyLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    KeyLabel.Text = "Enter Key:"
    KeyLabel.TextScaled = true
    KeyLabel.Parent = KeyFrame

    local KeyTextBox = Instance.new("TextBox")
    KeyTextBox.Size = UDim2.new(0.8, 0, 0.2, 0)
    KeyTextBox.Position = UDim2.new(0.1, 0, 0.2, 0)
    KeyTextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    KeyTextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
    KeyTextBox.TextScaled = true
    KeyTextBox.Parent = KeyFrame

    local CheckButton = Instance.new("TextButton")
    CheckButton.Size = UDim2.new(0.8, 0, 0.2, 0)
    CheckButton.Position = UDim2.new(0.1, 0, 0.5, 0)
    CheckButton.BackgroundColor3 = Color3.fromRGB(0, 122, 204)
    CheckButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CheckButton.Text = "Submit"
    CheckButton.TextScaled = true
    CheckButton.Parent = KeyFrame

    CheckButton.MouseButton1Click:Connect(function()
        local enteredKey = KeyTextBox.Text
        if enteredKey == validKey then
            print("Key accepted!")
            -- Additional logic for accepted key
        else
            print("Invalid key!")
        end
    end)

    -- Create a copy button
    local CopyButton = Instance.new("TextButton")
    CopyButton.Size = UDim2.new(0.3, 0, 0.2, 0)
    CopyButton.Position = UDim2.new(0.1, 0, 0.8, 0)
    CopyButton.BackgroundColor3 = Color3.fromRGB(0, 122, 204)
    CopyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CopyButton.Text = "Copy Key"
    CopyButton.TextScaled = true
    CopyButton.Parent = KeyFrame

    -- Copy key functionality
    CopyButton.MouseButton1Click:Connect(function()
        -- Logic to copy the key to clipboard (implement accordingly)
        print("Key copied to clipboard!")
    end)

    -- Create a close button
    local CloseButton = Instance.new("TextButton")
    CloseButton.Size = UDim2.new(0.3, 0, 0.2, 0)
    CloseButton.Position = UDim2.new(0.7, 0, 0.8, 0)
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.Text = "Close"
    CloseButton.TextScaled = true
    CloseButton.Parent = KeyFrame

    CloseButton.MouseButton1Click:Connect(function()
        KeyFrame:Destroy()  -- Close the key system frame
    end)
end

return CustomLibrary
