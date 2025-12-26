{
    "definition": {
        "$schema": "https://schema.management.azure.com/providers/Microsoft.Logic/schemas/2016-06-01/workflowdefinition.json#",
        "contentVersion": "1.0.4.0",
        "triggers": {
            "When_an_HTTP_request_is_received": {
                "type": "Request",
                "kind": "Http",
                "inputs": {
                    "method": "POST",
                    "schema": {
                        "type": "object",
                        "required": [
                            "workspaceName",
                            "owner"
                        ],
                        "properties": {
                            "workspaceName": {
                                "type": "string",
                                "minLength": 3
                            },
                            "owner": {
                                "type": "string"
                            },
                            "intakeData": {
                                "type": "object",
                                "description": "Rich intake data from the frontend form for governance and auditing"
                            }
                        }
                    }
                }
            }
        },
        "actions": {
            "Initialize_variables": {
                "runAfter": {},
                "type": "InitializeVariable",
                "inputs": {
                    "variables": [
                        {
                            "name": "requestId",
                            "type": "string",
                            "value": "@{guid()}"
                        },
                        {
                            "name": "researchTags",
                            "type": "object",
                            "value": {
                                "CostCentre": "TRE",
                                "System": "TRE",
                                "Environment": "research",
                                "DataClassification": "restricted",
                                "Owner": "Yassin"
                            }
                        },
                        {
                            "name": "internalExecutionKey",
                            "type": "string",
                            "value": "dfdf"
                        },
                        {
                            "name": "location",
                            "type": "string",
                            "value": "uksouth"
                        },
                        {
                            "name": "privateEndpointSubnetId",
                            "type": "string",
                            "value": "/subscriptions/4d38ea20-7a50-4815-9c82-527d9f182f8b/resourceGroups/rg-tre-network-uksouth/providers/Microsoft.Network/virtualNetworks/vnet-tre-uksouth/subnets/snet-privateendpoints"
                        },
                        {
                            "name": "privateDnsSubscriptionId",
                            "type": "string",
                            "value": "4d38ea20-7a50-4815-9c82-527d9f182f8b"
                        },
                        {
                            "name": "privateDnsResourceGroupName",
                            "type": "string",
                            "value": "rg-tre-dns-uksouth"
                        },
                        {
                            "name": "templateSpecId",
                            "type": "string",
                            "value": "/subscriptions/4d38ea20-7a50-4815-9c82-527d9f182f8b/resourceGroups/rg-tre-mgmt-uksouth/providers/Microsoft.Resources/templateSpecs/tre-workspace-template/versions/1.0.0"
                        }
                    ]
                }
            },
            "Validate_workspace_name": {
                "actions": {
                    "Response_Accepted": {
                        "type": "Response",
                        "inputs": {
                            "statusCode": 202,
                            "headers": {
                                "Content-Type": "application/json"
                            },
                            "body": {
                                "status": "Request received",
                                "message": "Your workspace request has been submitted and is pending approval",
                                "requestId": "@{variables('requestId')}",
                                "workspaceName": "@{triggerBody()?['workspaceName']}",
                                "owner": "@{triggerBody()?['owner']}"
                            }
                        }
                    },
                    "Send_approval_email": {
                        "runAfter": {
                            "Response_Accepted": [
                                "Succeeded"
                            ]
                        },
                        "type": "ApiConnectionWebhook",
                        "inputs": {
                            "host": {
                                "connection": {
                                    "name": "@parameters('$connections')['outlook']['connectionId']"
                                }
                            },
                            "body": {
                                "NotificationUrl": "@listCallbackUrl()",
                                "Message": {
                                    "To": "yassin_123@hotmail.co.uk",
                                    "Subject": "TRE – Research Workspace Request Approval",
                                    "Importance": "Normal",
                                    "Options": "Approve, Reject",
                                    "Body": "A Trusted Research Environment request requires approval.\n\nRequest ID:\n@{variables('requestId')}\n\nRequested by:\n@{triggerBody()?['owner']}\n\nWorkspace name:\n@{triggerBody()?['workspaceName']}\n\nRequester Name:\n@{triggerBody()?['intakeData']?['requesterDetails']?['name']}\n\nDepartment:\n@{triggerBody()?['intakeData']?['requesterDetails']?['department']}\n\nRequest Type:\n@{triggerBody()?['intakeData']?['requestClassification']?['requestType']}\n\nUrgency:\n@{triggerBody()?['intakeData']?['requestClassification']?['urgency']}\n\nJustification:\n@{triggerBody()?['intakeData']?['requestClassification']?['businessJustification']}\n\nPlease approve or reject."
                                }
                            },
                            "path": "/approvalmail/$subscriptions"
                        }
                    },
                    "Approval_decision": {
                        "actions": {
                            "Call_Deployment_Logic_App": {
                                "type": "Http",
                                "inputs": {
                                    "method": "POST",
                                    "uri": "https://prod-03.uksouth.logic.azure.com:443/workflows/1a5d35392a594f2ea8e53d12accc8231/triggers/When_an_HTTP_request_is_received/paths/invoke?api-version=2016-10-01&sp=%2Ftriggers%2FWhen_an_HTTP_request_is_received%2Frun&sv=1.0&sig=LvnpxYV1cySZ_m0D63rwEedqDT3mtUHRZnme_w5kbkI",
                                    "headers": {
                                        "Content-Type": "application/json",
                                        "x-tre-internal-key": "@{variables('internalExecutionKey')}"
                                    },
                                    "body": {
                                        "requestId": "@{variables('requestId')}",
                                        "workspaceName": "@{triggerBody()?['workspaceName']}",
                                        "owner": "@{triggerBody()?['owner']}",
                                        "location": "@{variables('location')}",
                                        "researchTags": "@{variables('researchTags')}",
                                        "network": {
                                            "privateEndpointSubnetId": "@{variables('privateEndpointSubnetId')}"
                                        },
                                        "dns": {
                                            "privateDnsSubscriptionId": "@{variables('privateDnsSubscriptionId')}",
                                            "privateDnsResourceGroupName": "@{variables('privateDnsResourceGroupName')}"
                                        },
                                        "templateSpec": {
                                            "id": "@{variables('templateSpecId')}"
                                        }
                                    }
                                }
                            }
                        },
                        "runAfter": {
                            "Send_approval_email": [
                                "Succeeded"
                            ]
                        },
                        "else": {
                            "actions": {}
                        },
                        "expression": {
                            "equals": [
                                "@body('Send_approval_email')?['SelectedOption']",
                                "Approve"
                            ]
                        },
                        "type": "If"
                    }
                },
                "runAfter": {
                    "Initialize_variables": [
                        "Succeeded"
                    ]
                },
                "else": {
                    "actions": {
                        "Response_Invalid": {
                            "type": "Response",
                            "inputs": {
                                "statusCode": 400,
                                "headers": {
                                    "Content-Type": "application/json"
                                },
                                "body": {
                                    "status": "Invalid",
                                    "message": "Invalid workspace name. Must be at least 3 characters."
                                }
                            }
                        }
                    }
                },
                "expression": {
                    "greaterOrEquals": [
                        "@length(triggerBody()?['workspaceName'])",
                        3
                    ]
                },
                "type": "If"
            }
        },
        "outputs": {},
        "parameters": {
            "$connections": {
                "type": "Object",
                "defaultValue": {}
            }
        }
    },
    "parameters": {
        "$connections": {
            "type": "Object",
            "value": {
                "outlook": {
                    "id": "/subscriptions/4d38ea20-7a50-4815-9c82-527d9f182f8b/providers/Microsoft.Web/locations/uksouth/managedApis/outlook",
                    "connectionId": "/subscriptions/4d38ea20-7a50-4815-9c82-527d9f182f8b/resourceGroups/rg-tre-mgmt-uksouth/providers/Microsoft.Web/connections/outlook",
                    "connectionName": "outlook",
                    "connectionProperties": {}
                }
            }
        }
    }
}
