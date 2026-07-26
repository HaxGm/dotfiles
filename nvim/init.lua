-- Only options that differ from Neovim's defaults are set here. hlsearch,
-- incsearch, wildmenu, autoread and hidden are already on out of the box.

vim.g.mapleader = ' '             -- Space as <leader>; must be set before any mapping

-- Basic Settings
vim.opt.number = true             -- Show line numbers
vim.opt.relativenumber = true     -- Relative line numbers
vim.opt.tabstop = 4               -- Number of spaces tabs count for
vim.opt.shiftwidth = 4            -- Number of spaces for autoindent
vim.opt.expandtab = true          -- Use spaces instead of tabs
vim.opt.smartindent = true        -- Auto-indent new lines
vim.opt.wrap = false              -- Don't wrap long lines
vim.opt.mouse = 'a'               -- Enable mouse support
vim.opt.clipboard = 'unnamedplus' -- Sync with system clipboard

-- Search
vim.opt.ignorecase = true         -- Case-insensitive search
vim.opt.smartcase = true          -- But case-sensitive if search has caps

-- UI Improvements
vim.opt.showmatch = true          -- Highlight matching parentheses
vim.opt.cursorline = true         -- Highlight current line
vim.opt.wildmode = 'longest:full,full'

-- UX & Performance
vim.opt.termguicolors = true      -- Enable TrueColor support
vim.opt.scrolloff = 8             -- Keep 8 lines context top/bottom
vim.opt.sidescrolloff = 8         -- Keep 8 columns context left/right
vim.opt.splitbelow = true         -- Splits go down
vim.opt.splitright = true         -- Splits go right
vim.opt.signcolumn = "yes"        -- Prevent text jumping
vim.opt.updatetime = 50           -- Faster UI updates
vim.opt.undofile = true           -- Persistent undo history
vim.cmd('colorscheme vim')
