return {
    "norcalli/nvim-colorizer.lua",
    event="VeryLazy",
    config=function ()
require 'colorizer'.setup({
    '*';
  css = {rgb_fn =true;};
  javascript = {mode ='background'};
  html = { mode = 'background',
            names= true};
}, { mode = 'foreground' })

    end
}

-- #f128ff
