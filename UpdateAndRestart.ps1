$Updates = Start-WUScan
Format-List -InputObject $Updates -Property Title, Description
Write-Host "Updates found: " $Updates.Count

If(Get-WUIsPendingReboot) {
    Write-Host "Reboot pending. Rerun after reboot."
    Write-Host "Rebooting..."
    Restart-Computer
} else {
    Install-WUUpdates -Updates $Updates
    If(Get-WUIsPendingReboot) {
        Restart-Computer
    }
}