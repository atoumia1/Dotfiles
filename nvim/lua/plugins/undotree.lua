return {
	"mbbill/undotree",
    cmd = 'UndotreeToggle',
    keys = {
        vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "undotree toggle" })
    }
}
