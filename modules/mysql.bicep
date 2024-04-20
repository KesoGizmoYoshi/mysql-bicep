targetScope = 'resourceGroup'

param name string
param location string
param administratorLogin string
@secure()
param administratorLoginPassword string

resource mysql 'Microsoft.DBforMySQL/flexibleServers@2023-12-01-preview' = {
  name: 'mysql-${name}'
  location: location
  sku: {
    name: 'Standard_B1ms'
    tier: 'Burstable'
  }
  properties: {
    administratorLogin: administratorLogin
    administratorLoginPassword: administratorLoginPassword
    createMode: 'Default'
    storage: {
      storageSizeGB: 20
      iops: 360
      autoGrow: 'Enabled'
    }
    version: '8.0.21'
    availabilityZone: '2'
    replicationRole: 'None'
    network: {
      publicNetworkAccess: 'Enabled'
    }
    backup: {
      backupRetentionDays: 7
      geoRedundantBackup: 'Disabled'
    }
      highAvailability: {
        mode: 'Disabled'
        standbyAvailabilityZone: ''
    }
  }
}
