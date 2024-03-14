vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Copy Pasta from https://github.com/ehllie/dotfiles/blob/7d8d42b8f74b3d65fa986353050859e7cc6c0fa7/neovim/nvim/lua/keymaps.lua#L33-L40
-- TODO: Figure out how this is done, mainly used for vim.lsp.buf.hover
local function close_floating()
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local config = vim.api.nvim_win_get_config(win)
		print(config)
		if config.relative ~= "" then
			vim.api.nvim_win_close(win, false)
		end
	end
end

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set("i", "jj", "<ESC>", { desc = "my prefered esc alternative" })
vim.keymap.set("n", "<leader>jj", function()
	close_floating()
end)

vim.keymap.set("n", "x", '"_x', { desc = "prevents x from copying over Vim clipboard" })
vim.keymap.set("v", "<leader>P", '"_dP', { desc = "delete and paste (need to select first)" })
vim.keymap.set("n", "<leader>p", 've"_dP', { desc = "delete and paste whole word" })
vim.keymap.set(
	"n",
	"<leader>r",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "replace current word uning substitute cmd" }
)
vim.keymap.set("n", "J", "mzJ`z", { desc = "" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "page down with centering" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "page up with centering" })
vim.keymap.set("n", "n", "nzzzv", { desc = "next with centering" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "previous with centering" })
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- Splits
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "spit vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "split horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "equalized splits" })
vim.keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", { desc = "maximize current split" })
vim.keymap.set("n", "<leader>sx", ":close<CR>", { desc = "close split" })

-- Resizing Buffer Splits
vim.keymap.set("n", "<A-up>", ":resize -2<cr>", { desc = "resize up" })
vim.keymap.set("n", "<A-down>", ":resize +2<cr>", { desc = "resize down" })
vim.keymap.set("n", "<A-left>", ":vertical resize -2<cr>", { desc = "resize left" })
vim.keymap.set("n", "<A-Right>", ":vertical resize +2<CR>", { desc = "resize right" })

-- Nav Panes
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "pane to the right" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "pane below" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "pane above" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "pane to the left" })

-- Tabs
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "new tab" })
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "close tab" })
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "next tab" })
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "previous tab" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

---- move lines around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move lines up" })

-- delete one word in insert mode (note that <C-h> sends the same ASCII escape sequence as <C-BS>)
--keymap.set('i', '<C-h>', '<C-w>', opts)

-- remap ^ and $ to H and L, respectively
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")

-- open up lazy.nvim UI
vim.keymap.set("n", "<leader>l", ":Lazy<CR>")
vim.keymap.set("n", "<leader>b", vim.lsp.buf.format)

-- close the current buffer
--keymap.set('n', '<C-x>', ':bd<CR>', opts)

-- quickly switch between buffers (remap this to something else)
-- keymap.set("n", "<", ":bp<CR>")
-- keymap.set("n", ">", ":bn<CR>")

-- force quit all buffers
--keymap.set('n', '<leader>fq', ':qa!<CR>', opts)

-- make current file an executable
--keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', opts)

-- creates a new line below the cursor and goes back into normal mode
vim.keymap.set("n", "<CR>", "o<Esc>")

-- creates a new line above the cursor and goes back into normal mode
vim.keymap.set("n", "<A-CR>", "O<Esc>")

--
---- copy into system clipboard with CTRL + C
--keymap.set('v', '<C-c>', '"+y', opts)
--
---- copy into host system clipboard with <leader>y
--keymap.set('v', '<leader>y', '"*y', opts)
--
--
