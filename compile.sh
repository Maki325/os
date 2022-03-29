if [ ! -d "./build" ]
then
  mkdir build
fi

nasm -f bin main.asm -o build/main.bin
