function keys --description "Filter xev output to show only key press codes and names"
    # Prefix with `command` to ensure external utilities are called, not potential Fish functions/builtins
    command xev | command awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'
end
