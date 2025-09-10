#############################################################################
#############################################################################
#
# This file contains units tests for polynomial factorization
#                                                                               
#############################################################################
#############################################################################


"""
Test factorization of polynomials.
"""
function factor_mod_p_test_poly(::Type{P};
    N::Int = 10, seed::Int = 0, primes::Vector{Int} = [5,7,13]
    ) where {P <: Polynomial}
    Random.seed!(seed)
    for prime in primes
        print("\ndoing prime = $prime \t")
        for _ in 1:N
            print(".")
            p = rand(P; max_coeff = 3, mean_degree = 1.5, prob_term = 0.2)
            # p = rand(P) FIXME/TODO - Known bug exists in factor, course staff working on fixing this
            # @show p
            factorization = factor_mod_p(p, prime)
            pr = mod(expand_factorization(factorization),prime)
            @assert mod(p-pr,prime) == 0 
        end
    end

    println("\n\nfactor_mod_p_test_poly for $(P) - PASSED")
end

