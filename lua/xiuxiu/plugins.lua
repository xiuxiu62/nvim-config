local function packer_bootstrap()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer = require("packer")

local function setup(use)
    use("wbthomason/packer.nvim")

    if packer_bootstrap() then
        packer.sync()
    end


    use({
        "folke/tokyonight.nvim",
        config = function()
            vim.cmd("colorscheme tokyonight-night")
        end
    })

    -- Color scheme
    use("rebelot/kanagawa.nvim")

    use({
        "nvim-treesitter/nvim-treesitter",
        { run = ":TSUpdate" },
    })
    use("nvim-treesitter/playground")

    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        requires = { { "nvim-lua/plenary.nvim" } }
    })

    use({
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup()
        end
    })

    use({
        "akinsho/bufferline.nvim",
        tag = "v3.*",
        requires = "nvim-tree/nvim-web-devicons"
    })

    use({
        "nvim-lualine/lualine.nvim",
        requires = "nvim-tree/nvim-web-devicons"
        -- requires = { "kyazdani42/nvim-web-devicons", opt = true }
    })

    -- Startup screen
    use({
        "glepnir/dashboard-nvim",
        event = "VimEnter",
        config = function()
            require('dashboard').setup {
                -- config
            }
        end,
        requires = { 'nvim-tree/nvim-web-devicons' }
    })

    use("theprimeagen/harpoon")
    use("mbbill/undotree")
    use("numToStr/Comment.nvim")

    -- Git integration
    use("mhinz/vim-signify")
    use("tpope/vim-fugitive")
    use("tpope/vim-rhubarb")
    use("junegunn/gv.vim")

    use({
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                run = function()
                    ---@diagnostic disable-next-line: param-type-mismatch
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    })
    use("folke/neodev.nvim")
    use({
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
    })

    use('nvim-orgmode/orgmode')
end

return packer.startup(setup)
