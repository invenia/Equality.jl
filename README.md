# Equality

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://invenia.github.io/Equality.jl/stable)
[![Latest](https://img.shields.io/badge/docs-latest-blue.svg)](https://invenia.github.io/Equality.jl/latest)
[![Build Status](https://travis-ci.com/invenia/Equality.jl.svg?branch=master)](https://travis-ci.com/invenia/Equality.jl)
[![Build Status](https://ci.appveyor.com/api/projects/status/github/invenia/Equality.jl?svg=true)](https://ci.appveyor.com/project/invenia/Equality-jl)
[![CodeCov](https://codecov.io/gh/invenia/Equality.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/invenia/Equality.jl)

This package defines generic isequivalent functions to compare all elements of an `AbstractArray` and/or `AbstractDataFrame`

## Installation

```julia
Pkg.add("Equality")
```

## Standard Usage

When you want to compare two `AbstractArrays` or `DataFrames` with specific interactions between various types, you can use `isequivalent` combined with custom `eq` functions for the type comparisons that you want.

## Example

```julia
# Basic usage
using Equality
using DataFrames

# Set up test data
df1 = DataFrame(a=[1.2, 2.3], b=[3.4, 4.5])
df2 = DataFrame(a=[1.2, 2.3], b=[3.4, 4.50000000001])

# If you were to use isequal, this would return false
isequal(df1, df2)

# If you used the basic isequivalent it would also return false
isequivalent(df1, df2)

# But if you want to test for the equivalence of floats, you could define an eq function for comparing floats
eq(x::Float64, y::Float64) = x ≈ y

# isequivalent would now return true
isequivalent(df1, df2)
```
