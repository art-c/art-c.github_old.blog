---
layout  : wiki
title   : NeoVim 설치
summary : NeoVim 설치
date    : 2020-01-16 03:32:51 +0900
updated : 2020-01-19 21:13:57 +0900
tag     : neovim
toc     : true
public  : true
parent  : vim
latex   : false
---
* TOC
{:toc}

# NeoVim

## NeoVim 설치(centos8)

* vim8.0에 coc.nvim의 자동완성 기능을 완전하게 사용하지 못했다.(자동완성되는 메소드들을 선택할 때 설명창이 뜨지 않음, nvim은 뜸)
* linux(x64)[neovim](https://github.com/neovim/neovim/releases/) 다운로드
  * `chmod u+x nvim.appimage && ./nvim.appimage`으로 실행가능
  * 또는 다음과 같이 압축을 풀어서 사용가능

```sh
./nvim.appimage --appimage-extract
./squashfs-root/usr/bin/nvim
```

## nvim설정:

* 문서에 나온대로 vim 설정 가져오기(이 방법으로 하면 충돌이 많이 일어나는 것 같음)
  * `:h nvim-from-vim` 명령 후 1,2,3번 지시대로 실행
  * 반드시 관리는 nvim이 아닌 vim .vimrc로 들어가서 :PluginInstall 할 것!!
* 설정 덮어씌우기
  * cp ~/.vimrc ~/.config/nvim/ini.vim
  * 이 상태에서 nvim을 실행하면 플러그인을 못읽음. vim-plug, vundle 등 자신이 사용하는 플러그인 관리자 설치

```
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

* 설정파일 심벌릭 링크 걸기
  * 잘 된다. `ln -s ~/.vimrc ~/.config/nvim/init.vim`

## coc.nvim과 ultisnippets 호환

* 내 경우는 Error가 나서 두 플러그인을 같이 사용하지 못한다.
* 대안으로 VSCode-snippets 과 coc-snippets를 설치하는 방법이 있다. coc-snippets가 coc.nvim에서 다른 snippets들을 사용하게 해주는 플러그인 같은데 내 경우 ultisnippets은 안되지만 VSCODE-snippets는 되었다.
* 설치방법

```
 :CocInstall https://github.com/andys8/vscode-jest-snippets
 :CocInstall coc-snippets
```

```

## :checkhealth

* `:checkhealth` 명령으로 파이썬 관련 패키지 또는 nodejs 관련 패키지가 제대로 설치되었는지 확인 후 처리.
  * ex> `pip install --upgrade pynvim`

## 자동완성 coc.vim 에서 ultisnippets 설정

* `CocCommand snippets.editSnippets`
* `CocCommand snippets.openSnippetFiles`

## 에러 처리(neovim 설정파일을.vimrc의 심벌릭 링크로 처리 후 vim-plug 설치하면 해결됨)

`UltiSnippet` 관련해서 다음과 같은 에러 발생
`E319: No "python3" provider found. Run ":checkhealth provider"`

## language server 설정

\*

## [coc-extension](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions) 목록

* marketplace 설치와 사용
  `:CocInstall coc-marketplace`
  `:CocList marketplace`
  `:CocList marketplace python`

## 자동완성 설정

## React 관련 플러그인 설치

```

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'

````

## vim-prettier 설치

* `'Plug prettier/vim-prettier', {'do', 'yarn install'}`
* `vim-prettire` 디렉토리로 가서 `yarn` 또는 `yarn install`
* 저장할 때 자동으로 `prettier` 적용

```vim
let g:prettier#autoformat = 0
171 autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
````

## neoclide/rename 설치
* [ ] [coc.nvim] Invalid position for rename


[참고사이트](https://vimawesome.com/plugin/vim-prettier-who-speaks)

