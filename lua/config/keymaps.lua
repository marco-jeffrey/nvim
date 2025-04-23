local set = vim.keymap.set

set("i", "<C-\\>", " =>{<CR>}<Esc><S-O>", {noremap=false})
set("i", "jk", "<Esc>l", {noremap=false})

set('n', '<leader>t', function()
    print("Current time: " .. os.date('%H:%M:%S'))
end, { desc = 'Show current time' })

-- Neotree
set("n", "<Leader>e", ":Neotree toggle<CR>")
set("n", "<Leader>be", ":Neotree source=buffers<CR>")

-- Window management mappings
set('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
set('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })
set('n', '<C-j>', '<C-w>j', { desc = 'Move to bottom window' })
set('n', '<C-k>', '<C-w>k', { desc = 'Move to top window' })




