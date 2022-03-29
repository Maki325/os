# OS

Made purely for educational purposes
Created following the [Os Tutorial](https://github.com/cfenollosa/os-tutorial)


## Help

### Compilation
```console
./compile.sh
```
It uses nasm to assemble the assembly to binary files that are outputed in the `build` folder

### Running
```console
./run.sh
```
The script runs the `compile.sh` script and then uses `qemu` with `--curses` flag to emulate the binary program

#### Help with running
 - How to exit `--curses qemu`<br/>
   Press `(CTRL +) ALT + 2`<br/>
   Then type `exit`
