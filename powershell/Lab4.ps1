
Write-Host "Hardware Description:" -ForegroundColor Green 
Get-WmiObject win32_computersystem | Select-Object Manufacturer,Model,Name,PrimaryOwnerName,@{Name="PhysicalMemory(GB)";Expression={$_.TotalPhysicalMemory/1gb -as [int]}} | fl

Write-Host "Operating System Description:" -ForeGroundColor Green
get-wmiobject win32_operatingsystem | fl Name,Version, RegisteredUser, BuildNumber

$RAM = Get-WmiObject -class "win32_physicalmemory" 
Write-Host "RAM Information" -ForeGroundColor Green
$RAM | Format-Table Name,Description,BankLabel,@{Name="Size(GB)";Expression={$_.Capacity/1GB}}, @{Name="Vendor";Expression={$_.Manufacturer}}, Speed -AutoSize



Write-Host "Total RAM:" -ForegroundColor Cyan
$RAM.Capacity
Write-Host "
"



Write-Host "Disk-Drive Information" -ForegroundColor Green 
$drives = Get-WmiObject -class "win32_logicaldisk"
$answer=foreach ($drive in $drives){
$usage = $drive.Size - $drive.FreeSpace
$per = $drive.FreeSpace/$drive.Size * 100
new-object -typename psobject -property @{

Name=$drive.DeviceId
SizeInGB=$drive.Size/1GB -as [int]
FreeSpaceInGB=$drive.FreeSpace/1GB -as [int]

SpageUsageInGB = $usage/1GB -as [int]
FreeSpaceInPercantage = $per -as [int]
Vendor=$drive.Manufacturer


}
}
$answer|ft

Write-Host "Video-Card Description" -ForeGroundColor Green
$videos = get-wmiobject win32_videocontroller
$final = foreach ($video in $videos){
$hor = $video.currenthorizontalresolution
$ver = $video.currentverticalresolution


new-object -typename psobject -property @{

Vendor=$video.Videoprocessor
Description=$video.Description
Resolution = "$hor * $ver"

}
}

$final | fl

Write-Host "Processor Information" -ForeGroundColor Green
(Get-WmiObject -Class Win32_Processor | Select-Object Name, NumberOfCores, MaxClockSpeed,@{Name="L2CacheSize(KB)";Expression={$_.L2CacheSize/1KB -as [int]}},@{Name="L3CacheSize(KB)";Expression={$_.L3CacheSize/1KB -as [int]}},@{Name="L1CacheSize(KB)";Expression={$_.L1CacheSize/1KB -as [int]}}).psobject.Properties | 
Where-Object {$_.Value -ne $null } |  select-object @{Name="Processor-Info";Expression={$_.Name}},Value| ft

