# CustomLibrary Tutorial

- This repository contains the `CustomLibrary`, which allows you to create custom GUIs in Roblox with ease. Below is an example of how to use the library.

## How to Use

- **Load the Library**

##   First, load the `CustomLibrary` into your game using the following code:

```lua
   local CustomLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/Daviboycool/Hellos-cmds/main/.github/Githubmyhublib.lua"))()
```

- Create the ScreenGui and MainFrame

```lua
local ScreenGui = CustomLibrary:CreateScreenGui(game.Players.LocalPlayer:WaitForChild("PlayerGui"))
local MainFrame = CustomLibrary:CreateMainFrame(ScreenGui)
```
- Set the Banner

```lua
CustomLibrary:SetBanner(MainFrame, "1234567890") -- Replace with your banner image ID
```

- Create a Channel

```lua
local channel1 = CustomLibrary:CreateChannel(MainFrame, "Channel 1", UDim2.new(0, 0, 0.2, 0), UDim2.new(0.4, 0, 0.6, 0))
CustomLibrary:AddComponentToChannel(channel1, "Button", "Click Me!", UDim2.new(0.1, 0, 0.2, 0), UDim2.new(0.8, 0, 0.1, 0), function()
    print("Button in Channel 1 clicked!")
end)
```

- Create a Modern Menu I don't know 

```lua
local MenuFrame, toggleMenu = CustomLibrary:CreateModernMenu(MainFrame, "Options Menu")

CustomLibrary:AddMenuOption(MenuFrame, "Option 1", UDim2.new(0.1, 0, 0.2, 0), UDim2.new(0.8, 0, 0.1, 0), function()
    print("Option 1 clicked!")
end)

CustomLibrary:AddMenuOption(MenuFrame, "Option 2", UDim2.new(0.1, 0, 0.35, 0), UDim2.new(0.8, 0, 0.1, 0), function()
    print("Option 2 clicked!")
end)
```

- Add a Toggle Button to Open the Menu

```lua
local toggleButton = CustomLibrary:AddButton(MainFrame, "Open Menu", UDim2.new(0.1, 0, 0.8, 0), UDim2.new(0.8, 0, 0.1, 0), function()
    toggleMenu()
end)
```

- Create a Key System

```lua
local keySystemFrame = CustomLibrary:CreateKeySystem(MainFrame, "YourKeyHere")
```

## Notes
- Ensure that you replace "1234567890" with your actual banner image ID.

- The Key in CustomLibrary:CreateKeySystem(MainFrame, "YourKeyHere") should be replaced with your actual key.

- The GitHubURL and Key can be configured directly in the main script code, as shown in the examples.

-        Feel free to modify and extend the CustomLibrary as per your requirements.
#License

- This library is licensed under the MIT License. See the LICENSE file for details.


### How to Use

- **Create the GitHub Repository** and upload the necessary files, including `README.md` and the library file (`Githubmyhublib.lua`).

- **Add the Example Code** provided in `README.md` to help users understand how to use the library.

- **Share the Link** to your GitHub repository with users who might be interested in using the `CustomLibrary`.

- This will provide clear documentation and an example of how to use the library. If you need any further adjustments or specific features, just let me know!

