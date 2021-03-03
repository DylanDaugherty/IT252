$seed = get-random -maximum 100
$groupName = "Ground-$seed"
$servName = "Linux-$seed"
$secureName = "Secure-$seed"
$servLocation = "West US"
$servPort = "80,22"
$servSize = "Standard_b1s"
$servImage = "18.04-LTS"
$servUser = "Whyzerd"
$servPassword = ConvertTo-SecureString "Password" -AsPlainText -Force

New-Object System.Management.Automation.PSCredential ($ServUser, $servPassword);


$servInfo = New-AzVm -username "LocalAdmin" -password "password" -ResourceGroupName $groupName -Name $servName -Location $servLocation -SecurityGroupName $secureName -OpenPorts $servPort -size $servSize -Image $servImage 
set-set-AzNetworkInterfaceIpConfig  -Name $IpConfigName1 -Subnet $SubnetName -PrivateIpAddress 10.0.0.4 -Primary
Start-SLeep -seconds 5000

ssh localadminuser@10.0.0.4 'sudo apt update && sudo apt install apache2'