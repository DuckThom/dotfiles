-- Set up lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    {
      "utilyre/barbecue.nvim",
      name = "barbecue",
      version = "*",
      dependencies = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons", -- optional dependency
      },
      opts = {
        -- configurations go here
      },
    },
    {
      "neovim/nvim-lspconfig",
      opts = {
        inlay_hints = { enabled = true },
        capabilities = {
          workspace = {
            didChangeWatchedFiles = {
              dynamicRegistration = false,
            },
          },
        },
        ---@type lspconfig.options
        servers = {
          cssls = {},
          dockerls = {},
           tailwindcss = {
            root_dir = function(...)
              return require("lspconfig.util").root_pattern(".git")(...)
            end,
          },
          tsserver = {
            -- root_dir = function(...)
            --   return require("lspconfig.util").root_pattern(".git")(...)
            -- end,
            single_file_support = false,
            settings = {
              typescript = {
                inlayHints = {
                  includeInlayParameterNameHints = "literal",
                  includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                  includeInlayFunctionParameterTypeHints = true,
                  includeInlayVariableTypeHints = false,
                  includeInlayPropertyDeclarationTypeHints = true,
                  includeInlayFunctionLikeReturnTypeHints = true,
                  includeInlayEnumMemberValueHints = true,
                },
              },
              javascript = {
                inlayHints = {
                  includeInlayParameterNameHints = "all",
                  includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                  includeInlayFunctionParameterTypeHints = true,
                  includeInlayVariableTypeHints = true,
                  includeInlayPropertyDeclarationTypeHints = true,
                  includeInlayFunctionLikeReturnTypeHints = true,
                  includeInlayEnumMemberValueHints = true,
                },
              },
            },
          },
          html = {},
        },
       setup = {},
      }
    }
  },
  install = { colorscheme = { "tokyonight" } },
  checker = { enabled = true },
})

-- Enable line numbers
vim.opt.number = true
vim.opt.relativenumber = false

-- Set indenting options
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Set theme
--vim.cmd[[colorscheme tokyonight-moon]]

require('barbecue').setup {
  theme = 'tokyonight',
}

require('lualine').setup {
  options = {
    theme = 'tokyonight'
  }
}

-- Setup keymaps
vim.keymap.set('n', '\\', '<cmd>Neotree reveal<cr>')
vim.keymap.set('n', '<Leader>g', '<cmd>Neotree float git_status<cr>')
