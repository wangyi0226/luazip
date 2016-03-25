local ziplib=require "zip.c"

local function zip_write_file(zip,file)
	zip:write(file,io.open(file,"r"):read("*a"))
end

local function test_write()
	local zip=ziplib.zip("ex.zip")
	zip:write("test2/test","1233333333333333333333333")
	zip_write_file(zip,"Makefile")
	zip:close()
end

local function test_read()
	local unzip=ziplib.unzip("ex.zip")
	local list=unzip:list()
	for k,v in pairs(list) do
		print(k,v)
		print(unzip:read(v))
		print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
	end

end

test_write()
test_read()
os.execute("rm -rf ex.zip")
