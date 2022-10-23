
## Excerpt

SpaceVim private configration.

## Layer

### install SpaceVim

```bash
curl -sLf https://spacevim.org/cn/install.sh | bash
```

### layer configuration

put dylayer.vim to `~/.SpaceVim/autoload/SpaceVim/layers/`, spacevim will autoload.

```bash
cp autoload/dylayer.vim ~/.SpaceVim/autoload/SpaceVim/layers/
# ln -s  autoload/dylayer.vim  ~/.SpaceVim/autoload/SpaceVim/layers/dylayer.vim
```
### start layers

~/SpaceVim.d/init.toml, uncomment:
```toml
[[layers]]
  name = "dylayer"
```

### config root from user
```bash
su root
ln -s /home/daoyi/.vim /root/.vim
ln -s /home/daoyi/.SpaceVim /root/.SpaceVim
ln -s /home/daoyi/.SpaceVim.d /root/.SpaceVim.d
ln -s /home/daoyi/.cache/vimfiles /root/.cache/vimfiles
```

## [Note]bootstrap_before/after

### myspacevim

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
