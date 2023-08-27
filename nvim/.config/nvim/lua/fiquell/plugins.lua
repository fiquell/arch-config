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
    use({ "codota/tabnine-nvim", run = "./dl_binaries.sh" })
    use("ThePrimeagen/harpoon")
    use("RRethy/vim-illuminate")
    use("numToStr/Comment.nvim")
    use("folke/neodev.nvim")

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
    use("rafamadriz/friendly-snippets")

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