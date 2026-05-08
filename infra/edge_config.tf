# Lysander-CDM Infrastructure Stabilization
# Provider: Cloudflare / AWS Edge

resource "edge_script" "lysander_flow" {
  name    = "lysander-cdm-flow-handler"
  content = file("../edge/flow_handler.js")
}

resource "edge_route" "primary_anchor" {
  pattern     = "flow.lysander-cdm.io/*"
  script_name = edge_script.lysander_flow.name
}

output "status" {
  value = "INFRASTRUCTURE_STABILIZED - Grid Locked"
}
