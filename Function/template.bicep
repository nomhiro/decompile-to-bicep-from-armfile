param sites_func_001_name string = 'func-001'
param serverfarms_ASP_func_externalid string = '/subscriptions/8de42282-72ff-4d35-b380-ccfbf9e8f3fd/resourceGroups/rg-assistantai-dev-eastus/providers/Microsoft.Web/serverfarms/ASP-001'
param func_location string = 'japaneast'

resource sites_func_001_name_resource 'Microsoft.Web/sites@2023-01-01' = {
  name: sites_func_001_name
  location: func_location
  tags: {
    cost: 'assistantai'
    'hidden-link: /app-insights-resource-id': '/subscriptions/8de42282-72ff-4d35-b380-ccfbf9e8f3fd/resourceGroups/rg-assistantai-dev-eastus/providers/microsoft.insights/components/func-assistantai-dev-01'
    'hidden-link: /app-insights-instrumentation-key': '03cc8f0e-499f-4676-ac0a-58af797c9e39'
    'hidden-link: /app-insights-conn-string': 'InstrumentationKey=03cc8f0e-499f-4676-ac0a-58af797c9e39;IngestionEndpoint=https://eastus-8.in.applicationinsights.azure.com/;LiveEndpoint=https://eastus.livediagnostics.monitor.azure.com/'
  }
  kind: 'functionapp,linux'
  properties: {
    enabled: true
    hostNameSslStates: [
      {
        name: '${sites_func_001_name}.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
      {
        name: '${sites_func_001_name}.scm.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Repository'
      }
    ]
    serverFarmId: serverfarms_ASP_func_externalid
    reserved: true
    isXenon: false
    hyperV: false
    vnetRouteAllEnabled: false
    vnetImagePullEnabled: false
    vnetContentShareEnabled: false
    siteConfig: {
      numberOfWorkers: 1
      linuxFxVersion: 'PYTHON|3.10'
      acrUseManagedIdentityCreds: false
      alwaysOn: true
      http20Enabled: false
      functionAppScaleLimit: 0
      minimumElasticInstanceCount: 0
    }
    scmSiteAlsoStopped: false
    clientAffinityEnabled: false
    clientCertEnabled: false
    clientCertMode: 'Required'
    hostNamesDisabled: false
    customDomainVerificationId: '6577131C27CD16A213D39EC5E4A2573F242595330E6F4FB08D64B3A8772F65A4'
    containerSize: 1536
    dailyMemoryTimeQuota: 0
    httpsOnly: true
    redundancyMode: 'None'
    publicNetworkAccess: 'Enabled'
    storageAccountRequired: false
    keyVaultReferenceIdentity: 'SystemAssigned'
  }
}

resource sites_func_001_name_ftp 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2023-01-01' = {
  parent: sites_func_001_name_resource
  name: 'ftp'
  properties: {
    allow: true
  }
}

resource sites_func_001_name_scm 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2023-01-01' = {
  parent: sites_func_001_name_resource
  name: 'scm'
  properties: {
    allow: true
  }
}

resource sites_func_001_name_web 'Microsoft.Web/sites/config@2023-01-01' = {
  parent: sites_func_001_name_resource
  name: 'web'
  properties: {
    numberOfWorkers: 1
    defaultDocuments: [
      'Default.htm'
      'Default.html'
      'Default.asp'
      'index.htm'
      'index.html'
      'iisstart.htm'
      'default.aspx'
      'index.php'
    ]
    netFrameworkVersion: 'v4.0'
    linuxFxVersion: 'PYTHON|3.10'
    requestTracingEnabled: false
    remoteDebuggingEnabled: false
    remoteDebuggingVersion: 'VS2019'
    httpLoggingEnabled: false
    acrUseManagedIdentityCreds: false
    logsDirectorySizeLimit: 35
    detailedErrorLoggingEnabled: false
    publishingUsername: '$func-001'
    scmType: 'None'
    use32BitWorkerProcess: false
    webSocketsEnabled: false
    alwaysOn: true
    managedPipelineMode: 'Integrated'
    virtualApplications: [
      {
        virtualPath: '/'
        physicalPath: 'site\\wwwroot'
        preloadEnabled: true
      }
    ]
    loadBalancing: 'LeastRequests'
    experiments: {
      rampUpRules: []
    }
    autoHealEnabled: false
    vnetRouteAllEnabled: false
    vnetPrivatePortsCount: 0
    publicNetworkAccess: 'Enabled'
    cors: {
      allowedOrigins: [
        'https://portal.azure.com'
      ]
      supportCredentials: false
    }
    localMySqlEnabled: false
    ipSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 2147483647
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 2147483647
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictionsUseMain: false
    http20Enabled: false
    minTlsVersion: '1.2'
    scmMinTlsVersion: '1.2'
    ftpsState: 'FtpsOnly'
    preWarmedInstanceCount: 0
    functionAppScaleLimit: 0
    functionsRuntimeScaleMonitoringEnabled: false
    minimumElasticInstanceCount: 0
    azureStorageAccounts: {}
  }
}

resource sites_func_001_name_05cf8410_7697_420a_895b_460fbde5d7f8 'Microsoft.Web/sites/deployments@2023-01-01' = {
  parent: sites_func_001_name_resource
  name: '05cf8410-7697-420a-895b-460fbde5d7f8'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'ms-azuretools-vscode'
    deployer: 'ms-azuretools-vscode'
    message: 'Created via a push deployment'
    start_time: '2024-01-31T12:10:04.3612217Z'
    end_time: '2024-01-31T12:14:28.4116151Z'
    active: false
  }
}

resource sites_func_001_name_1cb2f3ec_fc24_4125_ae59_6ed0213aeba3 'Microsoft.Web/sites/deployments@2023-01-01' = {
  parent: sites_func_001_name_resource
  name: '1cb2f3ec-fc24-4125-ae59-6ed0213aeba3'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'ms-azuretools-vscode'
    deployer: 'ms-azuretools-vscode'
    message: 'Created via a push deployment'
    start_time: '2024-01-31T10:48:41.6847582Z'
    end_time: '2024-01-31T10:53:02.3036089Z'
    active: false
  }
}

resource sites_func_001_name_3be8d8e5_0587_4caa_9894_0d4a46efb218 'Microsoft.Web/sites/deployments@2023-01-01' = {
  parent: sites_func_001_name_resource
  name: '3be8d8e5-0587-4caa-9894-0d4a46efb218'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'ms-azuretools-vscode'
    deployer: 'ms-azuretools-vscode'
    message: 'Created via a push deployment'
    start_time: '2024-01-31T11:43:47.4741619Z'
    end_time: '2024-01-31T11:48:08.6930502Z'
    active: false
  }
}

resource sites_func_001_name_74b3ffb0_8a15_4914_90ad_79f033c2ca65 'Microsoft.Web/sites/deployments@2023-01-01' = {
  parent: sites_func_001_name_resource
  name: '74b3ffb0-8a15-4914-90ad-79f033c2ca65'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'ms-azuretools-vscode'
    deployer: 'ms-azuretools-vscode'
    message: 'Created via a push deployment'
    start_time: '2024-01-31T11:00:47.2152081Z'
    end_time: '2024-01-31T11:05:25.8948263Z'
    active: false
  }
}

resource sites_func_001_name_8347a7a0_2f33_4018_88a4_9aab9a004d6c 'Microsoft.Web/sites/deployments@2023-01-01' = {
  parent: sites_func_001_name_resource
  name: '8347a7a0-2f33-4018-88a4-9aab9a004d6c'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'ms-azuretools-vscode'
    deployer: 'ms-azuretools-vscode'
    message: 'Created via a push deployment'
    start_time: '2024-02-02T05:01:21.8709822Z'
    end_time: '2024-02-02T05:06:06.8028105Z'
    active: true
  }
}

resource sites_func_001_name_9a8cbce9_f121_43c2_8b1d_62adea55618e 'Microsoft.Web/sites/deployments@2023-01-01' = {
  parent: sites_func_001_name_resource
  name: '9a8cbce9-f121-43c2-8b1d-62adea55618e'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'ms-azuretools-vscode'
    deployer: 'ms-azuretools-vscode'
    message: 'Created via a push deployment'
    start_time: '2024-01-31T12:29:33.9414928Z'
    end_time: '2024-01-31T12:34:13.0825307Z'
    active: false
  }
}

resource sites_func_001_name_9efa3da0_5542_40b5_85ec_00cbc24f9246 'Microsoft.Web/sites/deployments@2023-01-01' = {
  parent: sites_func_001_name_resource
  name: '9efa3da0-5542-40b5-85ec-00cbc24f9246'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'ms-azuretools-vscode'
    deployer: 'ms-azuretools-vscode'
    message: 'Created via a push deployment'
    start_time: '2024-01-31T12:54:02.7225856Z'
    end_time: '2024-01-31T12:59:07.5105468Z'
    active: false
  }
}

resource sites_func_001_name_ebc3954b_e8a8_4fdf_a75f_09052394a1dd 'Microsoft.Web/sites/deployments@2023-01-01' = {
  parent: sites_func_001_name_resource
  name: 'ebc3954b-e8a8-4fdf-a75f-09052394a1dd'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'ms-azuretools-vscode'
    deployer: 'ms-azuretools-vscode'
    message: 'Created via a push deployment'
    start_time: '2024-01-31T12:17:02.8271028Z'
    end_time: '2024-01-31T12:21:30.3169648Z'
    active: false
  }
}

resource sites_func_001_name_f7f5f269_a704_4262_a499_16041954ab65 'Microsoft.Web/sites/deployments@2023-01-01' = {
  parent: sites_func_001_name_resource
  name: 'f7f5f269-a704-4262-a499-16041954ab65'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'ms-azuretools-vscode'
    deployer: 'ms-azuretools-vscode'
    message: 'Created via a push deployment'
    start_time: '2024-01-31T11:23:23.1360973Z'
    end_time: '2024-01-31T11:27:57.5432255Z'
    active: false
  }
}

resource sites_func_001_name_fa1d0634_3ded_4ff0_aea1_d8fb86f67899 'Microsoft.Web/sites/deployments@2023-01-01' = {
  parent: sites_func_001_name_resource
  name: 'fa1d0634-3ded-4ff0-aea1-d8fb86f67899'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'ms-azuretools-vscode'
    deployer: 'ms-azuretools-vscode'
    message: 'Created via a push deployment'
    start_time: '2024-02-02T04:33:32.8776333Z'
    end_time: '2024-02-02T04:38:54.3082668Z'
    active: false
  }
}

resource sites_func_001_name_api_inference 'Microsoft.Web/sites/functions@2023-01-01' = {
  parent: sites_func_001_name_resource
  name: 'api_inference'
  properties: {
    script_href: 'https://func-001.azurewebsites.net/admin/vfs/home/site/wwwroot/function_app.py'
    test_data_href: 'https://func-001.azurewebsites.net/admin/vfs/home/data/Functions/sampledata/api_inference.dat'
    href: 'https://func-001.azurewebsites.net/admin/functions/api_inference'
    config: {}
    invoke_url_template: 'https://func-001.azurewebsites.net/api/api_inference'
    language: 'python'
    isDisabled: false
  }
}

resource sites_func_001_name_api_log_search 'Microsoft.Web/sites/functions@2023-01-01' = {
  parent: sites_func_001_name_resource
  name: 'api_log_search'
  properties: {
    script_href: 'https://func-001.azurewebsites.net/admin/vfs/home/site/wwwroot/function_app.py'
    test_data_href: 'https://func-001.azurewebsites.net/admin/vfs/home/data/Functions/sampledata/api_log_search.dat'
    href: 'https://func-001.azurewebsites.net/admin/functions/api_log_search'
    config: {}
    invoke_url_template: 'https://func-001.azurewebsites.net/api/api_log_search'
    language: 'python'
    isDisabled: false
  }
}

resource sites_func_001_name_api_regulation 'Microsoft.Web/sites/functions@2023-01-01' = {
  parent: sites_func_001_name_resource
  name: 'api_regulation'
  properties: {
    script_href: 'https://func-001.azurewebsites.net/admin/vfs/home/site/wwwroot/function_app.py'
    test_data_href: 'https://func-001.azurewebsites.net/admin/vfs/home/data/Functions/sampledata/api_regulation.dat'
    href: 'https://func-001.azurewebsites.net/admin/functions/api_regulation'
    config: {}
    invoke_url_template: 'https://func-001.azurewebsites.net/api/api_regulation'
    language: 'python'
    isDisabled: false
  }
}

resource sites_func_001_name_api_vector_and_openai 'Microsoft.Web/sites/functions@2023-01-01' = {
  parent: sites_func_001_name_resource
  name: 'api_vector_and_openai'
  properties: {
    script_href: 'https://func-001.azurewebsites.net/admin/vfs/home/site/wwwroot/function_app.py'
    test_data_href: 'https://func-001.azurewebsites.net/admin/vfs/home/data/Functions/sampledata/api_vector_and_openai.dat'
    href: 'https://func-001.azurewebsites.net/admin/functions/api_vector_and_openai'
    config: {}
    invoke_url_template: 'https://func-001.azurewebsites.net/api/api_vector_and_openai'
    language: 'python'
    isDisabled: false
  }
}

resource sites_func_001_name_registerTerm 'Microsoft.Web/sites/functions@2023-01-01' = {
  parent: sites_func_001_name_resource
  name: 'registerTerm'
  properties: {
    script_href: 'https://func-001.azurewebsites.net/admin/vfs/home/site/wwwroot/function_app.py'
    test_data_href: 'https://func-001.azurewebsites.net/admin/vfs/home/data/Functions/sampledata/registerTerm.dat'
    href: 'https://func-001.azurewebsites.net/admin/functions/registerTerm'
    config: {}
    invoke_url_template: 'https://func-001.azurewebsites.net/api/registerterm'
    language: 'python'
    isDisabled: false
  }
}

resource sites_func_001_name_searchGlossary 'Microsoft.Web/sites/functions@2023-01-01' = {
  parent: sites_func_001_name_resource
  name: 'searchGlossary'
  properties: {
    script_href: 'https://func-001.azurewebsites.net/admin/vfs/home/site/wwwroot/function_app.py'
    test_data_href: 'https://func-001.azurewebsites.net/admin/vfs/home/data/Functions/sampledata/searchGlossary.dat'
    href: 'https://func-001.azurewebsites.net/admin/functions/searchGlossary'
    config: {}
    invoke_url_template: 'https://func-001.azurewebsites.net/api/api_searchglossary'
    language: 'python'
    isDisabled: false
  }
}

resource sites_func_001_name_sendFeedback 'Microsoft.Web/sites/functions@2023-01-01' = {
  parent: sites_func_001_name_resource
  name: 'sendFeedback'
  properties: {
    script_href: 'https://func-001.azurewebsites.net/admin/vfs/home/site/wwwroot/function_app.py'
    test_data_href: 'https://func-001.azurewebsites.net/admin/vfs/home/data/Functions/sampledata/sendFeedback.dat'
    href: 'https://func-001.azurewebsites.net/admin/functions/sendFeedback'
    config: {}
    invoke_url_template: 'https://func-001.azurewebsites.net/api/sendfeedback'
    language: 'python'
    isDisabled: false
  }
}

resource sites_func_001_name_showUserMessage 'Microsoft.Web/sites/functions@2023-01-01' = {
  parent: sites_func_001_name_resource
  name: 'showUserMessage'
  properties: {
    script_href: 'https://func-001.azurewebsites.net/admin/vfs/home/site/wwwroot/function_app.py'
    test_data_href: 'https://func-001.azurewebsites.net/admin/vfs/home/data/Functions/sampledata/showUserMessage.dat'
    href: 'https://func-001.azurewebsites.net/admin/functions/showUserMessage'
    config: {}
    invoke_url_template: 'https://func-001.azurewebsites.net/api/getusermessage'
    language: 'python'
    isDisabled: false
  }
}

resource sites_func_001_name_sites_func_001_name_azurewebsites_net 'Microsoft.Web/sites/hostNameBindings@2023-01-01' = {
  parent: sites_func_001_name_resource
  name: '${sites_func_001_name}.azurewebsites.net'
  properties: {
    siteName: 'func-001'
    hostNameType: 'Verified'
  }
}
