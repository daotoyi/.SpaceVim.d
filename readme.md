
## Excerpt

SpaceVim private configration.

## Layer

put dylayer.vim to `~/.SpaceVim/autoload/SpaceVim/layers/`, spacevim will autoload.
```shell
cp autoload/dylayer.vim ~/.SpaceVim/autoload/SpaceVim/layers/
# ln -s  autoload/dylayer.vim  ~/.SpaceVim/autoload/SpaceVim/layers/dylayer.vim
```

~/SpaceVim.d/init.toml:
```toml
[[layers]]
  name = "dylayer"
```

## bootstrap_before/after

### yspacevim

mkdir -p ~/.SpaceVim.d/autoload/, put myspacevim.vim to the directory creted.

replace init.toml with from repo.
```toml
[options]
  # bootstrap_before = "myspacevim#init"
  bootstrap_before = "myspacevim#before"
  bootstrap_after= "myspacevim#after"
```

### localplugin

function `bootstrap_before` add local repo：
```vimrc
function! myspacevim#before() abort
    set rtp+=~/path/to/your/localplugin  # dylayer.vim
endfunction
```

## Note

layer and bootstrap is same configuration.
