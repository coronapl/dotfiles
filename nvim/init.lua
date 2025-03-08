-- Leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Relative numbers
vim.opt.relativenumber = true

-- Sync OS clipboard
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Show whitespaces
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Required by code companion
vim.opt.laststatus = 3

-- Open vertical splits to the right
vim.opt.splitright = true

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup 'plugins'

-- [[ Keymaps ]]
-- General
vim.keymap.set('i', 'jk', '<ESC>', { desc = 'Use jk for normal mode' })

-- Searching
local telescope = require 'telescope.builtin'
vim.keymap.set('n', '<leader>sf', telescope.find_files, { desc = 'Telescope Files' })
vim.keymap.set('n', '<leader>sg', telescope.live_grep, { desc = 'Telescope Grep' })
vim.keymap.set('n', '<leader>sh', telescope.help_tags, { desc = 'Telescope Help' })
vim.keymap.set('n', '<leader>/', function()
  telescope.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = 'Telescope Search' })

-- Buffers
vim.keymap.set('n', '<leader><leader>', telescope.buffers, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>n', ':bn<CR>', { desc = 'Buffer Next' })
vim.keymap.set('n', '<leader>p', ':bp<CR>', { desc = 'Buffer Previous' })

-- Advanced Buffers
vim.keymap.set('n', '<leader>bs', ':w<CR>', { desc = 'Buffer Save' })
vim.keymap.set('n', '<leader>bd', ':bd<CR>', { desc = 'Buffer Drop' })
vim.keymap.set('n', '<leader>bD', ':bd!<CR>', { desc = 'Buffer Drop Hard' })

-- Code Companion
vim.keymap.set('n', '<leader>cc', '<cmd>CodeCompanionChat Toggle<CR>', { desc = 'CodeCompanion Chat' })
vim.keymap.set('v', '<leader>cy', "<cmd>'<,'>CodeCompanionChat Add<CR>", { desc = 'CodeCompanion Yank' })
vim.keymap.set('v', '<leader>ce', "<cmd>'<,'>CodeCompanion /explain<CR>", { desc = 'CodeCompanion Explain' })
vim.keymap.set('v', '<leader>cf', "<cmd>'<,'>CodeCompanion /fix<CR>", { desc = 'CodeCompanion Fix' })
vim.keymap.set('v', '<leader>ct', "<cmd>'<,'>CodeCompanion /tests<CR>", { desc = 'CodeCompanion Test' })
vim.keymap.set('n', '<leader>g', '<cmd>CodeCompanionActions<CR>', { desc = 'CodeCompanion Telescope' })
