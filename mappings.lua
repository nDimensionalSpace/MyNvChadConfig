---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

-- more keybinds!
M.neils_keybindings = {
  n = {
    ["<leader>Bl"] = {
      function()
        require("nvchad_ui.tabufline").move_buf(-1)
      end,
      "move buffer tab to the left", opts = { nowait = true } },
    ["<leader>Br"] = {
      function()
        require("nvchad_ui.tabufline").move_buf(1)
      end,
      "move buffer tab to the right", opts = { nowait = true } },
  },
}


return M
