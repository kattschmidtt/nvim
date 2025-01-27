return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")

		-- Color table for highlights (Catppuccin Mocha colors)
		local colors = {
			bg = "#1e1e2e",
			fg = "#C6D0F5",
			yellow = "#F9E2AF", -- Mocha Yellow
			cyan = "#74C7EC", -- Mocha Cyan
			darkblue = "#112638", -- Mocha Dark Blue
			green = "#A6E3A1", -- Mocha Green
			orange = "#FF9E64", -- Mocha Orange
			violet = "#A9A1E1", -- Mocha Violet
			magenta = "#F5C2E7", -- Mocha Pink
			blue = "#74C7EC", -- Mocha Blue
			red = "#F38BA8", -- Mocha Red
			inactive_bg = "#2A2A37", -- Inactive background color
		}

		local bubble_theme = {
			normal = {
				a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			insert = {
				a = { bg = colors.green, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			visual = {
				a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			command = {
				a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			replace = {
				a = { bg = colors.red, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			inactive = {
				a = { bg = colors.inactive_bg, fg = colors.fg, gui = "bold" },
				b = { bg = colors.inactive_bg, fg = colors.fg },
				c = { bg = colors.inactive_bg, fg = colors.fg },
			},
		}

		-- configure lualine with the custom bubble theme and emojis
		lualine.setup({
			options = {
				theme = bubble_theme,
				icons_enabled = true, -- Enable icons (you already have nvim-web-devicons)
			},
			sections = {
				-- Left section (mode with tabby cat emoji before)
				lualine_a = {
					{
						"mode",
						fmt = function(str)
							local modes = {
								n = "", -- Normal
								i = " 🐈 ", -- Insert
								v = "", -- Visual
								c = "", -- Command
								R = "", -- Replace
							}
							return modes[str:sub(1, 1)] or str
						end,
					},
				},
				-- Middle section (file name with tabby cat emoji before)
				lualine_b = {
					"filename",
					fmt = function(str)
						return "🦦 🐈 " .. str -- Add the tabby cat emoji before the file name
					end,
				},
				-- Right section (encoding, fileformat, filetype, updates)
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = colors.red },
						fmt = function(str)
							return " " .. str -- Add emoji for updates
						end,
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
				-- Additional section (clock or other indicators)
				lualine_y = {
					{
						"fileformat",
						fmt = function(str)
							return "🐈" .. str -- Add the keyboard emoji here
						end,
					},
				},
				-- Change location section to use an otter emoji
				lualine_z = {
					{
						"location",
						fmt = function(str)
							return "🦦 " .. str -- Use the otter emoji for location
						end,
					},
				},
			},
		})
	end,
}
