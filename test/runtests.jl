
using Test

"asdf"
function jl_is_runnable(path)
    🏡 = Core.eval(Main, :(module asdf end))
    try
        Core.eval(🏡, :(include($path)))
    catch ex
        println.(enumerate(readlines(path; keep=true)))

        showerror(stderr, ex, stacktrace(catch_backtrace()))
    end
end





@test jl_is_runnable("./worse.jl")

