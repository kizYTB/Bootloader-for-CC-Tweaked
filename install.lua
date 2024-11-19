local bgColor = colors.gray
local textColor = colors.white
local accentColor = colors.blue
local highlightColor = colors.lightGray
local borderColor = colors.black

local function centerWrite(text, y, color)
    color = color or textColor
    local w, h = term.getSize()
    local x = math.floor((w - #text) / 2) + 1
    term.setCursorPos(x, y)
    term.setTextColor(color)
    term.write(text)
end

local function drawBorder()
    local w, h = term.getSize()
    term.setBackgroundColor(borderColor)
    term.setTextColor(colors.white)
    term.setCursorPos(1, 1)
    term.write("+" .. string.rep("-", w - 2) .. "+")
    term.setCursorPos(1, h)
    term.write("+" .. string.rep("-", w - 2) .. "+")
    for y = 2, h - 1 do
        term.setCursorPos(1, y)
        term.write("|")
        term.setCursorPos(w, y)
        term.write("|")
    end
end

local function drawLoadingBar(percentage, message)
    local w, h = term.getSize()
    local barLength = w - 4
    local filledLength = math.floor(barLength * percentage)
    
    term.setCursorPos(2, h - 2)
    term.setBackgroundColor(accentColor)
    term.write(string.rep(" ", filledLength))
    term.setBackgroundColor(colors.black)
    term.write(string.rep(" ", barLength - filledLength))

    term.setCursorPos(2, h - 3)
    term.setTextColor(textColor)
    term.write(message .. " " .. math.floor(percentage * 100) .. "%")
end

local function executeWithProgress(commands)
    local totalCommands = #commands
    local currentCommand = 0

    for _, command in ipairs(commands) do
        currentCommand = currentCommand + 1
        term.clear()
        drawBorder()
        centerWrite("Installation en cours...", 3)
        drawLoadingBar(currentCommand / totalCommands, "Exécution de la commande : " .. command)

        term.setCursorPos(2, 5)
        term.setTextColor(textColor)
        term.write("Commande : " .. command)
        sleep(1)
        shell.run(command)

        sleep(1)
    end

    term.clear()
    drawBorder()
    centerWrite("Terminer, veuillez redémarrer votre ordinateur", 3)
    sleep(2)
end

local commands = {
    "mkdir /.bootloader/",
    "cd /.bootloader/",
    "wget https://raw.githubusercontent.com/kizYTB/Bootloader-for-CC-Tweaked/refs/heads/main/boot.lua",
    "mkdir OS Logo DefaultOS",
    "cd OS/",
    "wget https://raw.githubusercontent.com/kizYTB/Bootloader-for-CC-Tweaked/refs/heads/main/OS/CraftOS.json",
    "cd ../Logo",
    "wget https://raw.githubusercontent.com/kizYTB/Bootloader-for-CC-Tweaked/refs/heads/main/Logo/logo.nfp",
    "cd ../DefaultOS",
    "wget https://raw.githubusercontent.com/kizYTB/Bootloader-for-CC-Tweaked/refs/heads/main/DefaultOS/boot.lua",
    "cd /",
    "wget https://raw.githubusercontent.com/kizYTB/Bootloader-for-CC-Tweaked/refs/heads/main/startup.lua",
}

local function main()
    term.setBackgroundColor(bgColor)
    term.clear()
    
    executeWithProgress(commands)
end

main()
