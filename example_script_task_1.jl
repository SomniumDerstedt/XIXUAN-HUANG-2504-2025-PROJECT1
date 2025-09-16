include("poly_factorization_project.jl")  
include("pretty_show.jl")

# (Term-based)
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
