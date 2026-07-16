function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

end

return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                disable_background = false,
                styles = {
                    italic = false,
                    bold = false,
                    --transparency = true,
                },
            })

            ColorMyPencils();
        end
    }
}
