# Backup Destination directory, create the backup folder and put it here
$dst_root = "G:\games\backup\Lotf2" 

# Game save files
$src = "$ENV:LOCALAPPDATA\LOTF2\Saved\SaveGames"

Function backup_lotf {
    
    $folder_name = get-date -UFormat "%Y-%m-%dT%H-%M"

    $dst = join-path $dst_root $folder_name


    if (!(Test-Path $dst)) {
        "$dst does not exist. Creating..."
        new-item -ItemType Directory -Path $dst    

    } else {
        "$dst already exists. Skipping directory creation..."
    }

    "Copying save files from $src to $dst"
    Copy-Item $src\* $dst -Force
    gci $dst_root
    cd $dst
    New-Item -ItemType File -Name README.txt -force

    explorer $dst   
}

Function last_backup_dir {    

    $lbd = ((dir $dst_root -Directory |sort)[-1]).FullName
    
    Write-verbose "last_backup_dir: $lbd"
    $lbd

}

Function last_backup_file_time {
    
    $file_name = "GeneralSave.sav"
    $lbd = last_backup_dir

    $lbf = Join-Path $lbd $file_name
    $lrt = (get-item $lbf).LastWriteTime
    
    write-verbose "last_backup: $lrt"
    $lrt

    
}

Function src_save_file_time {

    $file_name = "GeneralSave.sav"

    $src_save_file_time = Join-Path $src $file_name
    $lrt = (get-item $src_save_file_time).LastWriteTime

    write-verbose "src_date: $lrt"
    $lrt

}


$src_time = src_save_file_time
$last_backup_time = last_backup_file_time

if ($src_time -ne $last_backup_time) {
    "source time $src_time is newer than last_backup: $last_backup_time"
    
    backup_lotf

} else {
    "already backed up at $src_time"

}
