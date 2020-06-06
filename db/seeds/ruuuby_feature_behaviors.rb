
@f00.spawn_behaviors(['create func{η̂!} for class(`Array`)'])

@f05.spawn_behaviors(['offer func{>>} to class(`Array`)', 'offer func{>>} to class(`String`)'])

@f06.spawn_behaviors(
    [
        'offer func{num?} with param-check-func{🛑num❓} offering the normalizers{∈ℕ, ∈𝕎, ∈ℤ, ∈𝕌, ∈ℕ𝕊, ∈𝕎𝕊, ∈ℤ𝕊, ∈𝕌𝕊}',
        'offer func{str?} with param-check-func{🛑str❓} offering the normalizers{!∅}'
    ]
)

@f10.spawn_behaviors(
    [
        '`🙈` to alias `private`',
        '`🛡️` to alias `protected`',
        '`🆕` to alias `new`',
        '`🌽` to alias `::Kernel`',
        'alias `Math` funcs{`sqrt`, `cbrt`} w/ {`√`, `∛`}',
        'alias `Math` funcs{`log_e`, `log2`, `log10`} w/ {`logₑ`, `log₂`, `log₁₀`}'
    ]
)

@f11.spawn_behaviors(['create module{SetTheory}', 'create class{Closure}', 'create class{NumberSet}'])

@f12.spawn_behaviors(['offer Class aliases: {`📁` -> `File`}, {`🗄️` -> `Dir`}'])

@f24.spawn_behaviors(
    [
        'syntax category{snake_case} aliased w/ {🐍}',
        'syntax category{snake_case_capital} aliased w/ {🐍⬆}',
        'syntax category{camel_case} aliased w/ {🐫}',
        'syntax category{camel_case_lower} aliased w/ {🐫⬇}'
    ]
)

@f26.spawn_behaviors(['offer Class aliases: {`📅` -> `Date`}, {`🕒` -> `Time`}, {`📅🕒` -> `DateTime`}'])

@f27.spawn_behaviors(
    [
        'has additive identity{0} and multiplicative identity{1}',
        'preserves precision across math operations as best as possible',
        'each ThetaAngle representation has a corresponding static function which calls the needed constructor',
    ]
)

@f28.spawn_behaviors(
    [
        'create float constant{𝚽}, golden-angle',
        'create float constant{Ψ}, super-golden-ratio',
        'alias float constant{℮}',
        'alias float constant{π}, pie',
        'alias float constant{∞}, infinity',
        'create float constant{δ}, silver-ratio',
        'create float constant{ρ}, plastic-ratio',
        'create float constant{Ω}, omega-constant',
        'create float constant{γ}, euler mascheroni constant',
        'create float constants for unicode characters representing rationals',
        'create ThetaAngle constant{𝞽}, tau',
        'create ThetaAngle constant{Ⴔ}, golden angle',
        'create or extend a `numeric` in order to properly support `Complex Infinity`'
    ]
)

@f30.spawn_behaviors(
    [
        'create create singleton-Class{BooleanSpace}, instanced aliased by{🅱}',
        'support multiple data types and normalization',
        'create create singleton-Class{NucleotideSpace}, instanced aliased by{🧬}',
        'create create singleton-Class{NumberSpace}, instanced aliased by{🔢}',
        'create create singleton-Class{SymbolicNumbersSpace}, instanced aliased by{𝕊}'
    ]
)

@f31.spawn_behaviors(['offers an abstraction over the `Rugged` gem', 'offers health checks for current local dev state'])

@f32.spawn_behaviors(
    [
        'offers static funcs through module{ℕ¹}',
        'offers static funcs through module{𝕎¹}',
        'offers static funcs through module{ℕ²}',
        'create Sequence{`Pronic`}',
        'create Sequence{`Square`}',
        'create Sequence{`Fibonacci`}',
        'create Sequence{`Lucas`}',
        'create Sequence{`Triangle`}',
        'create Sequence{`Hexagonal`}'
    ]
)

# TODO: double (_Complex double)
@f98.spawn_behaviors(
    [
        'can set the $PROGRAM_NAME',
        'offer (to `Ruuuby`) access to `C` math functions, especially those involving higher precision',
        'simplify import/require statements & setup as much as possible'
    ]
)
