<div align = "center">
  <img src = "https://www.jtheberg.cloud/assets/img/logo.png" />
  <h1>Bootloader-for-CC-Tweaked</h1>
  <h2>Powered by Kiz___ of <a href="https://jtheberg.cloud">Jtheberg</a></h2>
  <p>A bootloader for your OS on CC-Tweaked</p>
</div>
<br />
<br />

# Installation
The bootloader installation should be done using this command.
```
wget run https://raw.githubusercontent.com/kizYTB/Bootloader-for-CC-Tweaked/refs/heads/main/install.lua
```

<br />

# The Config File
 All OS that want to use this bootloader must make a configuration file in the following directory `/.bootloader/OS/`
```json
{
    "name": "OS name",
    "path": "/path/to/os.lua"
}

```

<br />

| Property | Definition |
| ---- | ---- |
| `name` | OS name |
| `path` | Path to your OS startup file
