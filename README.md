# LuaComputer
This is a semi computer written in Lua.

# Plans
Im planing on adding more to the jmp op code like jumping to labels.
Im also plaing on adding more op codes like BRK(Break), and "if" statement op codes

# Commands
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

# Op Codes
there are 5 op codes as of right now

1. jmp   - Jumps to a location in memory <br>
```0000 0000``` <br>
3. print - Prints that line under it <br>
4. add   - Adds locations data to geather <br>
5. sub   - Subractes locations data from another <br>
6. mul   - Multiplies locations data to geather <br>
