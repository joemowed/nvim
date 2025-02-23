require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "cpp" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.

    -- Instead of true it can also be a list of languages
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
require("nvim-treesitter.configs").setup({
    textobjects = {
        move = {
            enable = true,
            set_jumps = true,
            goto_previous_start = {
                ["[["] = "@parameter.inner",
            },
            goto_next_start = {
                ["]]"] = "@parameter.inner",
            },
        },
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["iq"] = "@parameter.inner",
                ["aq"] = "@parameter.outer",
            }
        }
    }
})
