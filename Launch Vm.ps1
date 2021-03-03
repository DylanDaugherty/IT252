$seed = get-random -maximum 100
$groupName = "Ground-$seed"
$servName = "Linux-$seed"
$secureName = "Secure-$seed"
$servLocation = "West US"
$servPort = 80, 22
$servSize = "Standard_b1s"
$servImage = "UbuntuLTS"

$servInfo = New-AzVm -ResourceGroupName $groupName -Name $servName -Location $servLocation -SecurityGroupName $secureName -OpenPorts 80, 22 -size $servSize -Image $servImage 

Start-SLeep -seconds 500

$publicIp = Get-AzPublicIpAddress -ResourceGroupName $groupName -name $servName | Select-Object "IpAddress"
echo "$groupname"
echo "$publicIp"


ssh whyzerd@$publicIp 'sudo apt update && sudo apt install apache2'