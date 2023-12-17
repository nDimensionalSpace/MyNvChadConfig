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
    ["<leader>B"] = { "+buffer manipulation" },
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
  -- ======================================================================
  -- mappings for persistence
  -- ======================================================================
  --  ["<leader>ss"] = { "<cmd>lua require('persistence').load()<cr>", "Reload last session for dir" },
  --  ["<leader>sl"] = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  --  ["<leader>sQ"] = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },

  },
}


return M
