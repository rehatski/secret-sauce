return {
	{
		--'luisiacc/gruvbox-baby',
		-- "catppuccin/nvim",
		'rose-pine/neovim',
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme 'rose-pine'
			-- vim.cmd.colorscheme 'gruvbox-baby'
			-- vim.cmd.colorscheme 'catppuccin'
		end,
	},
	'tpope/vim-rhubarb',
	'tpope/vim-sleuth',
	--{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} }
}
