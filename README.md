# Lords of the Fallen (2)
Backup Lords of the Fallen Save Files.

## Turn off Steam cloud Save
You want to do that so that you don't get conflicts and accidentally overwrite your local save.
Then load and exit game, and check your save file location to make sure files are saved locally

## Local Save File Location
If you want to inspect the save files, the main file being Save00.sav

If your Windows is installed in C: drive, files will be located in:
`c:\users\<your_user_name>\AppData\Local\LOTF2\Saved\SaveGames`

If you are in PowerShell, you can type the following to get there
`cd $env:LocalAppData\LOTF2\Saved\SaveGames`

In Windows Explorer:
`cd %localappdata%\LOTF2\Saved\SaveGames`

Or after hitting key combination Win+R
`%localappdata%\LOTF2\Saved\SaveGames`

## Backup
To backup the save, you will want to copy everything under the save folder to a different folder.

# How to use backup
A few steps to follow
- Create a backup folder somewhere
- copy both backup_lotf.ps1 and backup_lotf.cmd into a folder, this is where you are going to run them from.
- edit the backup_lotf.ps1 and replace the "g:\games\backup\lotf", with your own backup file location (don't delete quotes)
- run backup_lotf.cmd
  - if you would like to write notes about your save, you can use the readme.txt file created in the backup folder
  - you can also rename the backup folder, e.g. 

# How to restore
- run the script to take a backup of your current state
- go to the `backup folder`  you created before and choose the save you want to go back to
  - Folders will have timestamps
- copy the contents of the folder and paste over the files in `"local save folder"` explained above.

# Bonus info - Clone your character
Save files for every character your create are stored inthe local save file location.

You can use that knowledge to clone your character. If you only have one character, save file for it will be named Save00.sav
- Exit the game
- copy/paste save00.sav and rename the new file as save01.sav
- relaunch the game
- now you should have two identical characters to load, you can choose one, and use mirror in the game to rename it, if you have advanced that far.
