local disabled_plugins = {
  "folke/noice.nvim",
}

-- build the disable plugin spec
local disabled = {}
for _, plugin in pairs(disabled_plugins) do
  table.insert(disabled, { plugin, enabled = false })
end
return disabled
