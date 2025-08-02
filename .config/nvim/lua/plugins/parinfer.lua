return {
    "gpanders/nvim-parinfer",
    event="VeryLazy",
    config= function ()
        vim.api.nvim_create_autocmd("FileType",{
        pattern= {"lisp", "clojure", "scheme", "emacs-lisp", "yuck"},
            command="ParinferOn"
        })
   end
}
