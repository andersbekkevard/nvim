-------------------------------------------------------------------------------
--
-- Core Keybinds (loaded immediately, not as a plugin)
--
-------------------------------------------------------------------------------

-- quick-save
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>')

-- Jump to start and end of line using the home row keys
vim.keymap.set('', 'H', '^')
vim.keymap.set('', 'L', '$')

-- greatest remap ever (modified)
vim.keymap.set("x", "p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>d", [["+d]])
vim.keymap.set("n", "<leader>D", [["+D]])

-- Paste from system clipboard after cursor/ replace selection
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])
-- Paste from system clipboard before cursor / replace selection
vim.keymap.set({ "n", "v" }, "<leader>P", [["+P]])

-- handy keymap for replacing up to next _ (like in variable names)
vim.keymap.set('n', '<leader>m', 'ct_')
-- handy keymap for replacing up to previous _ (like in variable names)
vim.keymap.set('n', '<leader>M', 'cT_')

-- always center search results
vim.keymap.set('n', 'n', 'nzz', { silent = true })
vim.keymap.set('n', 'N', 'Nzz', { silent = true })

-- Remap to center on vertical jump
vim.keymap.set('n', '<C-u>', "<C-u>zz")
vim.keymap.set('n', '<C-d>', "<C-d>zz")

-- make j and k move by visual line, not actual line, when text is soft-wrapped
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- Make escape undo search highlight without saving
vim.keymap.set('n', '<Esc>', '<cmd>noh<CR><Esc>', { silent = true })
-- Normal escape functionality from insert mode
vim.keymap.set('i', '<Esc>', '<Esc>', { silent = true })

-- More granularity in undoblocks
vim.keymap.set("i", "<Space>", "<Space><C-g>u")
vim.keymap.set("i", ".", ".<C-g>u")
vim.keymap.set("i", ",", ",<C-g>u")
vim.keymap.set("i", ";", ";<C-g>u")
vim.keymap.set("i", ":", ":<C-g>u")
vim.keymap.set("i", "!", "!<C-g>u")
vim.keymap.set("i", "?", "?<C-g>u")

-- Neovim-only keybinds
if not vim.g.vscode then
	-- Replace word under cursor with substitution pattern
	vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

	-- LazyGit
	vim.keymap.set('n', '<leader>lg', ":LazyGit<enter>", { desc = '[L]azy [G]it' })

	-- Buffer navigation (like Jon's setup)
	-- <leader><leader> toggles between current and previous buffer
	vim.keymap.set('n', '<leader><leader>', '<c-^>', { desc = 'Toggle between buffers' })
	-- + and ´ for sequential buffer navigation (shifted one step right)
	vim.keymap.set('n', '+', ':bp<cr>', { desc = 'Previous buffer' })
	vim.keymap.set('n', '´', ':bn<cr>', { desc = 'Next buffer' })
end
