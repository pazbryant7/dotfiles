function lf --description 'lf with cd on exit'
    set -l tmp (mktemp)
    command lf -last-dir-path $tmp $argv
    if test -f $tmp
        set -l dir (cat $tmp)
        rm -f $tmp
        if test -d "$dir" -a "$dir" != "$PWD"
            cd "$dir"
        end
    end
end
