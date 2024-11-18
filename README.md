<div align = "center">
  <img src = "icon.svg" />
  <h1>Bootloader-for-CC-Tweaked</h1>
  <h2>Powered by [Jtheberg]()</h2>
  <img src = "https://www.jtheberg.cloud/assets/img/logo.png" />
  <p>A bootloader for your OS on CC-Tweaked</p>
</div>
<br />
<br />

# Installation
The bootloader installation should be done using this command.
```
$ wget run https://install
```

<br />

# The Config File
Every widgets project contains a `config.json` file. This file tells the All OS that want to use this bootloader must make a configuration file in the following directory `/boot/bootloader/OS/`
```json
{
    "name": "OS Nom",
    "path": "/path/to/os.lua"
}

```
| Property | Definition |
| ---- | ---- |
| `name` (string) | OS name |
| `path` (string) | Path to yout OS startup file |
installation |
