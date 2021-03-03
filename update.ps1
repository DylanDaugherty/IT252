$publicIp="137.135.24.31"
ssh whyzerd@$publicIp 'sudo rm -r /var/www/html'
Start-Sleep -Seconds 30

scp -r D:\school\IT253\script\html whyzerd@${publicIp}:/var/www/
Start-Sleep -Seconds 300
ssh whyzerd@$publicip 'sudo systemctl restart apache2'
echo "Job's Done. Update Domain Forward Now."