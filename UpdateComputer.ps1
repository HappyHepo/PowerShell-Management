param(
    [Parameter(Mandatory=$true,Position=0)]
    [String]$ComputerName
)

Invoke-Command -FilePath ".\UpdateAndRestart.ps1" -ComputerName $ComputerName
While(!(Test-Connection -Count 1 -ComputerName $ComputerName -Quiet)) {
    Write-Host "Waiting for host to come back up..."
    Start-Sleep 5
}