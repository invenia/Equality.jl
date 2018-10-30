using Equivalence: isequivalent
using DataFrames
using Missings
using Compat.Test

@testset "AllTests" begin
    # Integers
    @test  isequivalent(1, 1)
    @test !isequivalent(1, 2)
    @test !isequivalent(2, 1)

    # Floats
    @test  isequivalent(1.0, 1.0)
    @test !isequivalent(1.0, 2.0)
    @test !isequivalent(2.0, 1.0)
    @test !isequivalent(2.0, 2.0000000001)

    # Missing
    @test  isequivalent(missing, missing)
    @test !isequivalent(missing, 1)
    @test !isequivalent(1, missing)

    # AbstractArray
    a1 = [1, 2, 3, 4]
    a2 = [1, 2, 3, 4]
    a3 = [1, 2, 3, 5]
    a4 = [1.0, 2.0, 3.0, 4.0]
    a5 = [1.0, 2.0, 3.0, 4.0]
    a6 = [1.0, 2.0, 3.0, 4.0000001]

    @test  isequivalent(a1, a2)
    @test !isequivalent(a2, a3)
    @test !isequivalent(a3, a2)

    @test  isequivalent(a4, a5)
    @test !isequivalent(a5, a6)
    @test !isequivalent(a6, a5)

    # DataFrame
    df1  = DataFrame(a=a1, b=a2)
    df2  = DataFrame(a=a2, b=a3)
    df3  = DataFrame(a=a3, b=a2)
    df4  = DataFrame(a=a4, b=a5)
    df5  = DataFrame(a=a5, b=a6)
    df6  = DataFrame(a=a6, b=a5)
    df7  = DataFrame(a=a1, b=a2)
    df8  = DataFrame(a=a2, b=a1)
    df9  = DataFrame(a=a4, b=a5)
    df10 = DataFrame(a=a5, b=a4)

    @test !isequivalent(df1, df2)
    @test !isequivalent(df2, df3)
    @test !isequivalent(df3, df2)

    @test !isequivalent(df4, df5)
    @test !isequivalent(df5, df6)
    @test !isequivalent(df6, df5)

    @test  isequivalent(df7, df8)
    @test  isequivalent(df9, df10)
end
