return {
	{
		'luisiacc/gruvbox-baby',
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme 'gruvbox-baby'
		end,
	},
	'tpope/vim-rhubarb',
	'tpope/vim-sleuth',
	{ 'numToStr/Comment.nvim', opts = {} },
	--{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} }
}
