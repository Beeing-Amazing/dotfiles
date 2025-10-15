function gd --wraps='git diff HEAD~1 HEAD' --description 'alias gd=git diff HEAD~1 HEAD'
    git diff HEAD~1 HEAD $argv
end
