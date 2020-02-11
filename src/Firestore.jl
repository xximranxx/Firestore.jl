module Firestore

import HTTP, GoogleCloud, JSON

include("token.jl")
include("get.jl")
include("convert.jl")

function get(path...)
    @show "Firestore.get", path
    full_path = join(path,'/')
    length(path) % 2 == 0 && return convert_map(get_document(full_path))
    map(convert_map,get_collection(full_path))
end

end # module
