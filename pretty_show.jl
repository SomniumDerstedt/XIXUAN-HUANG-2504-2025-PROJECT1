
import Base: show, print

_base_string(p) = sprint(show, p)


function _pretty_str(p)
    s = _base_string(p)
    s = replace(s, r"⋅x\^0\b" => "")     # remove x^0
    s = replace(s, r"x\^1\b"   => "x")   # x^1 -> x
    s = replace(s, r"\b1⋅x"    => "x")   # 1⋅x^k -> x^k
    s = replace(s, r"\b-1⋅x"   => "-x")  # -1⋅x^k -> -x^k
    s = replace(s, "⋅x"        => "x")   # 3⋅x^k -> 3x^k
    s = replace(s, r"\+\s+-"   => " - ") # "+ -2x" -> "- 2x"
    return s
end


function show(io::IO, ::MIME"text/plain", p::PolynomialDense)
    print(io, _pretty_str(p))
end


function print(io::IO, p::PolynomialDense)
    show(io, MIME"text/plain"(), p)
end
