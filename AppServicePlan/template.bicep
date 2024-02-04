param serverfarms_ASP_001_name string = 'ASP-001'
param API_location string = 'japaneast'

resource serverfarms_ASP_001_name_resource 'Microsoft.Web/serverfarms@2023-01-01' = {
  name: serverfarms_ASP_001_name
  location: API_location
  tags: {
    cost: 'assistantai'
  }
  sku: {
    name: 'P3v3'
    tier: 'PremiumV3'
    size: 'P3v3'
    family: 'Pv3'
    capacity: 1
  }
  kind: 'linux'
  properties: {
    perSiteScaling: false
    elasticScaleEnabled: false
    maximumElasticWorkerCount: 1
    isSpot: false
    reserved: true
    isXenon: false
    hyperV: false
    targetWorkerCount: 0
    targetWorkerSizeId: 0
    zoneRedundant: false
  }
}
