function gs --wraps='git status -sb' --description 'alias gs=git status -sb'
  git status -sb $argv; 
end
