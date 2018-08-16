if !has('conceal')
  finish
endif

syntax keyword rubyNiceOperator lambda conceal cchar=λ

autocmd User ProjectionistDetect
\ call projectionist#append(getcwd(),
\ {
\   "app/*.rb": { "alternate": "spec/{}_spec.rb" },
\   "spec/*_spec.rb": { "alternate": "app/{}.rb" }
\ })
