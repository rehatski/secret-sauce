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
		"m4xshen/hardtime.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		opts = {},
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
}
-- "tpope/vim-rhubarb",
-- "tpope/vim-sleuth",

-- not a fan of this blankline
--{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} }
