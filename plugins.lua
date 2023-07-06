local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
  -- ======================================================================
  -- neils plugins
  -- ======================================================================
  {
    "lervag/vimtex",
    event = "BufRead",
    config = function()
      -- vim.g.onedark_config = {
      --   style = 'darker',
      -- }
      -- vim.cmd.colorscheme 'onedark'
      vim.g.vimtex_view_method = "skim"
    end,
  },
  {
    "ggandor/leap.nvim",
    dependencies = "tpope/vim-repeat",
    event = "BufRead",
    config = function()
      require("leap").add_default_mappings()
    end,
  },
  {
    "stevearc/resession.nvim",
    -- opts = {    },
    event = "BufEnter",
    config = function()
      print("blah")
      local resession = require("resession")
      resession.setup()

      vim.keymap.set('n', '<leader>Sr', resession.save)
      SaveDirSess = function()
        resession.save(vim.fn.getcwd(), { dir = "dirsession", notify = true })
	-- save_tab did nothing useful
        -- resession.save_tab(vim.fn.getcwd(), { dir = "dirsession", notify = true })
      end
      vim.keymap.set('n', '<leader>Ss', SaveDirSess)

      vim.keymap.set('n', '<leader>Sk', resession.load)
      LoadDirSess = function()
        resession.load(vim.fn.getcwd(), { dir = "dirsession" })
      end
      vim.keymap.set('n', '<leader>Sl', LoadDirSess)

      -- can we now get WhichKey working?
      local wk = require("which-key")
      wk.register({
        ["<leader>S"] = { name = "+session" },
	-- dont do the actual mapping, just add the labels
        ["<leader>Sr"] = { "Save named session" },
        ["<leader>Ss"] = { "Save directory session" },
        ["<leader>Sk"] = { "Load named session" },
        ["<leader>Sl"] = { "Load directory session" },
      })

      -- vim.keymap.set('n', '<leader>Sd', resession.delete)
      -- dont care about deleting directory-based sessions . . .
      -- what about functionality for arbitrarily-named sessions??
    end,
  },
}

return plugins
