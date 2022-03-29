if [ ! -d "./build" ]
then
  mkdir build
fi

nasm -f bin src/main.asm -i ./src -o build/main.bin
