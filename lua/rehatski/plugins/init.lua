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
	{ "tpope/vim-surround" },
	-- {
	-- 	"nvimdev/dashboard-nvim",
	-- 	event = "VimEnter",
	-- 	config = function()
	-- 		local logo = [[
	--    █████╗  ██████╗  ██████╗  ██████╗  ██╗███████╗███████╗███████╗
	--   ██╔══██╗██╔════╝ ██╔═████╗██╔═████╗███║██╔════╝██╔════╝╚════██║
	--   ███████║███████╗ ██║██╔██║██║██╔██║╚██║███████╗███████╗    ██╔╝
	--   ██╔══██║██╔═══██╗████╔╝██║████╔╝██║ ██║╚════██║╚════██║   ██╔╝
	--   ██║  ██║╚██████╔╝╚██████╔╝╚██████╔╝ ██║███████║███████║   ██║
	--   ╚═╝  ╚═╝ ╚═════╝  ╚═════╝  ╚═════╝  ╚═╝╚══════╝╚══════╝   ╚═╝
	-- 	      ]]
	--
	-- 		logo = string.rep("\n", 8) .. logo .. "\n\n"
	-- 		require("dashboard").setup({
	-- 			shortcut_type = "number",
	-- 			hide = {
	-- 				winbar = true,
	-- 				statusline = true,
	-- 				tabline = true,
	-- 			},
	-- 			footer = {},
	-- 			center = {},
	-- 			config = {
	-- 				header = vim.split(logo, "\n"),
	-- 			},
	-- 		})
	-- 	end,
	-- },
	-- "tpope/vim-rhubarb",
	-- "tpope/vim-sleuth",

	-- not a fan of this blankline
	--{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} }
}
