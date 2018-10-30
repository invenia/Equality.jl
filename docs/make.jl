using Documenter, Equality

makedocs(;
    modules=[Equality],
    format=:html,
    pages=[
        "Home" => "index.md",
    ],
    repo="https://github.com/invenia/Equality.jl/blob/{commit}{path}#L{line}",
    sitename="Equality.jl",
    authors="Invenia Technical Computing Corporation",
    assets=[
        "assets/invenia.css",
        "assets/logo.png",
    ],
)

deploydocs(;
    repo="github.com/invenia/Equality.jl",
    target="build",
    julia="1.0",
    deps=nothing,
    make=nothing,
)
