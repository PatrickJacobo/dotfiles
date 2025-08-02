return {
    "pocco81/auto-save.nvim",
    event="VeryLazy",
    config =function () vim.api.nvim_set_keymap('n', '<leader>as', ":ASToggle<CR>", {}) end,
}
