vim.opt.termguicolors = true
vim.diagnostic.config({ virtual_text = true })
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
vim.opt.softtabstop = 4
vim.cmd [[set formatoptions-=cro]]
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
--build auto-ocd project
vim.keymap.set("n", "<leader>d", ":wa<CR>:terminal auto-ocd -b<CR>")
vim.keymap.set("n", "<leader>pv", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>lrr", ":lua vim.api.nvim_win_set_width(0,170)<CR>")
vim.keymap.set("n", "<leader>q", ":wa<CR>:q<CR>")
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down" })
vim.keymap.set('n', '<Leader>w', ':wa<CR>')
vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
    desc = 'return cursor to where it was last time closing the file',
    pattern = '*',
    command = 'silent! normal! g`"zv',
})
