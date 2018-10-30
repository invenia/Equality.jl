using Documenter, Equivalence

makedocs(;
    modules=[Equivalence],
    format=:html,
    pages=[
        "Home" => "index.md",
    ],
    repo="https://github.com/invenia/Equivalence.jl/blob/{commit}{path}#L{line}",
    sitename="Equivalence.jl",
    authors="Invenia Technical Computing Corporation",
    assets=[
        "assets/invenia.css",
        "assets/logo.png",
    ],
)

deploydocs(;
    repo="github.com/invenia/Equivalence.jl",
    target="build",
    julia="1.0",
    deps=nothing,
    make=nothing,
)
