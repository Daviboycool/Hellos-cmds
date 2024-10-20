local NotificationLibrary = {}

function NotificationLibrary:CreateNotification(message, confirmCallback, colorf, colora, buttoncolor)
    local ScreenGui = Instance.new("ScreenGui")
    local NotificationFrame = Instance.new("Frame")
    local ConfirmButton = Instance.new("TextButton")
    local CancelButton = Instance.new("TextButton")
    local NotificationText = Instance.new("TextLabel")
    local UICornerFrame = Instance.new("UICorner")
    local UICornerConfirm = Instance.new("UICorner")
    local UICornerCancel = Instance.new("UICorner")
    local UIStroke = Instance.new("UIStroke")

    -- Parent objects
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    NotificationFrame.Parent = ScreenGui
    ConfirmButton.Parent = NotificationFrame
    CancelButton.Parent = NotificationFrame
    NotificationText.Parent = NotificationFrame

    -- Notification Frame design (solid black and centered)
    NotificationFrame.BackgroundColor3 = Color3.fromRGB(colora) -- Preto sólido
    NotificationFrame.Size = UDim2.new(0, 450, 0, 300)
    NotificationFrame.Position = UDim2.new(0.5, -225, 0.5, -150)

    -- Adicionando bordas arredondadas ao frame
    UICornerFrame.Parent = NotificationFrame
    UICornerFrame.CornerRadius = UDim.new(0.2, 0) -- Bordas mais suaves

    -- Stroke (borda externa branca) no Frame
    UIStroke.Parent = NotificationFrame
    UIStroke.Color = Color3.fromRGB(colorf)
    UIStroke.Thickness = 3

    -- Notification Text design (supports 900 characters)
    NotificationText.Size = UDim2.new(0.9, 0, 0.4, 0)
    NotificationText.Position = UDim2.new(0.05, 0, 0.15, 0)
    NotificationText.BackgroundTransparency = 1
    NotificationText.Text = message
    NotificationText.TextWrapped = true
    NotificationText.TextScaled = true
    NotificationText.Font = Enum.Font.GothamBold
    NotificationText.TextColor3 = Color3.fromRGB(255, 255, 255)

    -- Confirm Button design (rounded, white color with hover effect)
    ConfirmButton.Size = UDim2.new(0.4, 0, 0.2, 0)
    ConfirmButton.Position = UDim2.new(0.05, 0, 0.7, 0)
    ConfirmButton.BackgroundColor3 = Color3.fromRGB(buttoncolor)
    ConfirmButton.Text = "Confirm"
    ConfirmButton.Font = Enum.Font.GothamBold
    ConfirmButton.TextScaled = true
    ConfirmButton.TextColor3 = Color3.fromRGB(0, 0, 0)

    -- Rounded corners for Confirm Button
    UICornerConfirm.Parent = ConfirmButton
    UICornerConfirm.CornerRadius = UDim.new(1, 0)

    -- Cancel Button design (rounded, white color with hover effect)
    CancelButton.Size = UDim2.new(0.4, 0, 0.2, 0)
    CancelButton.Position = UDim2.new(0.55, 0, 0.7, 0)
    CancelButton.BackgroundColor3 = Color3.fromRGB(buttoncolor)
    CancelButton.Text = "Cancel"
    CancelButton.Font = Enum.Font.GothamBold
    CancelButton.TextScaled = true
    CancelButton.TextColor3 = Color3.fromRGB(0, 0, 0)

    -- Rounded corners for Cancel Button
    UICornerCancel.Parent = CancelButton
    UICornerCancel.CornerRadius = UDim.new(0.2, 0)


    -- Script for Confirm and Cancel buttons
    ConfirmButton.MouseButton1Click:Connect(function()
        if confirmCallback then
            confirmCallback() -- Executa o callback quando "Confirm" é clicado
        end
        ScreenGui:Destroy() -- Fecha o GUI
    end)

    CancelButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy() -- Fecha o GUI
    end)
end

return NotificationLibrary
