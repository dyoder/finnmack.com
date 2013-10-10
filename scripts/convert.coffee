{read,readdir,write} = require "fairmont"
{parse} = require "c50n"
{resolve, join, dirname, basename, extname} = require "path"

# posts = {}

# convert = (path) ->
#   name = (basename(path,".md"))
#   console.log name
#   content = read(path)
#   [data,markdown] = content.split(/^---$/m)
#   posts[name] = parse(data)
#   write(path,markdown)
  
# convert(join("public/posts", filename)) for filename in readdir("public/posts")
# write("public/posts/_data.json", JSON.stringify(posts, null, 2))

sorted = {}
current = JSON.parse(read("public/posts/_data.json"))
keys = Object.keys(current)
for key in keys.sort().reverse()
  sorted[key] = current[key]
write("public/posts/_data.json", JSON.stringify(sorted,null,2))