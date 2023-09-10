vim.cmd.packadd("packer.nvim")

local packer = require("packer")
local util = require("packer.util")

return packer.startup({
  function(use)
    use("wbthomason/packer.nvim")
    use("nvim-lua/plenary.nvim")
    use("nvim-telescope/telescope.nvim")
    use("folke/tokyonight.nvim")
    use("nvim-lualine/lualine.nvim")
    use("ThePrimeagen/harpoon")
    use("RRethy/vim-illuminate")
    use("folke/neodev.nvim")
    use("lukas-reineke/indent-blankline.nvim")
    use("stevearc/oil.nvim")
    use({ "codota/tabnine-nvim", run = "./dl_binaries.sh" })
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install" })

    use("numToStr/Comment.nvim")
    use("JoosepAlviste/nvim-ts-context-commentstring")

    use("nvim-treesitter/nvim-treesitter")
    use("nvim-treesitter/playground")

    use("lewis6991/gitsigns.nvim")
    use("tpope/vim-fugitive")

    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lsp-signature-help")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("windwp/nvim-autopairs")

    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")

    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    use("neovim/nvim-lspconfig")
    use("glepnir/lspsaga.nvim")
    use("jose-elias-alvarez/null-ls.nvim")
  end,
  config = {
    display = {
      open_fn = function()
        return util.float({ border = "rounded" })
      end,
    },
  },
})
