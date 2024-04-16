# LuaComputer
This is a semi-computer written in Lua.

### Plans
I'm planing on adding more to the jmp opcode like jumping to labels. <br>
I'm also planing on adding more opcodes like BRK(Break), and "if" statement op codes

# Commands and opcodes
### Commands
there are 9 commands as of right now

1. run     - runs all the data from memory starting from location 0000 <br>
2. write   - writes to a specified location <br>
3. read    - reads a specified location <br>
4. readSec - reads a specified section of memory <br>
5. readAll - reads all memory <br>
6. save    - saves all data to a specified txt file <br>
7. load    - loads data from a specified txt file <br>
8. clear   - clears the console <br>
9. exit    - exits the program <br>

### Op Codes
there are 5 opcodes as of right now

1. jmp   - Jumps to a location in memory <br>
```
0000 jmp
0001 10 --This jumps to address 000a or 10
```
3. print - Prints that line under it <br>
```
0000 print
0001 Hello, World! --This prints "Hello, World!"
```
4. add   - Adds locations data together <br>
```
0000 add -- This adds locations 4 and 5
0001 4   -- and puts the sum at location 6
0002 5    
0003 6
0004 25  -- this is location 4
0005 10  -- this is location 5
0006 0   -- this is where the sum will be after running
```
5. sub   - subtracts locations data from another <br>
similar to the add op but subtraction
6. mul   - Multiplies locations data together <br>
similar to the add op but multiplication
