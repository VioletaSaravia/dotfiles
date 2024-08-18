vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)
require('lazy').setup({
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = {
                    'markdown', 'markdown_inline', "gdscript",
                    "c", "go", "cpp", "lua", "vim", 'comment',
                    "vimdoc", "query", "elixir", "javascript", "html",
                    "rust", "css"
                },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
    {
        'nvim-tree/nvim-tree.lua',
        config = function()
            require('nvim-tree').setup()
            vim.cmd [[
                highlight Normal guibg=NONE
                highlight NormalNC guibg=NONE
                highlight NonText guibg=NONE
                highlight LineNr guibg=NONE ctermbg=NONE
                highlight Folded guibg=NONE ctermbg=NONE
                highlight EndOfBuffer guibg=NONE ctermbg=NONE
            ]]
        end,
    },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function() require("nvim-surround").setup({}) end
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true,
        opts = {}
    },
    {
        'mbbill/undotree'
    },
    {
        'folke/which-key.nvim',
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme('catppuccin-macchiato')
            vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
            vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
            vim.cmd [[
                highlight Normal guibg=NONE
                highlight NormalNC guibg=NONE
                highlight NonText guibg=NONE
                highlight LineNr guibg=NONE ctermbg=NONE
                highlight Folded guibg=NONE ctermbg=NONE
                highlight EndOfBuffer guibg=NONE ctermbg=NONE

                " Set transparent background for nvim-tree
                highlight NvimTreeNormal guibg=NONE ctermbg=NONE
                highlight NvimTreeEndOfBuffer guibg=NONE ctermbg=NONE
            ]]
        end
    }
}, {})

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.backup = false
-- FIXME: Windows only
-- vim.opt.undodir = os.getenv('APPDATA') .. "/nvim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'

vim.opt.updatetime = 50

vim.opt.relativenumber = true
vim.opt.number = true

-- Key mappings for moving between windows
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>wc', '<cmd>wincmd =<CR>', { desc = 'Center windows' })
vim.keymap.set('n', '<leader>wh', '<C-w>s', { desc = 'Split window horizontally' })
vim.keymap.set('n', '<leader>wv', '<C-w>v', { desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>wq', '<C-w>q', { desc = 'Quit window' })

vim.api.nvim_set_keymap('n', '<Leader>b', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'ñ', ':', { noremap = true, silent = false })

vim.keymap.set('n', "J", 'mzJ`z')

vim.keymap.set('x', '<leader>p', '\"_dP')
vim.keymap.set('n', '<leader>y', '\"+y')
vim.keymap.set('v', '<leader>y', '\"+y')
vim.keymap.set('n', '<leader>Y', '\"+Y')

vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format() end)
-- vim.api.nvim_create_autocmd('BufWritePre', {
--     group = vim.api.nvim_create_augroup('FormatOnSave', { clear = true }),
--     callback = function() vim.lsp.buf.format() end
-- })

