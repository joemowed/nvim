require("notify").setup({
    background_colour = '#000000'

    ,
    on_open = function(win)
        vim.api.nvim_win_set_config(win, { focusable = false })
    end
})
local vim_notify = vim.notify
vim.notify = function(msg, level, opts)
    if msg == 'No information available' then
        return
    end

    return vim_notify(msg, level, opts)
    -- Or with `rcarriga/nvim-notify`
    -- return require('notify').notify(msg, level, opts)
end
