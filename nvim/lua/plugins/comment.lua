return {
    'numToStr/Comment.nvim',
    event = 'BufWinEnter',
    opts = {},
    keys = {
        vim.keymap.set("n", "<leader>/", function()
            require("Comment.api").toggle.linewise.current() end,
            {desc = "comment toggle"})
    }
}
