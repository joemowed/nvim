local wk = require("which-key")
wk.register({
    ["<leader>"] = {
        q = {
            "write all and quit"
        },
        h = { "Add file to harpoon list" },
        g = {
            d = { "go to definition" },

        },
        G = {
            D = { "go to declaration" },
        },
        v = {
            s = { "workspace symbol -LSP" },
            d = { "open float -LSP" },

        },
        a = { "code actions -LSP" },
        r = {
            r = { "view references -LSP" },
            n = { "rename -LSP" },
            e = { "view references -Trouble" }

        },
        p = {
            name = "Telescope/File Tree",
            s = "live grep",
            g = "static grep",
            f = "search files",
            v = "toggle file tree",

        },
        u = { "undotree toggle" },
        w = { "save all files" },
        b = {
            u = "build auto-ocd project (\"auto-ocd -b\")"
        }

    },
    ["<leader>lrr"] = "leetcode resize",
    ["<leader>[d"] = "previous diagnostic",
    ["<leader>]d"] = "next diagnostic",
    ["<C-e>"] = "harpoon menu",
    ["<C-j>"] = "harpoon page 1",
    ["<C-k>"] = "harpoon page 2",
    ["<C-l>"] = "harpoon page 3",
    ["<C-;>"] = "harpoon page 4",
    ["<C-d>"] = "sroll lsp docs -",
    ["<C-t>"] = "scroll lsp docs +",
    ["<C-p>"] = "previous -cmp",
    ["<C-n>"] = "next -cmp",
    ["<C-y>"] = "confirm -cmp",
    ["<C-Space>"] = "complete -cmp",
    ["<C-h>"] = "signature help -LSP",

})
