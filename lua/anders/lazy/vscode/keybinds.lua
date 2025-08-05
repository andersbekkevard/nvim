return {
	-------------------------------------------------------------------------------
	--
	-- VS Code Specific Keybinds
	--
	-------------------------------------------------------------------------------
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			-- H and L for line beginning/end (like $ and 0)
			vim.keymap.set({ "n", "v" }, "H", "^", { desc = "Go to line start" })
			vim.keymap.set({ "n", "v" }, "L", "$", { desc = "Go to line end" })
		end,
	},
}