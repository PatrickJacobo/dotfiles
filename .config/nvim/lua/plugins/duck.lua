return {

    "tamton-aquib/duck.nvim",
    event="VeryLazy",
    config = function()
        vim.keymap.set("n", "<leader>nd", function()
            require("duck").hatch()
     end, {})

        vim.keymap.set("n", "<leader>nk", function()
            require("duck").cook()
        end, {})
        vim.keymap.set("n", "<leader>na", function()
            require("duck").cook_all()
        end, {})
    end,
}
