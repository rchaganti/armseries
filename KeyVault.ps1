#Connec to Azure subscription
Login-AzureRmAccount

#Create new resource group
New-AzureRmResourceGroup -Name 'KeyValutDemo' -Location 'East Asia' -Verbose

#Create a new Key Vault
New-AzureRmKeyVault -VaultName 'kvDemo' -ResourceGroupName 'KeyValutDemo' -Location 'East Asia' -Verbose

#Add a key to the vault
$key = Add-AzureKeyVaultKey -VaultName 'kvDemo' -Name 'myFirstKVKey' -Destination 'Software'

#Key URI
$key.Key.Kid

#Add Secret
$secret = Read-Host -AsSecureString
$kvSecret = Set-AzureKeyVaultSecret -VaultName 'kvDemo' -Name 'myPassword' -SecretValue $secret

