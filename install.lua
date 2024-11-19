-- Définition des couleurs
local bgColor = colors.gray
local textColor = colors.white
local accentColor = colors.blue
local highlightColor = colors.lightGray
local borderColor = colors.black

-- Fonction pour écrire du texte centré
local function centerWrite(text, y, color)
    color = color or textColor
    local w, h = term.getSize()
    local x = math.floor((w - #text) / 2) + 1
    term.setCursorPos(x, y)
    term.setTextColor(color)
    term.write(text)
end

-- Fonction pour dessiner une bordure
local function drawBorder()
    local w, h = term.getSize()
    term.setBackgroundColor(borderColor)
    term.setTextColor(colors.white)
    -- Haut de la bordure
    term.setCursorPos(1, 1)
    term.write("+" .. string.rep("-", w - 2) .. "+")
    -- Bas de la bordure
    term.setCursorPos(1, h)
    term.write("+" .. string.rep("-", w - 2) .. "+")
    -- Côtés de la bordure
    for y = 2, h - 1 do
        term.setCursorPos(1, y)
        term.write("|")
        term.setCursorPos(w, y)
        term.write("|")
    end
end

-- Fonction pour afficher une barre de chargement
local function drawLoadingBar(percentage, message)
    local w, h = term.getSize()
    local barLength = w - 4
    local filledLength = math.floor(barLength * percentage)
    
    term.setCursorPos(2, h - 2)
    term.setBackgroundColor(accentColor)
    term.write(string.rep(" ", filledLength))  -- Afficher la barre remplie
    term.setBackgroundColor(colors.black)
    term.write(string.rep(" ", barLength - filledLength))  -- Afficher l'espace vide

    -- Afficher le message de progression
    term.setCursorPos(2, h - 3)
    term.setTextColor(textColor)
    term.write(message .. " " .. math.floor(percentage * 100) .. "%")
end

-- Fonction pour exécuter des commandes avec une barre de chargement
local function executeWithProgress(commands)
    local totalCommands = #commands
    local currentCommand = 0

    -- Exécuter les commandes une par une
    for _, command in ipairs(commands) do
        currentCommand = currentCommand + 1
        term.clear()
        drawBorder()
        centerWrite("Installation en cours...", 3)
        drawLoadingBar(currentCommand / totalCommands, "Exécution de la commande : " .. command)

        -- Simuler l'exécution de la commande
        term.setCursorPos(2, 5)
        term.setTextColor(textColor)
        term.write("Commande : " .. command)
        sleep(1)  -- Simule le temps de l'exécution de la commande
        shell.run(command)  -- Exécuter la commande réelle

        -- Simuler un délai entre les étapes
        sleep(1)
    end

    term.clear()
    drawBorder()
    centerWrite("Installation terminée !", 3)
    sleep(2)
end

-- Liste des commandes à exécuter (par exemple : installer des paquets)
local commands = {
    "mkdir /.bootloader/",
    "cd /.bootloader/",
    "mkdir OS Logo DefaultOS",
    "cd OS/",
    "wget https://raw.githubusercontent.com/kizYTB/Bootloader-for-CC-Tweaked/refs/heads/main/OS/CraftOS.json?token=GHSAT0AAAAAAC2VRA6DTNIWGN6XCJU3QPP6ZZ33WXQ",
    "cd ../Logo",
    "wget https://raw.githubusercontent.com/kizYTB/Bootloader-for-CC-Tweaked/refs/heads/main/Logo/logo.nfp?token=GHSAT0AAAAAAC2VRA6CGJUGYFMU3OXWL74MZZ33XRA",
    "cd ../DefaultOS",
    "wget https://raw.githubusercontent.com/kizYTB/Bootloader-for-CC-Tweaked/refs/heads/main/DefaultOS/boot.lua?token=GHSAT0AAAAAAC2VRA6DJOVNJTLC5JAGVVCKZZ33YFA",
}

-- Fonction principale pour démarrer l'installation
local function main()
    term.setBackgroundColor(bgColor)
    term.clear()
    
    -- Démarrer l'installation avec une barre de chargement
    executeWithProgress(commands)
end

-- Lancer l'installation
main()
