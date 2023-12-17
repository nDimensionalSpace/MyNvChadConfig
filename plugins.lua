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
  -- {
  --   "folke/persistence.nvim",
  --   event = "bufreadpre",
  --   config = function()
  --     require("persistence").setup {
  --       dir = vim.fn.expand(vim.fn.stdpath "state" .. "/sessions/"),
  --       options = { "buffers", "curdir", "tabpages", "winsize" },
  --     }
  --   end,
  -- },
  {
    "rmagatti/auto-session",
    -- opts = {    },
    event = "BufEnter",
    config = function()
      local auto_session = require("auto-session")
      auto_session.setup({
        log_level = "error",
        auto_session_suppress_dirs = { "~/.", "~/DesktopNoSync", "~/Desktop" },
      })

   --    vim.keymap.set('n', '<leader>Sr', resession.save)
   --    vim.keymap.set('n', '<leader>Ss', 
   --      function()
   --        resession.save(vim.fn.getcwd(), { dir = "dirsession", notify = true })
	  -- -- save_tab did nothing useful
   --        -- resession.save_tab(vim.fn.getcwd(), { dir = "dirsession", notify = true })
   --      end
   --    )
			--
   --    vim.keymap.set('n', '<leader>Sk', resession.load)
   --    vim.keymap.set('n', '<leader>Sl', 
   --      function()
   --        resession.load(vim.fn.getcwd(), { dir = "dirsession", silence_errors = false, reset = true })
   --      end
   --    )

      -- can we now get WhichKey working?
 --      local wk = require("which-key")
 --      wk.register({
 --        ["<leader>S"] = { name = "+session" },
	-- -- dont do the actual mapping, just add the labels
 --        ["<leader>Sr"] = { "Save named session" },
 --        ["<leader>Ss"] = { "Save directory session" },
 --        ["<leader>Sk"] = { "Load named session" },
 --        ["<leader>Sl"] = { "Load directory session" },
 --      })

      -- vim.keymap.set('n', '<leader>Sd', resession.delete)
      -- dont care about deleting directory-based sessions . . .
      -- what about functionality for arbitrarily-named sessions??
    end,
  },
}

return plugins
