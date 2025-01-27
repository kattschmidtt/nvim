return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			-- Set the color scheme to mocha
			require("catppuccin").setup({
				flavour = "mocha", -- specify the flavour here
				background = { -- optional, set background light/dark
					light = "latte",
					dark = "mocha",
				},
			})
			vim.cmd("colorscheme catppuccin")
		end,
	},
}
