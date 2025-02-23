return { { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
    } }
