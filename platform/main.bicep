@secure()
param extensions_enablevmaccess_username string

@secure()
param extensions_enablevmaccess_password string

@secure()
param extensions_enablevmaccess_ssh_key string

@secure()
param extensions_enablevmaccess_reset_ssh string

@secure()
param extensions_enablevmaccess_remove_user string

@secure()
param extensions_enablevmaccess_expiration string
param connections_arm_name string = 'arm'
param connections_outlook_name string = 'outlook'
param connections_keyvault_name string = 'keyvault'
param connections_azureblob_name string = 'azureblob'
param connections_keyvault_1_name string = 'keyvault-1'
param virtualMachines_vm_tre_jumpbox_name string = 'vm-tre-jumpbox'
param vaults_kv_tre_platform_uksouth_name string = 'kv-tre-platform-uksouth'
param workflows_la_tre_deploy_execution_name string = 'la-tre-deploy-execution'
param sshPublicKeys_vm_tre_jumpbox_key_name string = 'vm-tre-jumpbox_key'
param storageAccounts_stretrequestsuks_name string = 'stretrequestsuks'
param bastionHosts_bas_tre_admin_ukwest_name string = 'bas-tre-admin-ukwest'
param networkInterfaces_nic_tre_jumpbox_name string = 'nic-tre-jumpbox'
param serverfarms_ASP_rgtremgmtuksouth_8e1a_name string = 'ASP-rgtremgmtuksouth-8e1a'
param networkInterfaces_vm_tre_jumpbox725_name string = 'vm-tre-jumpbox725'
param publicIPAddresses_vm_tre_jumpbox_ip_name string = 'vm-tre-jumpbox-ip'
param workflows_la_tre_request_intake_uksouth_name string = 'la-tre-request-intake-uksouth'
param networkSecurityGroups_nsg_tre_jumpbox_name string = 'nsg-tre-jumpbox'
param virtualNetworks_vnet_tre_admin_ukwest_name string = 'vnet-tre-admin-ukwest'
param networkSecurityGroups_vm_tre_jumpbox_nsg_name string = 'vm-tre-jumpbox-nsg'
param publicIPAddresses_pip_tre_bastion_ukwest_name string = 'pip-tre-bastion-ukwest'
param userAssignedIdentities_mi_tre_execution_name string = 'mi-tre-execution'
param templateSpecs_tre_standard_research_workspace_name string = 'tre-standard-research-workspace'
param actionGroups_Application_Insights_Smart_Detection_name string = 'Application Insights Smart Detection'
param virtualNetworks_vnet_tre_uksouth_externalid string = '/subscriptions/4d38ea20-7a50-4815-9c82-527d9f182f8b/resourceGroups/rg-tre-network-uksouth/providers/Microsoft.Network/virtualNetworks/vnet-tre-uksouth'
param templateSpecs_tre_workspace_template_externalid string = '/subscriptions/4d38ea20-7a50-4815-9c82-527d9f182f8b/resourceGroups/rg-tre-mgmt-uksouth/providers/Microsoft.Resources/templateSpecs/tre-workspace-template'
param virtualNetworks_vnet_tre_hub_uksouth_externalid string = '/subscriptions/4d38ea20-7a50-4815-9c82-527d9f182f8b/resourceGroups/rg-tre-net-uksouth/providers/Microsoft.Network/virtualNetworks/vnet-tre-hub-uksouth'
param privateDnsZones_privatelink_blob_core_windows_net_externalid string = '/subscriptions/4d38ea20-7a50-4815-9c82-527d9f182f8b/resourceGroups/rg-tre-net-uksouth/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net'
param privateDnsZones_privatelink_vaultcore_azure_net_externalid string = '/subscriptions/4d38ea20-7a50-4815-9c82-527d9f182f8b/resourceGroups/rg-tre-net-uksouth/providers/Microsoft.Network/privateDnsZones/privatelink.vaultcore.azure.net'

resource sshPublicKeys_vm_tre_jumpbox_key_name_resource 'Microsoft.Compute/sshPublicKeys@2024-11-01' = {
  name: sshPublicKeys_vm_tre_jumpbox_key_name
  location: 'ukwest'
  tags: {
    Owner: 'Yassin'
    CostCentre: 'TRE'
    System: 'TRE'
    Environment: 'research'
    DataClassification: 'restricted'
  }
  properties: {
    publicKey: 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCtCqp+HouOflMS8YUIytqdmF/yG71f50o8ria6+vybYGRW73bsAL8Fp9OEIZgcea+WFH8z4vhFgcScg57eCfpVtVdkRp/OqrSxYDh8ZIHlncuqb3uAhLJQO0PR3dECplQASuSb4uec5HTZ7nt58+0RSWNWIKXIf7LjSxD1JXXYO0hDBiPSnugjXRMnkfWrDZF8nrmTmqZ5/w/i/45JntAVOyZDq8VHwFk9ATV+56thVgAIVVWFA9L2Q1JzU2p9VpOxeNxq6l9L4mufOptwwMEQNWYAlmzqSsezrpBWt6VcJLUxUqpPyR70AHungNd40IDleW8A7FiPc0xyMXfuv/qj0uGJoegXxe+989IWuTUhJqRa4RPGzrqrY5BKquz2kkSwctuQulQIKZLlLNiNHZqIcZODHEz3ctwlTNt51NpEMj8691BBpePsoibiasu6VozpWyTapwBFNv5xha2a/NiQI7nhR5iGkfi5YXYPgPpSsqEqQ2wv5WApnJZKpsJ72I0= generated-by-azure'
  }
}

resource actionGroups_Application_Insights_Smart_Detection_name_resource 'microsoft.insights/actionGroups@2024-10-01-preview' = {
  name: actionGroups_Application_Insights_Smart_Detection_name
  location: 'Global'
  tags: {
    CostCentre: 'TRE'
    System: 'TRE'
    Environment: 'research'
    DataClassification: 'restricted'
    Owner: 'Yassin'
  }
  properties: {
    groupShortName: 'SmartDetect'
    enabled: true
    emailReceivers: []
    smsReceivers: []
    webhookReceivers: []
    eventHubReceivers: []
    itsmReceivers: []
    azureAppPushReceivers: []
    automationRunbookReceivers: []
    voiceReceivers: []
    logicAppReceivers: []
    azureFunctionReceivers: []
    armRoleReceivers: [
      {
        name: 'Monitoring Contributor'
        roleId: '749f88d5-cbae-40b8-bcfc-e573ddc772fa'
        useCommonAlertSchema: true
      }
      {
        name: 'Monitoring Reader'
        roleId: '43d0d8ad-25c7-4714-9337-8ba259a9fe05'
        useCommonAlertSchema: true
      }
    ]
  }
}

resource vaults_kv_tre_platform_uksouth_name_resource 'Microsoft.KeyVault/vaults@2024-12-01-preview' = {
  name: vaults_kv_tre_platform_uksouth_name
  location: 'uksouth'
  tags: {
    Owner: 'Yassin'
    CostCentre: 'TRE'
    System: 'TRE'
    Environment: 'research'
    DataClassification: 'restricted'
  }
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: 'e26dddaa-9c83-4a37-84ed-5bb0f76e4009'
    accessPolicies: []
    enabledForDeployment: false
    enableSoftDelete: true
    softDeleteRetentionInDays: 90
    enableRbacAuthorization: true
    vaultUri: 'https://${vaults_kv_tre_platform_uksouth_name}.vault.azure.net/'
    provisioningState: 'Succeeded'
    publicNetworkAccess: 'Enabled'
  }
}

resource userAssignedIdentities_mi_tre_execution_name_resource 'Microsoft.ManagedIdentity/userAssignedIdentities@2025-01-31-preview' = {
  name: userAssignedIdentities_mi_tre_execution_name
  location: 'uksouth'
  tags: {
    Owner: 'Yassin'
    CostCentre: 'TRE'
    System: 'TRE'
    Environment: 'research'
    DataClassification: 'restricted'
  }
}

resource networkSecurityGroups_nsg_tre_jumpbox_name_resource 'Microsoft.Network/networkSecurityGroups@2024-07-01' = {
  name: networkSecurityGroups_nsg_tre_jumpbox_name
  location: 'uksouth'
  tags: {
    Owner: 'Yassin'
    CostCentre: 'TRE'
    System: 'TRE'
    Environment: 'research'
    DataClassification: 'restricted'
  }
  properties: {
    securityRules: [
      {
        name: 'Allow-SSH-From-Bastion'
        id: networkSecurityGroups_nsg_tre_jumpbox_name_Allow_SSH_From_Bastion.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '22'
          sourceAddressPrefix: '10.10.1.0/26'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 100
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
    ]
  }
}

resource networkSecurityGroups_vm_tre_jumpbox_nsg_name_resource 'Microsoft.Network/networkSecurityGroups@2024-07-01' = {
  name: networkSecurityGroups_vm_tre_jumpbox_nsg_name
  location: 'ukwest'
  tags: {
    Owner: 'Yassin'
    CostCentre: 'TRE'
    System: 'TRE'
    Environment: 'research'
    DataClassification: 'restricted'
  }
  properties: {
    securityRules: [
      {
        name: 'SSH'
        id: networkSecurityGroups_vm_tre_jumpbox_nsg_name_SSH.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '22'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 300
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
    ]
  }
}

resource publicIPAddresses_pip_tre_bastion_ukwest_name_resource 'Microsoft.Network/publicIPAddresses@2024-07-01' = {
  name: publicIPAddresses_pip_tre_bastion_ukwest_name
  location: 'ukwest'
  tags: {
    Owner: 'Yassin'
    CostCentre: 'TRE'
    System: 'TRE'
    Environment: 'research'
    DataClassification: 'restricted'
  }
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  properties: {
    ipAddress: '20.162.37.183'
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Static'
    idleTimeoutInMinutes: 4
    ipTags: []
    ddosSettings: {
      protectionMode: 'VirtualNetworkInherited'
    }
  }
}

resource publicIPAddresses_vm_tre_jumpbox_ip_name_resource 'Microsoft.Network/publicIPAddresses@2024-07-01' = {
  name: publicIPAddresses_vm_tre_jumpbox_ip_name
  location: 'ukwest'
  tags: {
    Owner: 'Yassin'
    CostCentre: 'TRE'
    System: 'TRE'
    Environment: 'research'
    DataClassification: 'restricted'
  }
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  properties: {
    ipAddress: '20.162.83.62'
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Static'
    idleTimeoutInMinutes: 4
    ipTags: []
    ddosSettings: {
      protectionMode: 'VirtualNetworkInherited'
    }
  }
}

resource virtualNetworks_vnet_tre_admin_ukwest_name_resource 'Microsoft.Network/virtualNetworks@2024-07-01' = {
  name: virtualNetworks_vnet_tre_admin_ukwest_name
  location: 'ukwest'
  tags: {
    Owner: 'Yassin'
    CostCentre: 'TRE'
    System: 'TRE'
    Environment: 'research'
    DataClassification: 'restricted'
  }
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
        '10.20.0.0/16'
      ]
    }
    privateEndpointVNetPolicies: 'Disabled'
    subnets: [
      {
        name: 'default'
        id: virtualNetworks_vnet_tre_admin_ukwest_name_default.id
        properties: {
          addressPrefix: '10.0.0.0/24'
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'snet-admin'
        id: virtualNetworks_vnet_tre_admin_ukwest_name_snet_admin.id
        properties: {
          addressPrefix: '10.20.0.0/24'
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'AzureBastionSubnet'
        id: virtualNetworks_vnet_tre_admin_ukwest_name_AzureBastionSubnet.id
        properties: {
          addressPrefix: '10.20.1.0/26'
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
    ]
    virtualNetworkPeerings: []
    enableDdosProtection: false
  }
}

resource templateSpecs_tre_standard_research_workspace_name_resource 'Microsoft.Resources/templateSpecs@2022-02-01' = {
  name: templateSpecs_tre_standard_research_workspace_name
  location: 'uksouth'
  tags: {
    Owner: 'Yassin'
    CostCentre: 'TRE'
    System: 'TRE'
    Environment: 'research'
    DataClassification: 'restricted'
  }
  properties: {
    description: 'Approved standard Trusted Research Environment workspace template.\nDeploys storage, key vault, private endpoints, and DNS integration using platform-governed parameters.\n'
  }
}

resource storageAccounts_stretrequestsuks_name_resource 'Microsoft.Storage/storageAccounts@2025-01-01' = {
  name: storageAccounts_stretrequestsuks_name
  location: 'uksouth'
  tags: {
    Owner: 'Yassin'
    CostCentre: 'TRE'
    System: 'TRE'
    Environment: 'research'
    DataClassification: 'restricted'
  }
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  kind: 'StorageV2'
  properties: {
    allowCrossTenantReplication: false
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: false
    networkAcls: {
      bypass: 'AzureServices'
      virtualNetworkRules: []
      ipRules: []
      defaultAction: 'Allow'
    }
    supportsHttpsTrafficOnly: true
    encryption: {
      services: {
        file: {
          keyType: 'Account'
          enabled: true
        }
        blob: {
          keyType: 'Account'
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
    accessTier: 'Hot'
  }
}

resource connections_arm_name_resource 'Microsoft.Web/connections@2016-06-01' = {
  name: connections_arm_name
  location: 'uksouth'
  tags: {
    CostCentre: 'TRE'
    System: 'TRE'
    Environment: 'research'
    DataClassification: 'restricted'
    Owner: 'Yassin'
  }
  kind: 'V1'
  properties: {
    displayName: 'new_conn_cbcf6'
    statuses: [
      {
        status: 'Ready'
      }
    ]
    customParameterValues: {}
    createdTime: '2025-12-27T00:35:17.183149Z'
    changedTime: '2026-01-01T19:43:29.6522861Z'
    api: {
      name: connections_arm_name
      displayName: 'Azure Resource Manager'
      description: 'Azure Resource Manager exposes the APIs to manage all of your Azure resources.'
      iconUri: 'https://conn-afd-prod-endpoint-bmc9bqahasf3grgk.b01.azurefd.net/v1.0.1751/1.0.1751.4207/${connections_arm_name}/icon.png'
      id: '/subscriptions/4d38ea20-7a50-4815-9c82-527d9f182f8b/providers/Microsoft.Web/locations/uksouth/managedApis/${connections_arm_name}'
      type: 'Microsoft.Web/locations/managedApis'
    }
    testLinks: []
  }
}

resource connections_azureblob_name_resource 'Microsoft.Web/connections@2016-06-01' = {
  name: connections_azureblob_name
  location: 'uksouth'
  tags: {
    CostCentre: 'TRE'
    System: 'TRE'
    Environment: 'research'
    DataClassification: 'restricted'
    Owner: 'Yassin'
  }
  kind: 'V1'
  properties: {
    displayName: 'new_conn_fba26'
    statuses: [
      {
        status: 'Ready'
      }
    ]
    customParameterValues: {}
    createdTime: '2025-12-26T22:27:15.3038721Z'
    changedTime: '2026-01-01T19:43:25.9526543Z'
    api: {
      name: connections_azureblob_name
      displayName: 'Azure Blob Storage'
      description: 'Microsoft Azure Storage provides a massively scalable, durable, and highly available storage for data on the cloud, and serves as the data storage solution for modern applications. Connect to Blob Storage to perform various operations such as create, update, get and delete on blobs in your Azure Storage account.'
      iconUri: 'https://conn-afd-prod-endpoint-bmc9bqahasf3grgk.b01.azurefd.net/releases/v1.0.1777/1.0.1777.4410/${connections_azureblob_name}/icon.png'
      brandColor: '#804998'
      id: '/subscriptions/4d38ea20-7a50-4815-9c82-527d9f182f8b/providers/Microsoft.Web/locations/uksouth/managedApis/${connections_azureblob_name}'
      type: 'Microsoft.Web/locations/managedApis'
    }
    testLinks: [
      {
        requestUri: 'https://management.azure.com:443/subscriptions/4d38ea20-7a50-4815-9c82-527d9f182f8b/resourceGroups/rg-tre-mgmt-uksouth/providers/Microsoft.Web/connections/${connections_azureblob_name}/extensions/proxy/testconnection?api-version=2016-06-01'
        method: 'get'
      }
    ]
  }
}

resource connections_keyvault_name_resource 'Microsoft.Web/connections@2016-06-01' = {
  name: connections_keyvault_name
  location: 'uksouth'
  tags: {
    CostCentre: 'TRE'
    System: 'TRE'
    Environment: 'research'
    DataClassification: 'restricted'
    Owner: 'Yassin'
  }
  kind: 'V1'
  properties: {
    displayName: 'new_conn_7eb95'
    statuses: [
      {
        status: 'Connected'
      }
    ]
    customParameterValues: {}
    createdTime: '2025-12-28T20:12:04.5407778Z'
    changedTime: '2026-01-01T23:32:56.8655417Z'
    api: {
      name: connections_keyvault_name
      displayName: 'Azure Key Vault'
      description: 'Azure Key Vault is a service to securely store and access secrets.'
      iconUri: 'https://conn-afd-prod-endpoint-bmc9bqahasf3grgk.b01.azurefd.net/v1.0.1773/1.0.1773.4385/${connections_keyvault_name}/icon.png'
      id: '/subscriptions/4d38ea20-7a50-4815-9c82-527d9f182f8b/providers/Microsoft.Web/locations/uksouth/managedApis/${connections_keyvault_name}'
      type: 'Microsoft.Web/locations/managedApis'
    }
    testLinks: []
  }
}

resource connections_keyvault_1_name_resource 'Microsoft.Web/connections@2016-06-01' = {
  name: connections_keyvault_1_name
  location: 'uksouth'
  tags: {
    CostCentre: 'TRE'
    System: 'TRE'
    Environment: 'research'
    DataClassification: 'restricted'
    Owner: 'Yassin'
  }
  kind: 'V1'
  properties: {
    displayName: 'new_conn_3777b'
    statuses: [
      {
        status: 'Ready'
      }
    ]
    customParameterValues: {}
    createdTime: '2025-12-28T20:17:19.2198129Z'
    changedTime: '2026-01-01T19:43:37.7708243Z'
    api: {
      name: 'keyvault'
      displayName: 'Azure Key Vault'
      description: 'Azure Key Vault is a service to securely store and access secrets.'
      iconUri: 'https://conn-afd-prod-endpoint-bmc9bqahasf3grgk.b01.azurefd.net/v1.0.1773/1.0.1773.4385/keyvault/icon.png'
      id: '/subscriptions/4d38ea20-7a50-4815-9c82-527d9f182f8b/providers/Microsoft.Web/locations/uksouth/managedApis/keyvault'
      type: 'Microsoft.Web/locations/managedApis'
    }
    testLinks: []
  }
}

resource connections_outlook_name_resource 'Microsoft.Web/connections@2016-06-01' = {
  name: connections_outlook_name
  location: 'uksouth'
  tags: {
    CostCentre: 'TRE'
    System: 'TRE'
    Environment: 'research'
    DataClassification: 'restricted'
    Owner: 'Yassin'
  }
  kind: 'V1'
  properties: {
    displayName: 'Outlook.com'
    statuses: [
      {
        status: 'Connected'
      }
    ]
    customParameterValues: {}
    nonSecretParameterValues: {}
    createdTime: '2025-12-25T21:35:35.9657092Z'
    changedTime: '2026-01-01T23:30:28.4748586Z'
    api: {
      name: connections_outlook_name
      displayName: 'Outlook.com'
      description: 'Outlook.com connector allows you to manage your mail, calendars, and contacts. You can perform various actions such as send mail, schedule meetings, add contacts, etc.'
      iconUri: 'https://conn-afd-prod-endpoint-bmc9bqahasf3grgk.b01.azurefd.net/releases/v1.0.1782/1.0.1782.4452/${connections_outlook_name}/icon.png'
      id: '/subscriptions/4d38ea20-7a50-4815-9c82-527d9f182f8b/providers/Microsoft.Web/locations/uksouth/managedApis/${connections_outlook_name}'
      type: 'Microsoft.Web/locations/managedApis'
    }
    testLinks: [
      {
        requestUri: 'https://management.azure.com:443/subscriptions/4d38ea20-7a50-4815-9c82-527d9f182f8b/resourceGroups/rg-tre-mgmt-uksouth/providers/Microsoft.Web/connections/${connections_outlook_name}/extensions/proxy/testconnection?api-version=2016-06-01'
        method: 'get'
      }
    ]
  }
}

resource serverfarms_ASP_rgtremgmtuksouth_8e1a_name_resource 'Microsoft.Web/serverfarms@2024-11-01' = {
  name: serverfarms_ASP_rgtremgmtuksouth_8e1a_name
  location: 'UK West'
  tags: {
    Owner: 'Yassin'
    CostCentre: 'TRE'
    System: 'TRE'
    Environment: 'research'
    DataClassification: 'restricted'
  }
  sku: {
    name: 'Y1'
    tier: 'Dynamic'
    size: 'Y1'
    family: 'Y'
    capacity: 0
  }
  kind: 'functionapp'
  properties: {
    perSiteScaling: false
    elasticScaleEnabled: false
    maximumElasticWorkerCount: 0
    isSpot: false
    reserved: true
    isXenon: false
    hyperV: false
    targetWorkerCount: 0
    targetWorkerSizeId: 0
    zoneRedundant: false
    asyncScalingEnabled: false
  }
}

resource virtualMachines_vm_tre_jumpbox_name_resource 'Microsoft.Compute/virtualMachines@2024-11-01' = {
  name: virtualMachines_vm_tre_jumpbox_name
  location: 'ukwest'
  tags: {
    Owner: 'Yassin'
    CostCentre: 'TRE'
    System: 'TRE'
    Environment: 'research'
    DataClassification: 'restricted'
  }
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_B2als_v2'
    }
    additionalCapabilities: {
      hibernationEnabled: false
    }
    storageProfile: {
      imageReference: {
        publisher: 'canonical'
        offer: 'ubuntu-24_04-lts'
        sku: 'server'
        version: 'latest'
      }
      osDisk: {
        osType: 'Linux'
        name: '${virtualMachines_vm_tre_jumpbox_name}_OsDisk_1_36639a06f23844859a0c68864b5e51a5'
        createOption: 'FromImage'
        caching: 'ReadWrite'
        managedDisk: {
          id: resourceId(
            'Microsoft.Compute/disks',
            '${virtualMachines_vm_tre_jumpbox_name}_OsDisk_1_36639a06f23844859a0c68864b5e51a5'
          )
        }
        deleteOption: 'Delete'
      }
      dataDisks: []
      diskControllerType: 'SCSI'
    }
    osProfile: {
      computerName: virtualMachines_vm_tre_jumpbox_name
      adminUsername: 'cluster-admin'
      linuxConfiguration: {
        disablePasswordAuthentication: true
        ssh: {
          publicKeys: [
            {
              path: '/home/cluster-admin/.ssh/authorized_keys'
              keyData: 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCtCqp+HouOflMS8YUIytqdmF/yG71f50o8ria6+vybYGRW73bsAL8Fp9OEIZgcea+WFH8z4vhFgcScg57eCfpVtVdkRp/OqrSxYDh8ZIHlncuqb3uAhLJQO0PR3dECplQASuSb4uec5HTZ7nt58+0RSWNWIKXIf7LjSxD1JXXYO0hDBiPSnugjXRMnkfWrDZF8nrmTmqZ5/w/i/45JntAVOyZDq8VHwFk9ATV+56thVgAIVVWFA9L2Q1JzU2p9VpOxeNxq6l9L4mufOptwwMEQNWYAlmzqSsezrpBWt6VcJLUxUqpPyR70AHungNd40IDleW8A7FiPc0xyMXfuv/qj0uGJoegXxe+989IWuTUhJqRa4RPGzrqrY5BKquz2kkSwctuQulQIKZLlLNiNHZqIcZODHEz3ctwlTNt51NpEMj8691BBpePsoibiasu6VozpWyTapwBFNv5xha2a/NiQI7nhR5iGkfi5YXYPgPpSsqEqQ2wv5WApnJZKpsJ72I0= generated-by-azure'
            }
          ]
        }
        provisionVMAgent: true
        patchSettings: {
          patchMode: 'ImageDefault'
          assessmentMode: 'ImageDefault'
        }
      }
      secrets: []
      allowExtensionOperations: true
      requireGuestProvisionSignal: true
    }
    securityProfile: {
      uefiSettings: {
        secureBootEnabled: true
        vTpmEnabled: true
      }
      securityType: 'TrustedLaunch'
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: networkInterfaces_vm_tre_jumpbox725_name_resource.id
          properties: {
            deleteOption: 'Detach'
          }
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
      }
    }
  }
}

resource virtualMachines_vm_tre_jumpbox_name_enablevmaccess 'Microsoft.Compute/virtualMachines/extensions@2024-11-01' = {
  parent: virtualMachines_vm_tre_jumpbox_name_resource
  name: 'enablevmaccess'
  location: 'ukwest'
  tags: {
    CostCentre: 'TRE'
    System: 'TRE'
    Environment: 'research'
    DataClassification: 'restricted'
    Owner: 'Yassin'
  }
  properties: {
    autoUpgradeMinorVersion: false
    publisher: 'Microsoft.OSTCExtensions'
    type: 'VMAccessForLinux'
    typeHandlerVersion: '1.5'
    settings: {}
    protectedSettings: {
      username: extensions_enablevmaccess_username
      password: extensions_enablevmaccess_password
      ssh_key: extensions_enablevmaccess_ssh_key
      reset_ssh: extensions_enablevmaccess_reset_ssh
      remove_user: extensions_enablevmaccess_remove_user
      expiration: extensions_enablevmaccess_expiration
    }
  }
}

resource vaults_kv_tre_platform_uksouth_name_kv_tre_platform_conn 'Microsoft.KeyVault/vaults/privateEndpointConnections@2024-12-01-preview' = {
  parent: vaults_kv_tre_platform_uksouth_name_resource
  name: 'kv-tre-platform-conn'
  location: 'uksouth'
  properties: {
    provisioningState: 'Succeeded'
    privateEndpoint: {}
    privateLinkServiceConnectionState: {
      status: 'Approved'
      actionsRequired: 'None'
    }
  }
}

resource vaults_kv_tre_platform_uksouth_name_github_token 'Microsoft.KeyVault/vaults/secrets@2024-12-01-preview' = {
  parent: vaults_kv_tre_platform_uksouth_name_resource
  name: 'github-token'
  location: 'uksouth'
  tags: {
    'file-encoding': 'utf-8'
  }
  properties: {
    attributes: {
      enabled: true
    }
  }
}

resource networkInterfaces_nic_tre_jumpbox_name_resource 'Microsoft.Network/networkInterfaces@2024-07-01' = {
  name: networkInterfaces_nic_tre_jumpbox_name
  location: 'uksouth'
  tags: {
    Owner: 'Yassin'
    CostCentre: 'TRE'
    System: 'TRE'
    Environment: 'research'
    DataClassification: 'restricted'
  }
  kind: 'Regular'
  properties: {
    ipConfigurations: [
      {
        name: 'Ipv4config'
        id: '${networkInterfaces_nic_tre_jumpbox_name_resource.id}/ipConfigurations/Ipv4config'
        type: 'Microsoft.Network/networkInterfaces/ipConfigurations'
        properties: {
          privateIPAddress: '10.10.0.4'
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: '${virtualNetworks_vnet_tre_hub_uksouth_externalid}/subnets/snet-mgmt'
          }
          primary: true
          privateIPAddressVersion: 'IPv4'
        }
      }
    ]
    dnsSettings: {
      dnsServers: []
    }
    enableAcceleratedNetworking: false
    enableIPForwarding: false
    disableTcpStateTracking: false
    networkSecurityGroup: {
      id: networkSecurityGroups_nsg_tre_jumpbox_name_resource.id
    }
    nicType: 'Standard'
    auxiliaryMode: 'None'
    auxiliarySku: 'None'
  }
}

resource networkSecurityGroups_nsg_tre_jumpbox_name_Allow_SSH_From_Bastion 'Microsoft.Network/networkSecurityGroups/securityRules@2024-07-01' = {
  name: '${networkSecurityGroups_nsg_tre_jumpbox_name}/Allow-SSH-From-Bastion'
  properties: {
    protocol: 'Tcp'
    sourcePortRange: '*'
    destinationPortRange: '22'
    sourceAddressPrefix: '10.10.1.0/26'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 100
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    networkSecurityGroups_nsg_tre_jumpbox_name_resource
  ]
}

resource networkSecurityGroups_vm_tre_jumpbox_nsg_name_SSH 'Microsoft.Network/networkSecurityGroups/securityRules@2024-07-01' = {
  name: '${networkSecurityGroups_vm_tre_jumpbox_nsg_name}/SSH'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '22'
    sourceAddressPrefix: '*'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 300
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    networkSecurityGroups_vm_tre_jumpbox_nsg_name_resource
  ]
}

resource virtualNetworks_vnet_tre_admin_ukwest_name_AzureBastionSubnet 'Microsoft.Network/virtualNetworks/subnets@2024-07-01' = {
  name: '${virtualNetworks_vnet_tre_admin_ukwest_name}/AzureBastionSubnet'
  properties: {
    addressPrefix: '10.20.1.0/26'
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_vnet_tre_admin_ukwest_name_resource
  ]
}

resource virtualNetworks_vnet_tre_admin_ukwest_name_default 'Microsoft.Network/virtualNetworks/subnets@2024-07-01' = {
  name: '${virtualNetworks_vnet_tre_admin_ukwest_name}/default'
  properties: {
    addressPrefix: '10.0.0.0/24'
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_vnet_tre_admin_ukwest_name_resource
  ]
}

resource virtualNetworks_vnet_tre_admin_ukwest_name_snet_admin 'Microsoft.Network/virtualNetworks/subnets@2024-07-01' = {
  name: '${virtualNetworks_vnet_tre_admin_ukwest_name}/snet-admin'
  properties: {
    addressPrefix: '10.20.0.0/24'
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_vnet_tre_admin_ukwest_name_resource
  ]
}

resource templateSpecs_tre_standard_research_workspace_name_1_0_0 'Microsoft.Resources/templateSpecs/versions@2022-02-01' = {
  parent: templateSpecs_tre_standard_research_workspace_name_resource
  name: '1.0.0'
  location: 'uksouth'
  tags: {
    Owner: 'Yassin'
    CostCentre: 'TRE'
    System: 'TRE'
    Environment: 'research'
    DataClassification: 'restricted'
  }
  properties: {
    description: 'Initial approved version for standard research workspace deployments.\n'
    mainTemplate: {
      '$schema': 'https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#'
      contentVersion: '1.0.0.0'
      metadata: {
        _generator: {
          name: 'bicep'
          version: '0.39.26.7824'
          templateHash: '13028418289938545044'
        }
      }
      parameters: {
        workspaceName: {
          type: 'string'
          metadata: {
            description: 'Name of the research workspace. Used for resource naming.'
          }
        }
        location: {
          type: 'string'
          metadata: {
            description: 'Azure region for all resources.'
          }
        }
        tags: {
          type: 'object'
          metadata: {
            description: 'Tags to apply to all research workspace resources.'
          }
        }
        privateEndpointSubnetId: {
          type: 'string'
          metadata: {
            description: 'Resource ID of the subnet used for private endpoints.'
          }
        }
        privateDnsSubscriptionId: {
          type: 'string'
          metadata: {
            description: 'Subscription ID hosting the private DNS zones.'
          }
        }
        privateDnsResourceGroupName: {
          type: 'string'
          metadata: {
            description: 'Resource group name hosting the private DNS zones.'
          }
        }
      }
      resources: [
        {
          type: 'Microsoft.Storage/storageAccounts'
          apiVersion: '2023-01-01'
          name: '[format(\'st{0}\', parameters(\'workspaceName\'))]'
          location: '[parameters(\'location\')]'
          tags: '[parameters(\'tags\')]'
          kind: 'StorageV2'
          sku: {
            name: 'Standard_LRS'
          }
          properties: {
            publicNetworkAccess: 'Disabled'
            minimumTlsVersion: 'TLS1_2'
            allowBlobPublicAccess: false
            supportsHttpsTrafficOnly: true
          }
        }
        {
          type: 'Microsoft.KeyVault/vaults'
          apiVersion: '2023-02-01'
          name: '[format(\'kv-{0}\', parameters(\'workspaceName\'))]'
          location: '[parameters(\'location\')]'
          tags: '[parameters(\'tags\')]'
          properties: {
            tenantId: '[subscription().tenantId]'
            enableRbacAuthorization: true
            enableSoftDelete: true
            enablePurgeProtection: true
            publicNetworkAccess: 'Disabled'
            sku: {
              family: 'A'
              name: 'standard'
            }
          }
        }
        {
          type: 'Microsoft.Network/privateEndpoints'
          apiVersion: '2023-05-01'
          name: '[format(\'pe-st-{0}\', parameters(\'workspaceName\'))]'
          location: '[parameters(\'location\')]'
          tags: '[parameters(\'tags\')]'
          properties: {
            subnet: {
              id: '[parameters(\'privateEndpointSubnetId\')]'
            }
            privateLinkServiceConnections: [
              {
                name: 'storage-blob'
                properties: {
                  privateLinkServiceId: '[resourceId(\'Microsoft.Storage/storageAccounts\', format(\'st{0}\', parameters(\'workspaceName\')))]'
                  groupIds: [
                    'blob'
                  ]
                }
              }
            ]
          }
          dependsOn: [
            '[resourceId(\'Microsoft.Storage/storageAccounts\', format(\'st{0}\', parameters(\'workspaceName\')))]'
          ]
        }
        {
          type: 'Microsoft.Network/privateEndpoints'
          apiVersion: '2023-05-01'
          name: '[format(\'pe-kv-{0}\', parameters(\'workspaceName\'))]'
          location: '[parameters(\'location\')]'
          tags: '[parameters(\'tags\')]'
          properties: {
            subnet: {
              id: '[parameters(\'privateEndpointSubnetId\')]'
            }
            privateLinkServiceConnections: [
              {
                name: 'keyvault'
                properties: {
                  privateLinkServiceId: '[resourceId(\'Microsoft.KeyVault/vaults\', format(\'kv-{0}\', parameters(\'workspaceName\')))]'
                  groupIds: [
                    'vault'
                  ]
                }
              }
            ]
          }
          dependsOn: [
            '[resourceId(\'Microsoft.KeyVault/vaults\', format(\'kv-{0}\', parameters(\'workspaceName\')))]'
          ]
        }
        {
          type: 'Microsoft.Network/privateEndpoints/privateDnsZoneGroups'
          apiVersion: '2023-05-01'
          name: '[format(\'{0}/{1}\', format(\'pe-st-{0}\', parameters(\'workspaceName\')), \'default\')]'
          properties: {
            privateDnsZoneConfigs: [
              {
                name: 'blob'
                properties: {
                  privateDnsZoneId: '[extensionResourceId(format(\'/subscriptions/{0}/resourceGroups/{1}\', parameters(\'privateDnsSubscriptionId\'), parameters(\'privateDnsResourceGroupName\')), \'Microsoft.Network/privateDnsZones\', \'privatelink.blob.core.windows.net\')]'
                }
              }
            ]
          }
          dependsOn: [
            '[resourceId(\'Microsoft.Network/privateEndpoints\', format(\'pe-st-{0}\', parameters(\'workspaceName\')))]'
          ]
        }
        {
          type: 'Microsoft.Network/privateEndpoints/privateDnsZoneGroups'
          apiVersion: '2023-05-01'
          name: '[format(\'{0}/{1}\', format(\'pe-kv-{0}\', parameters(\'workspaceName\')), \'default\')]'
          properties: {
            privateDnsZoneConfigs: [
              {
                name: 'vault'
                properties: {
                  privateDnsZoneId: '[extensionResourceId(format(\'/subscriptions/{0}/resourceGroups/{1}\', parameters(\'privateDnsSubscriptionId\'), parameters(\'privateDnsResourceGroupName\')), \'Microsoft.Network/privateDnsZones\', \'privatelink.vaultcore.azure.net\')]'
                }
              }
            ]
          }
          dependsOn: [
            '[resourceId(\'Microsoft.Network/privateEndpoints\', format(\'pe-kv-{0}\', parameters(\'workspaceName\')))]'
          ]
        }
      ]
      outputs: {
        storageAccountId: {
          type: 'string'
          value: '[resourceId(\'Microsoft.Storage/storageAccounts\', format(\'st{0}\', parameters(\'workspaceName\')))]'
        }
        storageAccountName: {
          type: 'string'
          value: '[format(\'st{0}\', parameters(\'workspaceName\'))]'
        }
        keyVaultId: {
          type: 'string'
          value: '[resourceId(\'Microsoft.KeyVault/vaults\', format(\'kv-{0}\', parameters(\'workspaceName\')))]'
        }
        keyVaultName: {
          type: 'string'
          value: '[format(\'kv-{0}\', parameters(\'workspaceName\'))]'
        }
        storagePrivateEndpointId: {
          type: 'string'
          value: '[resourceId(\'Microsoft.Network/privateEndpoints\', format(\'pe-st-{0}\', parameters(\'workspaceName\')))]'
        }
        keyVaultPrivateEndpointId: {
          type: 'string'
          value: '[resourceId(\'Microsoft.Network/privateEndpoints\', format(\'pe-kv-{0}\', parameters(\'workspaceName\')))]'
        }
      }
    }
  }
}

resource templateSpecs_tre_standard_research_workspace_name_1_0_1 'Microsoft.Resources/templateSpecs/versions@2022-02-01' = {
  parent: templateSpecs_tre_standard_research_workspace_name_resource
  name: '1.0.1'
  location: 'uksouth'
  tags: {
    Owner: 'Yassin'
    CostCentre: 'TRE'
    System: 'TRE'
    Environment: 'research'
    DataClassification: 'restricted'
  }
  properties: {
    mainTemplate: {
      '$schema': 'https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#'
      contentVersion: '1.0.0.0'
      metadata: {
        _generator: {
          name: 'bicep'
          version: '0.39.26.7824'
          templateHash: '18273450901239018319'
        }
      }
      parameters: {
        workspaceName: {
          type: 'string'
          metadata: {
            description: 'Name of the research workspace. Used for resource naming.'
          }
        }
        location: {
          type: 'string'
          metadata: {
            description: 'Azure region for all resources.'
          }
        }
        tags: {
          type: 'object'
          metadata: {
            description: 'Tags to apply to all research workspace resources.'
          }
        }
        privateEndpointSubnetId: {
          type: 'string'
          metadata: {
            description: 'Resource ID of the subnet used for private endpoints.'
          }
        }
        privateDnsSubscriptionId: {
          type: 'string'
          metadata: {
            description: 'Subscription ID hosting the private DNS zones.'
          }
        }
        privateDnsResourceGroupName: {
          type: 'string'
          metadata: {
            description: 'Resource group name hosting the private DNS zones.'
          }
        }
        platformStorageAccountName: {
          type: 'string'
          metadata: {
            description: 'Name of the existing platform storage account.'
          }
        }
        platformStorageAccountResourceGroup: {
          type: 'string'
          metadata: {
            description: 'Resource group of the existing platform storage account.'
          }
        }
      }
      resources: [
        {
          type: 'Microsoft.KeyVault/vaults'
          apiVersion: '2023-02-01'
          name: '[format(\'kv-{0}\', parameters(\'workspaceName\'))]'
          location: '[parameters(\'location\')]'
          tags: '[parameters(\'tags\')]'
          properties: {
            tenantId: '[subscription().tenantId]'
            enableRbacAuthorization: true
            enableSoftDelete: true
            enablePurgeProtection: true
            publicNetworkAccess: 'Disabled'
            sku: {
              family: 'A'
              name: 'standard'
            }
          }
        }
        {
          type: 'Microsoft.Network/privateEndpoints'
          apiVersion: '2023-05-01'
          name: '[format(\'pe-st-{0}\', parameters(\'workspaceName\'))]'
          location: '[parameters(\'location\')]'
          tags: '[parameters(\'tags\')]'
          properties: {
            subnet: {
              id: '[parameters(\'privateEndpointSubnetId\')]'
            }
            privateLinkServiceConnections: [
              {
                name: 'storage-blob'
                properties: {
                  privateLinkServiceId: '[extensionResourceId(format(\'/subscriptions/{0}/resourceGroups/{1}\', subscription().subscriptionId, parameters(\'platformStorageAccountResourceGroup\')), \'Microsoft.Storage/storageAccounts\', parameters(\'platformStorageAccountName\'))]'
                  groupIds: [
                    'blob'
                  ]
                }
              }
            ]
          }
        }
        {
          type: 'Microsoft.Network/privateEndpoints'
          apiVersion: '2023-05-01'
          name: '[format(\'pe-kv-{0}\', parameters(\'workspaceName\'))]'
          location: '[parameters(\'location\')]'
          tags: '[parameters(\'tags\')]'
          properties: {
            subnet: {
              id: '[parameters(\'privateEndpointSubnetId\')]'
            }
            privateLinkServiceConnections: [
              {
                name: 'keyvault'
                properties: {
                  privateLinkServiceId: '[resourceId(\'Microsoft.KeyVault/vaults\', format(\'kv-{0}\', parameters(\'workspaceName\')))]'
                  groupIds: [
                    'vault'
                  ]
                }
              }
            ]
          }
          dependsOn: [
            '[resourceId(\'Microsoft.KeyVault/vaults\', format(\'kv-{0}\', parameters(\'workspaceName\')))]'
          ]
        }
        {
          type: 'Microsoft.Network/privateEndpoints/privateDnsZoneGroups'
          apiVersion: '2023-05-01'
          name: '[format(\'{0}/{1}\', format(\'pe-st-{0}\', parameters(\'workspaceName\')), \'default\')]'
          properties: {
            privateDnsZoneConfigs: [
              {
                name: 'blob'
                properties: {
                  privateDnsZoneId: '[subscriptionResourceId(parameters(\'privateDnsSubscriptionId\'), \'Microsoft.Network/privateDnsZones\', \'privatelink.blob.core.windows.net\')]'
                }
              }
            ]
          }
          dependsOn: [
            '[resourceId(\'Microsoft.Network/privateEndpoints\', format(\'pe-st-{0}\', parameters(\'workspaceName\')))]'
          ]
        }
        {
          type: 'Microsoft.Network/privateEndpoints/privateDnsZoneGroups'
          apiVersion: '2023-05-01'
          name: '[format(\'{0}/{1}\', format(\'pe-kv-{0}\', parameters(\'workspaceName\')), \'default\')]'
          properties: {
            privateDnsZoneConfigs: [
              {
                name: 'vault'
                properties: {
                  privateDnsZoneId: '[subscriptionResourceId(parameters(\'privateDnsSubscriptionId\'), \'Microsoft.Network/privateDnsZones\', \'privatelink.vaultcore.azure.net\')]'
                }
              }
            ]
          }
          dependsOn: [
            '[resourceId(\'Microsoft.Network/privateEndpoints\', format(\'pe-kv-{0}\', parameters(\'workspaceName\')))]'
          ]
        }
      ]
      outputs: {
        storageAccountId: {
          type: 'string'
          value: '[extensionResourceId(format(\'/subscriptions/{0}/resourceGroups/{1}\', subscription().subscriptionId, parameters(\'platformStorageAccountResourceGroup\')), \'Microsoft.Storage/storageAccounts\', parameters(\'platformStorageAccountName\'))]'
        }
        storageAccountName: {
          type: 'string'
          value: '[parameters(\'platformStorageAccountName\')]'
        }
        keyVaultId: {
          type: 'string'
          value: '[resourceId(\'Microsoft.KeyVault/vaults\', format(\'kv-{0}\', parameters(\'workspaceName\')))]'
        }
        keyVaultName: {
          type: 'string'
          value: '[format(\'kv-{0}\', parameters(\'workspaceName\'))]'
        }
        storagePrivateEndpointId: {
          type: 'string'
          value: '[resourceId(\'Microsoft.Network/privateEndpoints\', format(\'pe-st-{0}\', parameters(\'workspaceName\')))]'
        }
        keyVaultPrivateEndpointId: {
          type: 'string'
          value: '[resourceId(\'Microsoft.Network/privateEndpoints\', format(\'pe-kv-{0}\', parameters(\'workspaceName\')))]'
        }
      }
    }
  }
}

resource templateSpecs_tre_standard_research_workspace_name_1_0_2 'Microsoft.Resources/templateSpecs/versions@2022-02-01' = {
  parent: templateSpecs_tre_standard_research_workspace_name_resource
  name: '1.0.2'
  location: 'uksouth'
  tags: {
    Owner: 'Yassin'
    CostCentre: 'TRE'
    System: 'TRE'
    Environment: 'research'
    DataClassification: 'restricted'
  }
  properties: {
    mainTemplate: {
      '$schema': 'https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#'
      contentVersion: '1.0.0.0'
      metadata: {
        _generator: {
          name: 'bicep'
          version: '0.39.26.7824'
          templateHash: '18273450901239018319'
        }
      }
      parameters: {
        workspaceName: {
          type: 'string'
          metadata: {
            description: 'Name of the research workspace. Used for resource naming.'
          }
        }
        location: {
          type: 'string'
          metadata: {
            description: 'Azure region for all resources.'
          }
        }
        tags: {
          type: 'object'
          metadata: {
            description: 'Tags to apply to all research workspace resources.'
          }
        }
        privateEndpointSubnetId: {
          type: 'string'
          metadata: {
            description: 'Resource ID of the subnet used for private endpoints.'
          }
        }
        privateDnsSubscriptionId: {
          type: 'string'
          metadata: {
            description: 'Subscription ID hosting the private DNS zones.'
          }
        }
        privateDnsResourceGroupName: {
          type: 'string'
          metadata: {
            description: 'Resource group name hosting the private DNS zones.'
          }
        }
        platformStorageAccountName: {
          type: 'string'
          metadata: {
            description: 'Name of the existing platform storage account.'
          }
        }
        platformStorageAccountResourceGroup: {
          type: 'string'
          metadata: {
            description: 'Resource group of the existing platform storage account.'
          }
        }
      }
      resources: [
        {
          type: 'Microsoft.KeyVault/vaults'
          apiVersion: '2023-02-01'
          name: '[format(\'kv-{0}\', parameters(\'workspaceName\'))]'
          location: '[parameters(\'location\')]'
          tags: '[parameters(\'tags\')]'
          properties: {
            tenantId: '[subscription().tenantId]'
            enableRbacAuthorization: true
            enableSoftDelete: true
            enablePurgeProtection: true
            publicNetworkAccess: 'Disabled'
            sku: {
              family: 'A'
              name: 'standard'
            }
          }
        }
        {
          type: 'Microsoft.Network/privateEndpoints'
          apiVersion: '2023-05-01'
          name: '[format(\'pe-st-{0}\', parameters(\'workspaceName\'))]'
          location: '[parameters(\'location\')]'
          tags: '[parameters(\'tags\')]'
          properties: {
            subnet: {
              id: '[parameters(\'privateEndpointSubnetId\')]'
            }
            privateLinkServiceConnections: [
              {
                name: 'storage-blob'
                properties: {
                  privateLinkServiceId: '[extensionResourceId(format(\'/subscriptions/{0}/resourceGroups/{1}\', subscription().subscriptionId, parameters(\'platformStorageAccountResourceGroup\')), \'Microsoft.Storage/storageAccounts\', parameters(\'platformStorageAccountName\'))]'
                  groupIds: [
                    'blob'
                  ]
                }
              }
            ]
          }
        }
        {
          type: 'Microsoft.Network/privateEndpoints'
          apiVersion: '2023-05-01'
          name: '[format(\'pe-kv-{0}\', parameters(\'workspaceName\'))]'
          location: '[parameters(\'location\')]'
          tags: '[parameters(\'tags\')]'
          properties: {
            subnet: {
              id: '[parameters(\'privateEndpointSubnetId\')]'
            }
            privateLinkServiceConnections: [
              {
                name: 'keyvault'
                properties: {
                  privateLinkServiceId: '[resourceId(\'Microsoft.KeyVault/vaults\', format(\'kv-{0}\', parameters(\'workspaceName\')))]'
                  groupIds: [
                    'vault'
                  ]
                }
              }
            ]
          }
          dependsOn: [
            '[resourceId(\'Microsoft.KeyVault/vaults\', format(\'kv-{0}\', parameters(\'workspaceName\')))]'
          ]
        }
        {
          type: 'Microsoft.Network/privateEndpoints/privateDnsZoneGroups'
          apiVersion: '2023-05-01'
          name: '[format(\'{0}/{1}\', format(\'pe-st-{0}\', parameters(\'workspaceName\')), \'default\')]'
          properties: {
            privateDnsZoneConfigs: [
              {
                name: 'blob'
                properties: {
                  privateDnsZoneId: privateDnsZones_privatelink_blob_core_windows_net_externalid
                }
              }
            ]
          }
          dependsOn: [
            '[resourceId(\'Microsoft.Network/privateEndpoints\', format(\'pe-st-{0}\', parameters(\'workspaceName\')))]'
          ]
        }
        {
          type: 'Microsoft.Network/privateEndpoints/privateDnsZoneGroups'
          apiVersion: '2023-05-01'
          name: '[format(\'{0}/{1}\', format(\'pe-kv-{0}\', parameters(\'workspaceName\')), \'default\')]'
          properties: {
            privateDnsZoneConfigs: [
              {
                name: 'vault'
                properties: {
                  privateDnsZoneId: privateDnsZones_privatelink_vaultcore_azure_net_externalid
                }
              }
            ]
          }
          dependsOn: [
            '[resourceId(\'Microsoft.Network/privateEndpoints\', format(\'pe-kv-{0}\', parameters(\'workspaceName\')))]'
          ]
        }
      ]
      outputs: {
        storageAccountId: {
          type: 'string'
          value: '[extensionResourceId(format(\'/subscriptions/{0}/resourceGroups/{1}\', subscription().subscriptionId, parameters(\'platformStorageAccountResourceGroup\')), \'Microsoft.Storage/storageAccounts\', parameters(\'platformStorageAccountName\'))]'
        }
        storageAccountName: {
          type: 'string'
          value: '[parameters(\'platformStorageAccountName\')]'
        }
        keyVaultId: {
          type: 'string'
          value: '[resourceId(\'Microsoft.KeyVault/vaults\', format(\'kv-{0}\', parameters(\'workspaceName\')))]'
        }
        keyVaultName: {
          type: 'string'
          value: '[format(\'kv-{0}\', parameters(\'workspaceName\'))]'
        }
        storagePrivateEndpointId: {
          type: 'string'
          value: '[resourceId(\'Microsoft.Network/privateEndpoints\', format(\'pe-st-{0}\', parameters(\'workspaceName\')))]'
        }
        keyVaultPrivateEndpointId: {
          type: 'string'
          value: '[resourceId(\'Microsoft.Network/privateEndpoints\', format(\'pe-kv-{0}\', parameters(\'workspaceName\')))]'
        }
      }
    }
  }
}

resource storageAccounts_stretrequestsuks_name_default 'Microsoft.Storage/storageAccounts/blobServices@2025-01-01' = {
  parent: storageAccounts_stretrequestsuks_name_resource
  name: 'default'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  properties: {
    containerDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
    cors: {
      corsRules: []
    }
    deleteRetentionPolicy: {
      allowPermanentDelete: false
      enabled: true
      days: 7
    }
    isVersioningEnabled: true
  }
}

resource storageAccounts_stretrequestsuks_name_TREencrypt 'Microsoft.Storage/storageAccounts/encryptionScopes@2025-01-01' = {
  parent: storageAccounts_stretrequestsuks_name_resource
  name: 'TREencrypt'
  properties: {
    source: 'Microsoft.Storage'
    state: 'Enabled'
    requireInfrastructureEncryption: true
  }
}

resource Microsoft_Storage_storageAccounts_fileServices_storageAccounts_stretrequestsuks_name_default 'Microsoft.Storage/storageAccounts/fileServices@2025-01-01' = {
  parent: storageAccounts_stretrequestsuks_name_resource
  name: 'default'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  properties: {
    protocolSettings: {
      smb: {}
    }
    cors: {
      corsRules: []
    }
    shareDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
  }
}

resource storageAccounts_stretrequestsuks_name_storageAccounts_stretrequestsuks_name_39d2c092_5351_46f4_944d_8b1cd50a3b37 'Microsoft.Storage/storageAccounts/privateEndpointConnections@2025-01-01' = {
  parent: storageAccounts_stretrequestsuks_name_resource
  name: '${storageAccounts_stretrequestsuks_name}.39d2c092-5351-46f4-944d-8b1cd50a3b37'
  properties: {
    privateEndpoint: {}
    privateLinkServiceConnectionState: {
      status: 'Approved'
      description: 'Auto-Approved'
      actionRequired: 'None'
    }
  }
}

resource storageAccounts_stretrequestsuks_name_storageAccounts_stretrequestsuks_name_fa66ca49_9895_441b_bab5_203a6e859fe7 'Microsoft.Storage/storageAccounts/privateEndpointConnections@2025-01-01' = {
  parent: storageAccounts_stretrequestsuks_name_resource
  name: '${storageAccounts_stretrequestsuks_name}.fa66ca49-9895-441b-bab5-203a6e859fe7'
  properties: {
    privateEndpoint: {}
    privateLinkServiceConnectionState: {
      status: 'Approved'
      description: 'Auto-Approved'
      actionRequired: 'None'
    }
  }
}

resource Microsoft_Storage_storageAccounts_queueServices_storageAccounts_stretrequestsuks_name_default 'Microsoft.Storage/storageAccounts/queueServices@2025-01-01' = {
  parent: storageAccounts_stretrequestsuks_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource Microsoft_Storage_storageAccounts_tableServices_storageAccounts_stretrequestsuks_name_default 'Microsoft.Storage/storageAccounts/tableServices@2025-01-01' = {
  parent: storageAccounts_stretrequestsuks_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource workflows_la_tre_request_intake_uksouth_name_resource 'Microsoft.Logic/workflows@2017-07-01' = {
  name: workflows_la_tre_request_intake_uksouth_name
  location: 'uksouth'
  tags: {
    Owner: 'Yassin'
    CostCentre: 'TRE'
    System: 'TRE'
    Environment: 'research'
    DataClassification: 'restricted'
  }
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    state: 'Enabled'
    definition: {
      '$schema': 'https://schema.management.azure.com/providers/Microsoft.Logic/schemas/2016-06-01/workflowdefinition.json#'
      contentVersion: '1.0.3.2'
      parameters: {
        '$connections': {
          defaultValue: {}
          type: 'Object'
        }
      }
      triggers: {
        When_an_HTTP_request_is_received: {
          type: 'Request'
          kind: 'Http'
          inputs: {
            method: 'POST'
            schema: {
              type: 'object'
              required: [
                'workspaceName'
                'owner'
              ]
              properties: {
                workspaceName: {
                  type: 'string'
                  minLength: 3
                }
                owner: {
                  type: 'string'
                }
              }
            }
          }
        }
      }
      actions: {
        Initialize_variables: {
          runAfter: {}
          type: 'InitializeVariable'
          inputs: {
            variables: [
              {
                name: 'requestId'
                type: 'string'
                value: '@{guid()}'
              }
              {
                name: 'researchTags'
                type: 'object'
                value: {
                  CostCentre: 'TRE'
                  System: 'TRE'
                  Environment: 'research'
                  DataClassification: 'restricted'
                  Owner: 'Yassin'
                }
              }
              {
                name: 'internalExecutionKey'
                type: 'string'
                value: 'dfdf'
              }
              {
                name: 'location'
                type: 'string'
                value: 'uksouth'
              }
              {
                name: 'privateEndpointSubnetId'
                type: 'string'
                value: '${virtualNetworks_vnet_tre_uksouth_externalid}/subnets/snet-privateendpoints'
              }
              {
                name: 'privateDnsSubscriptionId'
                type: 'string'
                value: '4d38ea20-7a50-4815-9c82-527d9f182f8b'
              }
              {
                name: 'privateDnsResourceGroupName'
                type: 'string'
                value: 'rg-tre-net-uksouth'
              }
              {
                name: 'templateSpecId'
                type: 'string'
                value: '${templateSpecs_tre_workspace_template_externalid}/versions/1.0.2'
              }
            ]
          }
        }
        'Create_blob_(V2)': {
          runAfter: {
            Initialize_variables: [
              'Succeeded'
            ]
          }
          type: 'ApiConnection'
          inputs: {
            host: {
              connection: {
                name: '@parameters(\'$connections\')[\'azureblob\'][\'connectionId\']'
              }
            }
            method: 'post'
            body: '@string(triggerBody())'
            headers: {
              'Content-Type': 'application/json'
            }
            path: '/v2/datasets/@{encodeURIComponent(encodeURIComponent(\'stretrequestsuks\'))}/files'
            queries: {
              folderPath: '/tre-intake/pending'
              name: '@{variables(\'requestId\')}.json'
            }
          }
        }
        Validate_workspace_name: {
          actions: {
            Send_approval_email: {
              type: 'ApiConnectionWebhook'
              inputs: {
                host: {
                  connection: {
                    name: '@parameters(\'$connections\')[\'outlook\'][\'connectionId\']'
                  }
                }
                body: {
                  NotificationUrl: '@listCallbackUrl()'
                  Message: {
                    To: 'yassin_123@hotmail.co.uk'
                    Subject: 'TRE – Research Workspace Request Approval'
                    Options: 'Approve, Reject'
                    Body: '<p>A new <strong>Research Workspace</strong> request has been submitted for initial approval.</p>\n\n<table style="border-collapse:collapse">\n  <tr>\n    <td style="padding:6px 12px"><strong>Workspace Name</strong></td>\n    <td style="padding:6px 12px">@{triggerBody()?[\'workspaceName\']}</td>\n  </tr>\n  <tr>\n    <td style="padding:6px 12px"><strong>Requested By</strong></td>\n    <td style="padding:6px 12px">@{triggerBody()?[\'owner\']}</td>\n  </tr>\n</table>\n\n<p>Please review the request and select <strong>Approve</strong> or <strong>Reject</strong>.</p>\n\n<p style="font-size:12px;color:#666">All requests and decisions are logged and retained for audit purposes.</p>'
                  }
                }
                path: '/approvalmail/$subscriptions'
              }
            }
            Approval_decision: {
              actions: {
                Copy_to_approved: {
                  type: 'ApiConnection'
                  inputs: {
                    host: {
                      connection: {
                        name: '@parameters(\'$connections\')[\'azureblob\'][\'connectionId\']'
                      }
                    }
                    method: 'post'
                    path: '/v2/datasets/@{encodeURIComponent(encodeURIComponent(\'stretrequestsuks\'))}/copyFile'
                    queries: {
                      source: 'tre-intake/pending/@{variables(\'requestId\')}.json'
                      destination: 'tre-intake/approved/@{variables(\'requestId\')}.json'
                      overwrite: true
                      queryParametersSingleEncoded: true
                    }
                  }
                }
                Call_Deployment_Logic_App: {
                  runAfter: {
                    Copy_to_approved: [
                      'Succeeded'
                    ]
                  }
                  type: 'Http'
                  inputs: {
                    uri: 'https://prod-03.uksouth.logic.azure.com:443/workflows/1a5d35392a594f2ea8e53d12accc8231/triggers/When_an_HTTP_request_is_received/paths/invoke?api-version=2016-10-01&sp=%2Ftriggers%2FWhen_an_HTTP_request_is_received%2Frun&sv=1.0&sig=LvnpxYV1cySZ_m0D63rwEedqDT3mtUHRZnme_w5kbkI'
                    method: 'POST'
                    headers: {
                      'Content-Type': 'application/json'
                      'x-tre-internal-key': '@{variables(\'internalExecutionKey\')}'
                    }
                    body: {
                      requestId: '@{variables(\'requestId\')}'
                      workspaceName: '@{triggerBody()?[\'workspaceName\']}'
                      owner: '@{triggerBody()?[\'owner\']}'
                      location: '@{variables(\'location\')}'
                      researchTags: '@{variables(\'researchTags\')}'
                      network: {
                        privateEndpointSubnetId: '@{variables(\'privateEndpointSubnetId\')}'
                      }
                      dns: {
                        privateDnsSubscriptionId: '@{variables(\'privateDnsSubscriptionId\')}'
                        privateDnsResourceGroupName: '@{variables(\'privateDnsResourceGroupName\')}'
                      }
                      templateSpec: {
                        id: '@{variables(\'templateSpecId\')}'
                      }
                    }
                  }
                }
              }
              runAfter: {
                Send_approval_email: [
                  'Succeeded'
                ]
              }
              else: {
                actions: {
                  Copy_to_rejected: {
                    type: 'ApiConnection'
                    inputs: {
                      host: {
                        connection: {
                          name: '@parameters(\'$connections\')[\'azureblob\'][\'connectionId\']'
                        }
                      }
                      method: 'post'
                      path: '/v2/datasets/@{encodeURIComponent(encodeURIComponent(\'stretrequestsuks\'))}/copyFile'
                      queries: {
                        source: 'tre-intake/pending/@{variables(\'requestId\')}.json'
                        destination: 'tre-intake/rejected/@{variables(\'requestId\')}.json'
                        overwrite: true
                        queryParametersSingleEncoded: true
                      }
                    }
                  }
                  Response_Rejected: {
                    runAfter: {
                      Copy_to_rejected: [
                        'Succeeded'
                      ]
                    }
                    type: 'Response'
                    inputs: {
                      statusCode: 403
                      body: {
                        status: 'Rejected'
                        message: 'Request rejected by approver'
                      }
                    }
                  }
                }
              }
              expression: {
                equals: [
                  '@body(\'Send_approval_email\')?[\'SelectedOption\']'
                  'Approve'
                ]
              }
              type: 'If'
            }
          }
          runAfter: {
            'Create_blob_(V2)': [
              'Succeeded'
            ]
          }
          else: {
            actions: {}
          }
          expression: {
            greaterOrEquals: [
              '@length(triggerBody()?[\'workspaceName\'])'
              3
            ]
          }
          type: 'If'
        }
      }
      outputs: {}
    }
    parameters: {
      '$connections': {
        type: 'Object'
        value: {
          azureblob: {
            id: '/subscriptions/4d38ea20-7a50-4815-9c82-527d9f182f8b/providers/Microsoft.Web/locations/uksouth/managedApis/azureblob'
            connectionId: connections_azureblob_name_resource.id
            connectionName: 'azureblob'
            connectionProperties: {
              authentication: {
                type: 'ManagedServiceIdentity'
              }
            }
          }
          outlook: {
            id: '/subscriptions/4d38ea20-7a50-4815-9c82-527d9f182f8b/providers/Microsoft.Web/locations/uksouth/managedApis/outlook'
            connectionId: connections_outlook_name_resource.id
            connectionName: 'outlook'
            connectionProperties: {}
          }
        }
      }
    }
  }
}

resource bastionHosts_bas_tre_admin_ukwest_name_resource 'Microsoft.Network/bastionHosts@2024-07-01' = {
  name: bastionHosts_bas_tre_admin_ukwest_name
  location: 'ukwest'
  tags: {
    Owner: 'Yassin'
    CostCentre: 'TRE'
    System: 'TRE'
    Environment: 'research'
    DataClassification: 'restricted'
  }
  sku: {
    name: 'Standard'
  }
  properties: {
    dnsName: 'bst-09bdd819-4183-4a9e-a7be-1790c86d1b2a.bastion.azure.com'
    scaleUnits: 2
    enableTunneling: true
    enableIpConnect: false
    enableFileCopy: false
    disableCopyPaste: false
    enableShareableLink: false
    enableKerberos: false
    enableSessionRecording: false
    ipConfigurations: [
      {
        name: 'bastion_ip_config'
        id: '${bastionHosts_bas_tre_admin_ukwest_name_resource.id}/bastionHostIpConfigurations/bastion_ip_config'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIPAddresses_pip_tre_bastion_ukwest_name_resource.id
          }
          subnet: {
            id: virtualNetworks_vnet_tre_admin_ukwest_name_AzureBastionSubnet.id
          }
        }
      }
    ]
  }
}

resource networkInterfaces_vm_tre_jumpbox725_name_resource 'Microsoft.Network/networkInterfaces@2024-07-01' = {
  name: networkInterfaces_vm_tre_jumpbox725_name
  location: 'ukwest'
  tags: {
    Owner: 'Yassin'
    CostCentre: 'TRE'
    System: 'TRE'
    Environment: 'research'
    DataClassification: 'restricted'
  }
  kind: 'Regular'
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        id: '${networkInterfaces_vm_tre_jumpbox725_name_resource.id}/ipConfigurations/ipconfig1'
        type: 'Microsoft.Network/networkInterfaces/ipConfigurations'
        properties: {
          privateIPAddress: '10.20.0.4'
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: virtualNetworks_vnet_tre_admin_ukwest_name_snet_admin.id
          }
          primary: true
          privateIPAddressVersion: 'IPv4'
        }
      }
    ]
    dnsSettings: {
      dnsServers: []
    }
    enableAcceleratedNetworking: true
    enableIPForwarding: false
    disableTcpStateTracking: false
    networkSecurityGroup: {
      id: networkSecurityGroups_vm_tre_jumpbox_nsg_name_resource.id
    }
    nicType: 'Standard'
    auxiliaryMode: 'None'
    auxiliarySku: 'None'
  }
}

resource storageAccounts_stretrequestsuks_name_default_tre_deployments 'Microsoft.Storage/storageAccounts/blobServices/containers@2025-01-01' = {
  parent: storageAccounts_stretrequestsuks_name_default
  name: 'tre-deployments'
  properties: {
    immutableStorageWithVersioning: {
      enabled: false
    }
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    publicAccess: 'None'
  }
  dependsOn: [
    storageAccounts_stretrequestsuks_name_resource
  ]
}

resource storageAccounts_stretrequestsuks_name_default_tre_intake 'Microsoft.Storage/storageAccounts/blobServices/containers@2025-01-01' = {
  parent: storageAccounts_stretrequestsuks_name_default
  name: 'tre-intake'
  properties: {
    immutableStorageWithVersioning: {
      enabled: false
    }
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    publicAccess: 'None'
  }
  dependsOn: [
    storageAccounts_stretrequestsuks_name_resource
  ]
}

resource workflows_la_tre_deploy_execution_name_resource 'Microsoft.Logic/workflows@2017-07-01' = {
  name: workflows_la_tre_deploy_execution_name
  location: 'uksouth'
  tags: {
    Owner: 'Yassin'
    CostCentre: 'TRE'
    System: 'TRE'
    Environment: 'research'
    DataClassification: 'restricted'
  }
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    state: 'Enabled'
    definition: {
      '$schema': 'https://schema.management.azure.com/providers/Microsoft.Logic/schemas/2016-06-01/workflowdefinition.json#'
      contentVersion: '1.1.0.0'
      parameters: {
        '$connections': {
          defaultValue: {}
          type: 'Object'
        }
      }
      triggers: {
        When_an_HTTP_request_is_received: {
          type: 'Request'
          kind: 'Http'
          inputs: {
            method: 'POST'
            schema: {
              type: 'object'
              required: [
                'requestId'
                'workspaceName'
                'owner'
                'location'
                'researchTags'
                'network'
                'dns'
                'templateSpec'
              ]
              properties: {
                requestId: {
                  type: 'string'
                }
                workspaceName: {
                  type: 'string'
                }
                owner: {
                  type: 'string'
                }
                location: {
                  type: 'string'
                }
                researchTags: {
                  type: 'object'
                }
                network: {
                  type: 'object'
                  required: [
                    'privateEndpointSubnetId'
                  ]
                  properties: {
                    privateEndpointSubnetId: {
                      type: 'string'
                    }
                  }
                }
                dns: {
                  type: 'object'
                  required: [
                    'privateDnsSubscriptionId'
                    'privateDnsResourceGroupName'
                  ]
                  properties: {
                    privateDnsSubscriptionId: {
                      type: 'string'
                    }
                    privateDnsResourceGroupName: {
                      type: 'string'
                    }
                  }
                }
                templateSpec: {
                  type: 'object'
                  required: [
                    'id'
                  ]
                  properties: {
                    id: {
                      type: 'string'
                    }
                  }
                }
              }
            }
          }
        }
      }
      actions: {
        Validate_Internal_Caller: {
          actions: {
            'Get_blob_content_using_path_(V2)': {
              type: 'ApiConnection'
              inputs: {
                host: {
                  connection: {
                    name: '@parameters(\'$connections\')[\'azureblob\'][\'connectionId\']'
                  }
                }
                method: 'get'
                path: '/v2/datasets/@{encodeURIComponent(encodeURIComponent(\'stretrequestsuks\'))}/GetFileContentByPath'
                queries: {
                  path: 'tre-intake/approved/@{triggerBody()?[\'requestId\']}.json'
                  inferContentType: true
                  queryParametersSingleEncoded: true
                }
              }
            }
            Send_Platform_Approval_Email: {
              runAfter: {
                'Get_blob_content_using_path_(V2)': [
                  'Succeeded'
                ]
              }
              type: 'ApiConnectionWebhook'
              inputs: {
                host: {
                  connection: {
                    name: '@parameters(\'$connections\')[\'outlook\'][\'connectionId\']'
                  }
                }
                body: {
                  NotificationUrl: '@listCallbackUrl()'
                  Message: {
                    To: 'yassin_123@hotmail.co.uk'
                    Subject: 'TRE Platform – Deployment Approval Required'
                    Importance: 'Normal'
                    Options: 'Approve, Reject'
                    Body: '<p>A new <strong>Trusted Research Environment (TRE)</strong> deployment request requires your approval.</p>\n\n<table style="border-collapse:collapse">\n  <tr>\n    <td style="padding:6px 12px"><strong>Request ID</strong></td>\n    <td style="padding:6px 12px">@{triggerBody()?[\'requestId\']}</td>\n  </tr>\n  <tr>\n    <td style="padding:6px 12px"><strong>Workspace Name</strong></td>\n    <td style="padding:6px 12px">@{triggerBody()?[\'workspaceName\']}</td>\n  </tr>\n  <tr>\n    <td style="padding:6px 12px"><strong>Owner</strong></td>\n    <td style="padding:6px 12px">@{triggerBody()?[\'owner\']}</td>\n  </tr>\n  <tr>\n    <td style="padding:6px 12px"><strong>Location</strong></td>\n    <td style="padding:6px 12px">@{triggerBody()?[\'location\']}</td>\n  </tr>\n  <tr>\n    <td style="padding:6px 12px"><strong>Template Spec</strong></td>\n    <td style="padding:6px 12px">@{triggerBody()?[\'templateSpec\']?[\'id\']}</td>\n  </tr>\n</table>\n\n<p>Please select <strong>Approve</strong> or <strong>Reject</strong> to continue.</p>\n\n<p style="font-size:12px;color:#666">This request and approval decision will be logged and retained for audit purposes.</p>'
                  }
                }
                path: '/approvalmail/$subscriptions'
              }
            }
            Platform_Approval_Decision: {
              actions: {
                Get_secret_1: {
                  type: 'ApiConnection'
                  inputs: {
                    host: {
                      connection: {
                        name: '@parameters(\'$connections\')[\'keyvault\'][\'connectionId\']'
                      }
                    }
                    method: 'get'
                    path: '/secrets/@{encodeURIComponent(\'github-token\')}/value'
                  }
                  runtimeConfiguration: {
                    secureData: {
                      properties: [
                        'inputs'
                        'outputs'
                      ]
                    }
                  }
                }
                HTTP: {
                  runAfter: {
                    Get_secret_1: [
                      'Succeeded'
                    ]
                  }
                  type: 'Http'
                  inputs: {
                    uri: 'https://api.github.com/repos/Y2not2nd/TRE/actions/workflows/tre-deployment.yml/dispatches'
                    method: 'POST'
                    headers: {
                      Authorization: 'Bearer @{body(\'Get_secret_1\')?[\'value\']}'
                      Accept: 'application/vnd.github.v3+json'
                      'X-GitHub-Api-Version': '2022-11-28'
                      'User-Agent': 'LogicApp-TRE-Platform'
                    }
                    body: {
                      ref: 'main'
                      inputs: {
                        correlationId: '@{triggerBody()?[\'requestId\']}'
                        blobContainer: 'tre-intake'
                        blobPath: 'approved/@{triggerBody()?[\'requestId\']}.json'
                      }
                    }
                  }
                }
              }
              runAfter: {
                Send_Platform_Approval_Email: [
                  'Succeeded'
                ]
              }
              else: {
                actions: {
                  Response_Rejected: {
                    type: 'Response'
                    inputs: {
                      statusCode: 403
                      body: {
                        status: 'Rejected'
                        message: 'Deployment rejected at platform approval stage.'
                      }
                    }
                  }
                }
              }
              expression: {
                equals: [
                  '@body(\'Send_Platform_Approval_Email\')?[\'SelectedOption\']'
                  'Approve'
                ]
              }
              type: 'If'
            }
          }
          runAfter: {}
          else: {
            actions: {
              Response_Unauthorized: {
                type: 'Response'
                inputs: {
                  statusCode: 401
                  body: {
                    error: 'Unauthorized caller'
                  }
                }
              }
            }
          }
          expression: {
            equals: [
              '@triggerOutputs()?[\'headers\']?[\'x-tre-internal-key\']'
              'dfdf'
            ]
          }
          type: 'If'
        }
      }
      outputs: {}
    }
    parameters: {
      '$connections': {
        type: 'Object'
        value: {
          azureblob: {
            id: '/subscriptions/4d38ea20-7a50-4815-9c82-527d9f182f8b/providers/Microsoft.Web/locations/uksouth/managedApis/azureblob'
            connectionId: connections_azureblob_name_resource.id
            connectionName: 'azureblob'
            connectionProperties: {
              authentication: {
                type: 'ManagedServiceIdentity'
              }
            }
          }
          outlook: {
            id: '/subscriptions/4d38ea20-7a50-4815-9c82-527d9f182f8b/providers/Microsoft.Web/locations/uksouth/managedApis/outlook'
            connectionId: connections_outlook_name_resource.id
            connectionName: 'outlook'
            connectionProperties: {}
          }
          keyvault: {
            id: '/subscriptions/4d38ea20-7a50-4815-9c82-527d9f182f8b/providers/Microsoft.Web/locations/uksouth/managedApis/keyvault'
            connectionId: connections_keyvault_1_name_resource.id
            connectionName: 'keyvault-1'
            connectionProperties: {
              authentication: {
                type: 'ManagedServiceIdentity'
              }
            }
          }
        }
      }
    }
  }
}
