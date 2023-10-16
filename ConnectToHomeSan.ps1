$driveLetter = "Z:"
$networkPath = "\\192.168.55.250\homevtshare"
$userId = "myadmin"
$password = ""

# Test if drive is accessible
if (-not (Test-Path $driveLetter)) {
    Write-Output "Drive $driveLetter is not accessible. Attempting to reconnect..."

    # Attempt to disconnect the drive
    net use $driveLetter /delete /y

    # Wait for a few seconds
    Start-Sleep -Seconds 2

    # Attempt to reconnect the drive with credentials
    net use $driveLetter $networkPath /user:$userId $password

    # Wait for a few seconds
    Start-Sleep -Seconds 2

    # Test again
    if (-not (Test-Path $driveLetter)) {
        Write-Output "Failed to reconnect drive $driveLetter."
    } else {
        Write-Output "Drive $driveLetter reconnected successfully."
    }
} else {
    Write-Output "Drive $driveLetter is accessible."
}
