local use = require('packer').use
require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use 'tpope/vim-sensible'
	use 'tpope/vim-surround'
	use 'tpope/vim-fugitive'
	use 'tpope/vim-obsession'
	use 'mechatroner/rainbow_csv'
    use 'nvim-lualine/lualine.nvim'
    use 'folke/tokyonight.nvim'
	use 'junegunn/fzf.vim'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
    use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
        }
    }
    use 'theprimeagen/harpoon'
    use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {                                      -- Optional
          'williamboman/mason.nvim',
          run = function()
            pcall(vim.cmd, 'MasonUpdate')
          end,
        },
        {'williamboman/mason-lspconfig.nvim'}, -- Optional 
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'saadparwaiz1/cmp_luasnip'},
        {'L3MON4D3/LuaSnip'},     -- Required
      }
    }
end)
require('lualine').setup{}
require('journal_help')

vim.opt.syntax = on
vim.opt.filetype = on

vim.opt.termguicolors = true
vim.cmd("colorscheme tokyonight-night")
vim.opt.background = dark

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true

vim.cmd("set clipboard=unnamed")
vim.cmd("set colorcolumn=80,100")

vim.cmd("set listchars=tab:>-,trail:.,eol:¬,extends:>,precedes:<,space:·")
vim.cmd("set list")

vim.api.nvim_set_keymap('i','jk',     '<Esc>',     { noremap = true })
vim.api.nvim_set_keymap('n','<Up>',   '<Nop>',     { noremap = true })
vim.api.nvim_set_keymap('n','<Down>', '<Nop>',     { noremap = true })
vim.api.nvim_set_keymap('n','<Left>', '<Nop>',     { noremap = true })
vim.api.nvim_set_keymap('n','<Right>','<Nop>',     { noremap = true })
vim.api.nvim_set_keymap('n','<C-J>',  '<C-W><C-J>',{ noremap = true })
vim.api.nvim_set_keymap('n','<C-K>',  '<C-W><C-K>',{ noremap = true })
vim.api.nvim_set_keymap('n','<C-L>',  '<C-W><C-L>',{ noremap = true })
vim.api.nvim_set_keymap('n','<C-H>',  '<C-W><C-H>',{ noremap = true })

vim.api.nvim_set_keymap('n','<leader>ev', ':vsplit $MYVIMRC<cr>',  { noremap = true })
vim.api.nvim_set_keymap('n','<leader>ff', ':Telescope find_files<cr>', { noremap = true })
vim.api.nvim_set_keymap('n','<leader>gf', ':Telescope git_files<cr>' , { noremap = true })
vim.api.nvim_set_keymap('n','<leader>ls', ':Telescope buffers<cr>', { noremap = true })
vim.api.nvim_set_keymap('n','<leader>nt', ':Neotree<cr>', { noremap = true })
vim.api.nvim_set_keymap('n','<leader>bd', ':%bd|e#|bd#<cr>', { noremap = true })
