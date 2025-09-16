include("poly_factorization_project.jl")  

# === Task 1: minimal demo (Term-based)
f = PolynomialDense([ Term(3,0), Term(2,1), Term(5,3) ])   # 5x^3 + 2x + 3
g = PolynomialDense([ Term(1,0), Term(1,1) ])               # x + 1
h = PolynomialDense([ Term(2,0) ])                          # 2

println("f = ", f)
println("g = ", g)
println("h = ", h)
println("f + g = ", f + g)
println("f * h = ", f * h)

lhs = derivative(f * g)
rhs = derivative(f) * g + f * derivative(g)
println("product rule OK? ", lhs == rhs)



function pretty(poly)
    s = string(poly)

    # 1) remove “⋅x^0” 
    s = replace(s, r"⋅x\^0\b" => "")

    # 2) x^1 => x
    s = replace(s, r"x\^1\b" => "x")

    # 3) 1⋅x^k => x^k ，-1⋅x^k => -x^k
    s = replace(s, r"\b1⋅x" => "x")
    s = replace(s, r"\b-1⋅x" => "-x")

    # 4) 3⋅x^k => 3x^k
    s = replace(s, "⋅x" => "x")

    # 5) “+ -” to “- ”
    s = replace(s, r"\+\s+-" => " - ")

    return s
end

println("pretty f   = ", pretty(f))
println("pretty g   = ", pretty(g))
println("pretty f+g = ", pretty(f + g))
println("pretty f*h = ", pretty(f * h))