" File:         clojure.vim (conceal enhancement)
" Author:       Filip Wolanski <wolanski@gmail.com>
" Last Change:  2013-03-05
" Version:      1.0.0
" Require:
"   set nocompatible
"     somewhere on your .vimrc
"
"   Vim 7.3 or Vim compiled with conceal patch.
"

syntax match clojureConcealLambda /\v#\(/me=e-1 conceal cchar=λ
if !has('conceal') || &enc != 'utf-8'
  finish
endif

if !exists('g:clojure_conceal_extras')
  syntax keyword clojureConcealLambda defn conceal cchar=λ
else
  syntax match clojureConcealLambda /\v#\(/me=e-1 conceal cchar=λ
  syntax match clojureConcealLambda /\v#?:\(/me=e-2 conceal cchar=λ
endif

hi link clojureConcealLambda clojureDefine
hi! link Conceal clojureDefine

setlocal conceallevel=2
