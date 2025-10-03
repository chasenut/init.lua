return {
    {
        "kristijanhusak/vim-dadbod-ui",
        init = function()
            vim.g.db_ui_execute_on_save = 0  -- disable auto execution on save
        end,    },
    {
        "kristijanhusak/vim-dadbod-completion",
    },
    {
        "tpope/vim-dadbod",
        cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection" },
        config = function()
            -- DB completion
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "sql", "mysql", "plsql" },
                callback = function()
                    require("cmp").setup.buffer({ sources = { { name = "vim-dadbod-completion" } } })
                end,
            })
        end,
    }
}
