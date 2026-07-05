# tinyfetch
A minimal system fetch tool for linux
# tinyfetch (bash edition) installation
git clone https://github.com/hello-btw/tinyfetch && cd tinyfetch && chmod +x bash/tinyfetch && sudo mv tinyfetch /usr/local/bin/ && cd -
# tinyfetch (nim edition) installation
git clone https://github.com/hello-btw/tinyfetch && cd tinyfetch && nim c -d:release src/tinyfetch.nim && sudo mv src/tinyfetch /usr/local/bin/tinyfetch-nim
# Usage
tinyfetch

tinyfetch-nim
