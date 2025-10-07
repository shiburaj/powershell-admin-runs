# Run PS Commands in Admin
Use thsi repo to run powershell commands with elevated admin rights and also use the below commands to create a `exe`

## Convert to EXE with ps2exe

**ps2exe** is a well-known PowerShell module that packages scripts into EXEs.

From an **admin** PowerShell prompt:

```ps
Install-Module -Name ps2exe -Scope CurrentUser -Force   # one-time
Import-Module ps2exe
Invoke-PS2EXE -InputFile .\RunMyCommands.ps1 -OutputFile .\RunMyCommands.exe -NoConsole -icon "icon.ico" -requireAdmin -title "RunMyCommand Tool" -product "RunMyCommandMenu"
```


Use -NoConsole for a GUIless double-clickable EXE (no black console window). Omit it if you want the console visible.

You can add -icon "C:\path\to\icon.ico" to set an icon.

The resulting EXE will execute the script — the self-elevation code still works (it will re-launch PowerShell elevated). Expect a UAC prompt when double-clicking (unless user has disabled UAC).