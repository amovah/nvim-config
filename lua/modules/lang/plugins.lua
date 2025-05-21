local conf = require("modules.lang.config")

return {
  {
    "mason-org/mason.nvim",
    config = conf.mason,
  },
  {
    "neovim/nvim-lspconfig",
    config = conf.lsp_setup,
    dependencies = {
      "mason-org/mason.nvim",
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    config = conf.mason_lsp,
    dependencies = {
      "neovim/nvim-lspconfig",
      "mason-org/mason.nvim",
    },
  },
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.*",
    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = {
        preset = "enter",
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<Tab>"] = { "select_next", "fallback" },
      },
      -- (Default) Only show the documentation popup when manually triggered
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 0,
        },
        menu = {
          -- Don't automatically show the completion menu
          auto_show = true,

          -- nvim-cmp style menu
          draw = {
            treesitter = {
              "lsp",
            },
            columns = {
              { "label",     "label_description", gap = 1 },
              { "kind_icon", "kind",              gap = 1 },
            },
          },
        },
      },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },

      -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
      -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
      --
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "prefer_rust_with_warning" },
      signature = {
        enabled = true,
      },
    },
    opts_extend = { "sources.default" },
  },
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvimtools/none-ls-extras.nvim",
      "neovim/nvim-lspconfig",
    },
    config = conf.none_ls,
  },
  {
    "nvimdev/lspsaga.nvim",
    config = conf.lspsaga,
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
    },
  },
  {
    "j-hui/fidget.nvim",
    config = conf.fidget,
  },
  {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    run = ":TSUpdate",
    config = conf.nvim_treesitter,
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
      "andymass/vim-matchup",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = conf.nvim_treesitter_context,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    lazy = true,
    config = conf.refactoring,
  },
  {
    "folke/trouble.nvim",
    lazy = true,
    cmd = { "Trouble" },
    config = conf.trouble,
  },
  {
    "yanskun/gotests.nvim",
    lazy = true,
    cmd = { "GoTests", "GoTestsAll" },
    config = conf.gotests,
  },
}
