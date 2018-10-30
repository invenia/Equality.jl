module Equality

using DataFrames
using Missings

export isequivalent

# Define a generic isequivalent function to compare all elements of an AbstractArray
# using the equivalency eq functions below
function isequivalent(eq::Function, x::AbstractArray, y::AbstractArray)
    size(x) == size(y) || return false
    for i in eachindex(x)
        r = isequivalent(eq, x[i], y[i])
        r === true || return r
    end
    return true
end

# Define a generic isequivalent function to compare all elements of an AbstractDataFrame
# using the equivalency eq functions below
function isequivalent(eq::Function, x::AbstractDataFrame, y::AbstractDataFrame)
    names(x) == names(y) || return false

    for col in names(x)
        r = isequivalent(eq, x[col], y[col])
        r === true || return r
    end

    return true
end

# Define our base helper functions
isequivalent(eq::Function, x, y) = eq(x, y)
isequivalent(x, y) = isequivalent(eq, x, y)

# Define our base equivalency functions
eq(x::Missing, y::Missing) = true
eq(x::Missing, y) = false
eq(x, y::Missing) = false
eq(x, y) = x == y

end # module
