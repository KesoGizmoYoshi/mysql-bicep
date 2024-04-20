targetScope = 'subscription'

@description('Name of the project')
param name string

@description('Server region location')
param location string

@description('Database administrator login name')
@minLength(1)
param administratorLogin string

@description('Database administrator password')
@minLength(8)
@maxLength(128)
@secure()
param administratorLoginPassword string

resource rg 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: 'rg-${name}'
  location: location
}

module mysql 'modules/mysql.bicep' = {
  scope: rg
  name: 'mysql'
  params: {
    name: name
    location: location
    administratorLogin: administratorLogin
    administratorLoginPassword: administratorLoginPassword
  }
}


