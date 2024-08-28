return {
    "folke/trouble.nvim",
    cmd = 'TroubleToggle',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle()
        end)},
}
