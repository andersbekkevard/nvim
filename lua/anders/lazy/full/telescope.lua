return {
	-------------------------------------------------------------------------------
	--
	-- Telescope
	--
	-------------------------------------------------------------------------------
	{
		"nvim-telescope/telescope.nvim",
		-- Remove tag to get latest version
		dependencies = {
			"nvim-lua/plenary.nvim"
		},
		config = function()
			-- Suppress deprecated API warnings by setting deprecation level
			vim.deprecate = function() end

			require('telescope').setup({})

			local builtin = require('telescope.builtin')
			-- TODO Rethink these keybinds
			vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
			vim.keymap.set('n', '<C-p>', builtin.git_files, {})
			vim.keymap.set('n', '<leader>sws', function()
				local word = vim.fn.expand("<cword>")
				builtin.grep_string({ search = word })
			end)
			vim.keymap.set('n', '<leader>sWs', function()
				local word = vim.fn.expand("<cWORD>")
				builtin.grep_string({ search = word })
			end)
			vim.keymap.set('n', '<leader>sg', function()
				builtin.grep_string({ search = vim.fn.input("Grep > ") })
			end)
			vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
		end
	},
}
