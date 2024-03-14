return {
	{
		-- 'luisiacc/gruvbox-baby',
		-- "savq/melange-nvim",
		-- 'rose-pine/neovim',
		-- "folke/tokyonight.nvim",
		"ellisonleao/gruvbox.nvim",
		-- 'catppuccin/nvim',
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme('rose-pine')
			-- vim.cmd.colorscheme('gruvbox-baby')
			-- vim.cmd.colorscheme("melange")
			vim.cmd.colorscheme("gruvbox")
			-- vim.cmd.colorscheme("tokyonight")
			-- vim.cmd.colorscheme('catppuccin')
		end,
	},
	{
		"mbbill/undotree",
		lazy = true,
		cmd = "UndotreeToggle",
		config = function()
			vim.keymap.set("n", "<leader>uu", "<cmd>UndotreeToggle<CR>")
		end,
	},
	{ "tpope/vim-surround" },
	{
		"gelguy/wilder.nvim",
		config = function()
			require("wilder").setup({ modes = { ":", "/", "?" } })
		end,
	},
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
}
-- "tpope/vim-rhubarb",
-- "tpope/vim-sleuth",

-- not a fan of this blankline
--{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} }
