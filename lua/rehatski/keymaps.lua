-- Mode Referenceke
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

local global = vim.g
local keymap = vim.keymap

global.mapleader = " "
global.maplocalleader = " "

-- Copy Pasta from https://github.com/ehllie/dotfiles/blob/7d8d42b8f74b3d65fa986353050859e7cc6c0fa7/neovim/nvim/lua/keymaps.lua#L33-L40
-- TODO: Figure out how this is done, mainly used for vim.lsp.buf.hover
local function close_floating()
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local config = vim.api.nvim_win_get_config(win)
		if config.relative ~= "" then
			vim.api.nvim_win_close(win, false)
		end
	end
end

keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
keymap.set("i", "jj", "<ESC>", { desc = "my prefered esc alternative" })
keymap.set("n", "<leader>jj", function()
	close_floating()
end)

keymap.set("n", "x", '"_x', { desc = "prevents x from copying over Vim clipboard" })
keymap.set("v", "<leader>p", '"_dP', { desc = "delete and paste" })

-- Splits
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "spit vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "split horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "equalized splits" })
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", { desc = "maximize current split" })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "close split" })

-- Resizing Buffer Splits
keymap.set("n", "<A-up>", ":resize -2<cr>", { desc = "resize up" })
keymap.set("n", "<A-down>", ":resize +2<cr>", { desc = "resize down" })
keymap.set("n", "<A-left>", ":vertical resize -2<cr>", { desc = "resize left" })
keymap.set("n", "<A-Right>", ":vertical resize +2<CR>", { desc = "resize right" })

-- Nav Panes
keymap.set("n", "<C-h>", "<C-w>h", { desc = "pane to the right" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "pane below" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "pane above" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "pane to the left" })

-- Tabs
keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "new tab" })
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "close tab" })
keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "next tab" })
keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "previous tab" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

---- move lines around
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move lines down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move lines up" })

-- delete one word in insert mode (note that <C-h> sends the same ASCII escape sequence as <C-BS>)
--keymap.set('i', '<C-h>', '<C-w>', opts)

-- remap ^ and $ to H and L, respectively
keymap.set("n", "H", "^")
keymap.set("n", "L", "$")

-- open up lazy.nvim UI
keymap.set("n", "<leader>l", ":Lazy<CR>")
keymap.set("n", "<leader>b", vim.lsp.buf.format)
-- close the current buffer
--keymap.set('n', '<C-x>', ':bd<CR>', opts)

-- quickly switch between buffers (remap this to something else)
-- keymap.set("n", "<", ":bp<CR>")
-- keymap.set("n", ">", ":bn<CR>")

-- force quit all buffers
--keymap.set('n', '<leader>fq', ':qa!<CR>', opts)

-- replace current word
--keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make current file an executable
--keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', opts)

-- keep cursor at front when appending lines below
--keymap.set('n', 'J', 'mzJ`z', opts)

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

--
---- copy into system clipboard with CTRL + C
--keymap.set('v', '<C-c>', '"+y', opts)
--
---- copy into host system clipboard with <leader>y
--keymap.set('v', '<leader>y', '"*y', opts)
--
--
---- indent and outdent lines in visual mode
--keymap.set('v', '<TAB>', '<S->>gv', opts)
--keymap.set('v', '<S-TAB>', '<S-<>gv', opts)
--
----
--
--
---- vertical movement keeps cursor in middle (visual mode)
--keymap.set('v', '<C-j>', '<C-d>zz', opts)
--keymap.set('v', '<C-k>', '<C-u>zz', opts)
--
---- prevent incrementing numbers in file (this is actually horrible)
--keymap.set('v', '<C-a>', 'ggVG', opts)
--
--keymap.set('v', '<C-d>', '"+ygvd', opts)
