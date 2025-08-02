return{
  'stevearc/oil.nvim',
    event="VeryLazy",
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
    config= function ()
        require("oil").setup({
        default_file_explorer=true,
        view_options={
            show_hidden=true,
        }
        })
    end
}
