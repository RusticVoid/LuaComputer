
function file_exist(name)
    local f = io.open(name, "r")
    if f~=nil then 
        io.close(f) 
        return true 
    else
        return false
    end
end

require('classes')

locationAmount = 50
locations = {}

for i = 0, locationAmount, 1 do
    locations[i] = location.new(i, 0)
end


-- this code was used before the saving and loading was fully made
-- it has no use now but might be use for test at some points idk

--print("Is there a data file?[y,n]")
--
--usrin = io.read()
--
--if usrin == "n" then
--    file = io.open("data.txt", "w")
--    for i = 0, locationAmount, 1 do
--        locations[i].hexName = string.format("%x", locations[i].name)
--
--        if string.len(locations[i].hexName) == 1 then
--            file:write('000')
--        end
--        if string.len(locations[i].hexName) == 2 then
--            file:write('00')
--        end
--                
--        file:write(locations[i].hexName..' '..locations[i].data)
--
--        if i == locationAmount then
--        else
--            file:write('\n')
--        end
--    end
--    file:close()
--else end

print("Type help for help\n")

while true do
    usrin = io.read()

    if usrin == 'help' then
        print("+---------------------------------------+")
        print("|run     - runs all the data from memory|")
        print("|write   - writes to a location         |")
        print("|read    - reads a location             |")
        print("|readSec - reads a section of memory    |")
        print("|readAll - reads all locations          |")
        print("|save    - saves all data to a txt file |")
        print("|load    - loads data from a txt file   |")
        print("|clear   - clears the console           |")
        print("|exit    - exits the program            |")
        print("+---------------------------------------+\n")
    end

    if usrin == 'run' then
        i = 0
        print('')
        while true do
            if locations[i].data == "jmp" then
                errori = i+1
                i = tonumber(locations[i+1].data)
                if type(i) == "number" then
                else
                    io.write("There is an error at ")
                    io.write('"')
                    io.write(locations[errori]:displayData())
                    io.write('"')
                    print("")
                    break
                end
            else
                if locations[i].data == "add" then
                    addLocationOne = tonumber(locations[i+1].data)
                    addLocationTwo = tonumber(locations[i+2].data)
                    sumLocation = tonumber(locations[i+3].data)
                    if tonumber(locations[addLocationOne].data) == nil then
                        io.write("There is an error at ")
                        io.write('"')
                        io.write(locations[addLocationOne]:displayData())
                        io.write('"')
                        print("")
                        break
                    else
                        if tonumber(locations[addLocationTwo].data) == nil then
                            io.write("There is an error at ")
                            io.write('"')
                            io.write(locations[addLocationTwo]:displayData())
                            io.write('"')
                            print("")
                            break
                        else     
                            sum = tonumber(locations[addLocationOne].data) + tonumber(locations[addLocationTwo].data)
                            locations[sumLocation].data = sum
                        end
                    end
                end
                if locations[i].data == "sub" then
                    subLocationOne = tonumber(locations[i+1].data)
                    subLocationTwo = tonumber(locations[i+2].data)
                    sumLocation = tonumber(locations[i+3].data)
                    if tonumber(locations[subLocationOne].data) == nil then
                        io.write("There is an error at ")
                        io.write('"')
                        io.write(locations[subLocationOne]:displayData())
                        io.write('"')
                        print("")
                        break
                    else
                        if tonumber(locations[subLocationTwo].data) == nil then
                            io.write("There is an error at ")
                            io.write('"')
                            io.write(locations[subLocationTwo]:displayData())
                            io.write('"')
                            print("")
                            break
                        else
                            sum = tonumber(locations[subLocationOne].data) - tonumber(locations[subLocationTwo].data)
                            locations[sumLocation].data = sum
                        end
                    end
                end
                if locations[i].data == "mul" then
                    mulLocationOne = tonumber(locations[i+1].data)
                    mulLocationTwo = tonumber(locations[i+2].data)
                    sumLocation = tonumber(locations[i+3].data)
                    if tonumber(locations[mulLocationOne].data) == nil then
                        io.write("There is an error at ")
                        io.write('"')
                        io.write(locations[mulLocationOne]:displayData())
                        io.write('"')
                        print("")
                        break
                    else
                        if tonumber(locations[mulLocationTwo].data) == nil then
                            io.write("There is an error at ")
                            io.write('"')
                            io.write(locations[mulLocationTwo]:displayData())
                            io.write('"')
                            print("")
                            break
                        else
                            sum = tonumber(locations[mulLocationOne].data) * tonumber(locations[mulLocationTwo].data)
                            locations[sumLocation].data = sum
                        end
                    end
                end
                if locations[i].data == "print" then
                    print(locations[i+1].data)
                end
                if i == locationAmount then
                    break
                else
                    i = i + 1
                end
            end
        end
        print('')
    end

    if usrin == 'write' then
        print('write to[0-50]: ')
        location = io.read()
        if type(tonumber(location)) == "number" then
            if tonumber(location) > 55 then
                print("ADDRESS OUT OF RANGE!")
            else
                print('data: ')
                data = io.read()
                locations[tonumber(location)]:writeData(data)
                print('Data writen!\n')
            end
        else
            print("location has to be a number!")
        end
    end

    if usrin == 'read' then
        print('Read[0-50]: ')
        location = io.read()
        if tonumber(location) > 55 then
            print("ADDRESS OUT OF RANGE!")
        else
            locations[tonumber(location)]:displayData()
        end
        print('')
    end

    if usrin == 'readSec' then

        print('Start Read[0-50]: ')
        startLocation = io.read()
        print('End Read[0-50]: ')
        endLocation = io.read()
        print('')
        if tonumber(startLocation) > 55 then
            print("START ADDRESS OUT OF RANGE!")
        end
        if tonumber(endLocation) > 55 then
            print("END ADDRESS OUT OF RANGE!")
        else
            for i = startLocation, endLocation, 1 do
                locations[i]:displayData()
            end
        end
        print('')
    end

    if usrin == 'readAll' then
        print('')
        for i = 0, locationAmount, 1 do
            locations[i]:displayData()
        end
        print('')
    end

    if usrin == 'save' then
        print("File Name: ")
        fileName = io.read()
        if file_exist(fileName) == true then
            print("This Files Exist! do you wish to overwrite it?[y,n]")   
            answer = io.read()
            if answer == "y" then
                file = io.open(fileName, "w")
                for i = 0, locationAmount, 1 do
                    locations[i].hexName = string.format("%x", locations[i].name)

                    if string.len(locations[i].hexName) == 1 then -- this adds 3 zeros at the begging of 1 hex number
                        file:write('000')
                    end
                    if string.len(locations[i].hexName) == 2 then -- this adds 2 zeros at the begging of 2 hex numbers
                        file:write('00')
                    end                                           -- these arent need but also are its kinda hard to explain
                                                                -- but it just looks nice
                    
                    file:write(locations[i].hexName..' '..locations[i].data)

                    if i == locationAmount then -- this stops a space at the end of the file
                    else                        -- its not really need though its just being neat
                        file:write('\n')
                    end
                end        
                file:close()
                print("File Saved!\n")
            else
                print("NOT SAVED!")
            end
        else
            file = io.open(fileName, "w")
            for i = 0, locationAmount, 1 do
                locations[i].hexName = string.format("%x", locations[i].name)

                if string.len(locations[i].hexName) == 1 then -- this adds 3 zeros at the begging of 1 hex number
                    file:write('000')
                end
                if string.len(locations[i].hexName) == 2 then -- this adds 2 zeros at the begging of 2 hex numbers
                    file:write('00')
                end                                           -- these arent need but also are its kinda hard to explain
                                                            -- but it just looks nice
                
                file:write(locations[i].hexName..' '..locations[i].data)

                if i == locationAmount then -- this stops a space at the end of the file
                else                        -- its not really need though its just being neat
                    file:write('\n')
                end
            end        
            file:close()
            print("File Saved!\n")
        end
    end

    if usrin == 'load' then
        print("File Name: ")
        fileName = io.read()
        if file_exist(fileName) == true then
            file = io.open(fileName, "r")
            for i = 0, locationAmount, 1 do
                line = file:read()
                locations[tonumber(i)]:writeData(line:sub(6,-1)) -- the line:sub allows you to skip bytes/letters
            end
            file:close()
            print("File Loaded!\n")
        else
            print("File Not Found!\n")
        end
    end

    if usrin == 'clear' then
        os.execute('cls')
    end

    if usrin == 'exit' then
        print('Shutting down...')
        break
    end
end