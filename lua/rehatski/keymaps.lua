local global = vim.g
local keymap = vim.keymap

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

global.mapleader = " "
global.maplocalleader = " "

-- Copy Pasta from https://github.com/ehllie/dotfiles/blob/7d8d42b8f74b3d65fa986353050859e7cc6c0fa7/neovim/nvim/lua/keymaps.lua#L33-L40
-- TODO: Figure out how this is done
local function close_floating()
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local config = vim.api.nvim_win_get_config(win)
		if config.relative ~= "" then
			vim.api.nvim_win_close(win, false)
		end
	end
end

keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
keymap.set("i", "jj", "<ESC>")
keymap.set("n", "<leader>jj", function()
	close_floating()
end)

keymap.set("n", "x", '"_x')
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- Splits
keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")
keymap.set("n", "<leader>sx", ":close<CR>")

-- Nav Panes
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

-- Tabs
keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tx", ":tabclose<CR>")
keymap.set("n", "<leader>tn", ":tabn<CR>")
keymap.set("n", "<leader>tp", ":tabp<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- delete one word in insert mode (note that <C-h> sends the same ASCII escape sequence as <C-BS>)
--keymap.set('i', '<C-h>', '<C-w>', opts)

-- remap ^ and $ to H and L, respectively
keymap.set("n", "H", "^")
keymap.set("n", "L", "$")

-- open up lazy.nvim UI
keymap.set("n", "<leader>l", ":Lazy<CR>")

-- toggle undotree
--keymap.set('n', '<C-u>', ':UndotreeToggle<CR>', opts)

-- unbind <C-d> for now
--keymap.set('n', '<C-d>', '<nop>', opts)

-- close the current buffer
--keymap.set('n', '<C-x>', ':bd<CR>', opts)

-- quickly switch between buffers
keymap.set("n", "<", ":bp<CR>")
keymap.set("n", ">", ":bn<CR>")

-- quickly switch between windows
--keymap.set('n', '<C-h>', '<C-w>h', opts)
--keymap.set('n', '<C-l>', '<C-w>l', opts)

-- write to all buffers
--keymap.set('n', '<leader>w', ':wa<CR>', opts)

-- quit all buffers
--keymap.set('n', '<leader>q', ':qa<CR>', opts)

-- force quit all buffers
--keymap.set('n', '<leader>fq', ':qa!<CR>', opts)

-- clear search term when centering the cursor
--keymap.set('n', 'zz', 'zz:noh<CR>', opts)

-- toggle transparency
--keymap.set('n', '<C-t>', ':TransparentToggle<CR>', opts)

-- open up Themery
--keymap.set('n', '<leader>t', ':Themery<CR>', opts)

-- replace current word
--keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make current file an executable
--keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', opts)

-- keep cursor at front when appending lines below
--keymap.set('n', 'J', 'mzJ`z', opts)

-- select entire file with CTRL + A
--keymap.set('n', '<C-a>', 'ggVG', opts)

-- indent and outdent lines quickly
--keymap.set('n', '<TAB>', '>>', opts)
--keymap.set('n', '<S-TAB>', '<<', opts)

-- search movement keeps cursor in middle
--keymap.set('n', 'n', 'nzzzv', opts)
--keymap.set('n', 'N', 'Nzzzv', opts)

-- vertical movement keeps cursor in middle
--keymap.set('n', '<C-j>', '<C-d>zz', opts)
--keymap.set('n', '<C-k>', '<C-u>zz', opts)

-- creates a new line below the cursor and goes back into normal mode
--keymap.set('n', '<CR>', 'o<Esc>', opts)

-- creates a new line above the cursor and goes back into normal mode
--keymap.set('n', '<A-CR>', 'O<Esc>', opts)

-- quick resizing of buffers
--keymap.set('n', '<C-up>', ':resize -2<cr>', opts)
--keymap.set('n', '<C-down>', ':resize +2<cr>', opts)
--keymap.set('n', '<C-left>', ':vertical resize -2<cr>', opts)
--keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)
--
---- copy into system clipboard with CTRL + C
--keymap.set('v', '<C-c>', '"+y', opts)
--
---- copy into host system clipboard with <leader>y
--keymap.set('v', '<leader>y', '"*y', opts)
--
---- prevent x from copying over Vim clipboard
--keymap.set('n', 'x', '"_x', opts)
--
---- indent and outdent lines in visual mode
--keymap.set('v', '<TAB>', '<S->>gv', opts)
--keymap.set('v', '<S-TAB>', '<S-<>gv', opts)
--
---- the greatest remap ever (Primeagen)
--keymap.set('v', '<leader>p', '"_dP', opts)
--
---- move lines around
--keymap.set('v', 'J', ":m '>+1<CR>gv=gv", opts)
--keymap.set('v', 'K', ":m '<-2<CR>gv=gv", opts)
--
---- vertical movement keeps cursor in middle (visual mode)
--keymap.set('v', '<C-j>', '<C-d>zz', opts)
--keymap.set('v', '<C-k>', '<C-u>zz', opts)
--
---- prevent incrementing numbers in file (this is actually horrible)
--keymap.set('v', '<C-a>', 'ggVG', opts)
--
--keymap.set('v', '<C-d>', '"+ygvd', opts)
