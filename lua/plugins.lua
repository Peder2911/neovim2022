
require('packer').startup(function(use)
   use 'wbthomason/packer.nvim' -- Package manager
   use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP

   -- Completion
   use 'hrsh7th/cmp-nvim-lsp'
   use 'hrsh7th/cmp-buffer'
   use 'hrsh7th/cmp-path'
   use 'hrsh7th/cmp-cmdline'
   use 'hrsh7th/nvim-cmp'
end)

require'lspconfig'.pylsp.setup{}
-- require'lspconfig'.jedi_language_server.setup{}


local cmp = require('cmp')
cmp.setup({
   window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
   },
   mapping = {
      ['<Tab>'] = cmp.mapping(function(fallback)
         if cmp.visible() then
            cmp.select_next_item()
         else
            fallback()
         end
         -- local selected_entry = cmp.core.view:get_selected_entry()
         -- if not selected_entry and utils_vim.is_truthy(vim.call('vsnip#available', 1)) then
         -- vim.fn.feedkeys(utils_vim.replace_keys('<Plug>(vsnip-jump-next)'), '')
         -- if not selected_entry and require('luasnip').jumpable(1) then
         --   vim.fn.feedkeys(utils_vim.replace_keys('<Plug>luasnip-jump-next'), '')
         --elseif cmp.visible() then
         --else
      end, {'i', 's'});

      ['<S-Tab>'] = cmp.mapping(function(fallback)
         -- local selected_entry = cmp.core.view:get_selected_entry()
         -- if not selected_entry and utils_vim.is_truthy(vim.call('vsnip#available', -1)) then
         -- vim.fn.feedkeys(utils_vim.replace_keys('<Plug>(vsnip-jump-prev)'), '')
         -- if not selected_entry and require('luasnip').jumpable(-1) then
         --   vim.fn.feedkeys(utils_vim.replace_keys('<Plug>luasnip-jump-prev'), '')
         if cmp.visible() then
            cmp.select_prev_item()
         else
            fallback()
         end
      end, {'i', 's'});
   },
   sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
      }, {
      { name = 'buffer' },
   })
})

vim.o.completeopt='menu,menuone,noselect'
