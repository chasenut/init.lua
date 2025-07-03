return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- FORMATTERS
                -- When on clean machine, you need
                -- install them manually with :Mason (5)
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.black, -- for Python
				null_ls.builtins.formatting.isort, -- for Python
				null_ls.builtins.formatting.clang_format.with({
					filetypes = { "c", "cpp", "objc", "objcpp" },
				}),
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
