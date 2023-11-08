# Defined in - @ line 0
function cpwd --description 'pwd copied to clipboard'
  command pwd | tr -d '\n' | xclip -selection clipboard; and echo 'pwd copied to clipboard';
end
