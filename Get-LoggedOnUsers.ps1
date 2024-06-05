$UserProfiles = Get-WmiObject -Query "SELECT * FROM Win32_UserProfile  WHERE Special != TRUE AND Loaded = TRUE"
foreach ($Profile in $UserProfiles)
    {
    $UserID = $Profile.LocalPath.Split('\') | Select-Object -Last 1
    $LoginTable = [ordered]@{'LoginID'=$UserID}
    $LoginID = New-Object -TypeName PSObject -Property $LoginTable
    Write-Output -InputObject $LoginID
    }
