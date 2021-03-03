$seed = get-random -maximum 100
$groupName = "Fresh-$seed"
$servName = "Linux-Web-OSO-$seed"
$secureName = "Secure-$seed"
$servLocation = "West US"
$servPort = 80, 22
$servSize = "Standard_b1s"
$servImage = "UbuntuLTS"

$servInfo = New-AzVm -ResourceGroupName $groupName -Name $servName -Location $servLocation -SecurityGroupName $secureName -OpenPorts 80, 22 -size $servSize -Image $servImage

Start-Sleep -Seconds 30

$publicIp = Get-AzPublicIpAddress -ResourceGroupName $groupName -name $servName | Select-Object "IpAddress"
$publicIp = $publicIp.IpAddress

ssh whyzerd@$publicIp 'sudo apt update && sudo apt -y install apache2'
Start-Sleep -Seconds 120
ssh whyzerd@$publicIp 'sudo rm -r /var/www/html'

scp -r D:\school\IT253\script\html whyzerd@${publicIp}:/var/www/
Start-Sleep -Seconds 120
ssh whyzerd@$publicip 'sudo systemctl restart apache2'
