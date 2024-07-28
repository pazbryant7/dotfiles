function arch
    set architecture ""
    switch (uname -m)
        case "i386" "i686"
            set architecture "386"
        case "x86_64"
            set architecture "amd64"
        case "arm"
            if dpkg --print-architecture | grep -q "arm64"
                set architecture "arm64"
            else
                set architecture "arm"
            end
    end

    echo $architecture
end
