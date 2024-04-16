
location = {}
location.__index = location

function location.new(name, data)
    local instance = setmetatable({}, location)
    instance.name = name
    instance.data = data
    return instance
end

function location:displayData()
    self.hexName = string.format("%x", self.name)

    if string.len(self.hexName) == 1 then
        io.write('000')
    end
    if string.len(self.hexName) == 2 then
        io.write('00')
    end
    
    io.write(self.hexName..' '..self.data)
end

function location:writeData(data)
    self.data = data
end
