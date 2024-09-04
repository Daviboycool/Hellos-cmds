# CommandLibrary - Roblox GUI Command Library

**CommandLibrary** is a custom GUI library for Roblox that creates a movable TextBox with a transparent background. This library allows users to add custom commands, including toggle commands, and features a built-in `!cmds` command to list all added commands and change the command prefix.

## Features

- Movable GUI with a transparent background.
- Customizable TextBox for command input.
- Add custom commands easily.
- Built-in `!cmds` command to list all commands and change the prefix.
- Inspired by the visual style of the Orion Library.

## Installation

To use the CommandLibrary, load it in your script executor by adding the following code:

```lua
local CommandLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/Daviboycool/Hellos-cmds/main/.github/Mylibry/Ha/Cmdsliby.lua"))()
```

## here is the command to make a gui

```lua
CommandLibrary:CreateGUI()
```

## Add your custom commands using:

```lua
CommandLibrary:AddCommand("yourCommand", function()
    print("Your command executed!")
end)
```

- Replace "yourCommand" with the name of your command and the code inside the function with what you want to happen when the command is executed.

## Change the Prefix (Optional)
- You can change the prefix for commands by using:

```lua
CommandLibrary:SetPrefix("yourprefix")
```
- Replace "yourprefix" with your preferred prefix.

## Use the Built-in !cmds Command
- By default, the CommandLibrary includes a !cmds command that shows a list of all added commands and allows the user to change the prefix. Simply type !cmds in the TextBox to access this feature.
## Example


-Here's a complete example:
```lua
local CommandLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/Daviboycool/Hellos-cmds/main/.github/Mylibry/Ha/Cmdsliby.lua"))()

CommandLibrary:CreateGUI()

CommandLibrary:AddCommand("hello", function()
    print("Hello, world!")
end)

CommandLibrary:AddCommand("toggle", function()
    print("This is a toggle command!")
end)

CommandLibrary:SetPrefix("?")
```
