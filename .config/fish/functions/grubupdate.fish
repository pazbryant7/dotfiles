function grubupdate --description "Update GRUB bootloader configuration"
    sudo grub-mkconfig -o /boot/grub/grub.cfg
end
