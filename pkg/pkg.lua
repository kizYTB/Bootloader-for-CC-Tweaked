run=shell.run

run("mkdir","/.bootloader/")
run("cd","/.bootloader/")"cd /.bootloader/",
run("wget","https://raw.githubusercontent.com/kizYTB/Bootloader-for-CC-Tweaked/refs/heads/main/boot.lua")
run("mkdir","OS/ Logo/ DefaultOS/")
run("cd","OS/")
run("wget","https://raw.githubusercontent.com/kizYTB/Bootloader-for-CC-Tweaked/refs/heads/main/OS/CraftOS.json")",
run("cd","../Logo")
run("wget","https://raw.githubusercontent.com/kizYTB/Bootloader-for-CC-Tweaked/refs/heads/main/Logo/logo.nfp")
run("cd","./DefaultOS")
run("wget","https://raw.githubusercontent.com/kizYTB/Bootloader-for-CC-Tweaked/refs/heads/main/DefaultOS/boot.lua")
run("cd","/")
run("wget","https://raw.githubusercontent.com/kizYTB/Bootloader-for-CC-Tweaked/refs/heads/main/startup.lua")
