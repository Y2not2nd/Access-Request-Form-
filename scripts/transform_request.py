#!/usr/bin/env python3
import json
import argparse

parser = argparse.ArgumentParser(description="Transform TRE request to ARM parameters")
parser.add_argument("--input", required=True)
parser.add_argument("--config", required=True)
parser.add_argument("--output", required=True)
args = parser.parse_args()

with open(args.input) as f:
    request = json.load(f)

with open(args.config) as f:
    config = json.load(f)

# Derive workspace name
workspace_name = request.get("workspaceName", "").lower()

# Derive department (used for RG naming, not template parameters)
department = request.get("requester", {}).get("department", "unknown").lower()

# Deterministic RG name (execution metadata, not ARM parameter)
resource_group_name = f"rg-tre-{department}"

# Canonical tag set
tags = {
    "CostCentre": "TRE",
    "DataClassification": "restricted",
    "Environment": "research",
    "Owner": "TRE-Platform",
    "System": "TRE"
}

# ARM deployment parameters (MUST match Template Spec exactly)
parameters = {
    "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {
        "workspaceName": {
            "value": workspace_name
        },
        "location": {
            "value": config["location"]
        },
        "privateEndpointSubnetId": {
            "value": config["network"]["privateEndpointSubnetId"]
        },
        "privateDnsSubscriptionId": {
            "value": config["dns"]["privateDnsSubscriptionId"]
        },
        "privateDnsResourceGroupName": {
            "value": config["dns"]["privateDnsResourceGroupName"]
        },
        "tags": {
            "value": tags
        }
    }
}

with open(args.output, "w") as f:
    json.dump(parameters, f, indent=2)

# Execution metadata logging (for GitHub Actions / audit)
print(f"Workspace: {workspace_name}")
print(f"Derived Resource Group: {resource_group_name}")
print("Owner tag: TRE-Platform")
