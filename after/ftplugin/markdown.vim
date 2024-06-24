"
"
if exists('g:loaded_lsp')
  call LspAddServer([#{ name: 'marksman', filetype: ['markdown'], path: '/home/lxtp/.local/share/nvim/mason/packages/marksman/marksman-linux-x64', args: ['server'], syncInit: v:true }])
end
"

