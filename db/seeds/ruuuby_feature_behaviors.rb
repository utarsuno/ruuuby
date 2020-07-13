
@f00.spawn_behaviors(['create func{η̂!} for class(`Array`)'])

@f01.spawn_behaviors(
    [
        'supports mode: none (empty methods called for logging)',
        'supports mode: stdout (log to console)',
        'supports mode: stderr (log only errors to console)',
        'supports mode: file (standard Ruby log file logging)',
        'supports setting the logging level',
        'supports running a hybrid of logging modes'
    ]
)

@f05.spawn_behaviors(['offer func{>>} to class(`Array`)', 'offer func{>>} to class(`String`)'])

@f06.spawn_behaviors(
    [
        'offer funcs{num?, 🛑num❓, 🛑nums❓} w/ normalizers{∈ℕ, ∈𝕎, ∈ℤ, ∈𝕌, ∈ℕ𝕊, ∈𝕎𝕊, ∈ℤ𝕊, ∈𝕌𝕊}',
        'offer funcs{str?, 🛑str❓, 🛑strs❓} w/ normalizers{∉∅}',
        'offer funcs{int?, 🛑int❓, 🛑ints❓} w/ normalizers{∈ℕ, ∈𝕎, ∈ℤ, ∈𝕌}',
        'offer funcs{ary?, 🛑ary❓, 🛑arys❓} w/ normalizers{∉∅}',
        'offer funcs{flt?, 🛑flt❓, 🛑flts❓} w/ normalizers{∈𝕌}',
        'offer funcs{bool?, 🛑bool❓, 🛑bools❓}',
        'offer funcs{sym?, 🛑sym❓, 🛑syms❓}',
        'offer funcs{hsh?, 🛑hsh❓, 🛑hshs❓}',
        'offer funcs{matrix?, 🛑matrix❓, 🛑matrices❓}',
        'offer funcs{vec?, 🛑vec❓, 🛑vectors❓}'
    ]
)

@f10.spawn_behaviors(
    [
        '`🙈` to alias `private`',
        '`🛡️` to alias `protected`',
        '`🆕` to alias `new`',
        '`🏠` to alias `source_location` for `::Method`',
        'alias `Math` funcs{`sqrt`, `cbrt`} w/ {`√`, `∛`}',
        'alias `Math` funcs{`log_e`, `log2`, `log10`} w/ {`logₑ`, `log₂`, `log₁₀`}'
    ]
)

@f11.spawn_behaviors(['create module{SetTheory}', 'create class{Closure}', 'create class{NumberSet}'])

@f12.spawn_behaviors(['offer Class aliases: {`📁` -> `File`}, {`🗄️` -> `Dir`}'])

@f22.spawn_behaviors(
    [
        'offers a light layer over `GC`',
        'offers a light layer over `JIT`',
        'offers a light layer over `OpenCL`',
        'offers a light layer over `OpenGL`',
        'offers a light layer over `GCC`',
        'offers a light layer of utilities to get-set various OS related information and values',
        'offers a light layer for comparing compiled `Ruby` code'
    ]
)

@f24.spawn_behaviors(
    [
        'syntax category{snake_case} aliased w/ {🐍}',
        'syntax category{snake_case_capital} aliased w/ {🐍⬆}',
        'syntax category{camel_case} aliased w/ {🐫}',
        'syntax category{camel_case_lower} aliased w/ {🐫⬇}'
    ]
)

@f26.spawn_behaviors(
    [
        'offer Class aliases: {`📅` -> `Date`}, {`🕒` -> `Time`}, {`📅🕒` -> `DateTime`}|{OPTIONAL}'
    ]
)

@f27.spawn_behaviors(
    [
        'has additive identity{0} and multiplicative identity{1}',
        'preserves precision across math operations as best as possible',
        'each ThetaAngle representation has a corresponding static function which calls the needed constructor',
        'vocabulary functions involving 2 ThetaAngle are provided in module {ThetaAngle::Pair}',
        'vocabulary functions involving 1 ThetaAngle are provided as funcs',
        'offer `Refinement` w/ module{ThetaAngle::ContextStrParsing} for parsing `String` objs into `ThetaAngleAngle` objs',
        'implements `Comparable`',
        'offers functionality for `normalization`',
        'offers unary operators',
        'offers math operators'
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
        'create Sequence{`Hexagonal`}',
        'offers static funcs through module{ℤ³}',
        'offers static funcs through module{ℤ²}'
    ]
)

@f34.spawn_behaviors(
    [
        'offer basic abstractions to `Shape`',
        'offer basic abstractions to `Shape::PlaneFigure`',
        'offer basic abstractions to `Shape::Triangle`',
        'offer basic abstractions to `Shape::Quadrilateral`',
        'offer basic abstractions to `Shape::Circle`',
    ]
)

@f35.spawn_behaviors(
    [
        'offer categorical abstractions w/ module{`Descriptive`}',
        'offer categorical abstractions w/ module{`Probability`}',
        'offer categorical abstractions w/ module{`StatisticalLearning`}',
        'offer categorical abstractions w/ module{`TimeSeries`}',
    ]
)

@f36.spawn_behaviors(
    [
        'offer functionality for array-like data access',
        'offer functionality for controlling and monitoring memory usage',
        'offer functionality for providing cached values for any simple stats',
        'offer functionality for time-series calculations',
        'offer functionality for health-checks w/ `bitwise meta-data flags`',
        'offer functionality for various styles of `normalization`',
    ]
)

@f37.spawn_behaviors(
    [
        'create class `PseudoGraph`',
        'offer `Graph` classes the ability to transform to/from a `Matrix` representations',
    ]
)

@f38.spawn_behaviors(
    [
        'offer `Refinement` w/ module{Math::Algebra::Tropical::ContextMatrix} for class{`Matrix`}',
        'offer `Refinement` w/ module{Math::Algebra::Tropical::ContextNumeric} for `Numerics`',
        'support `Tropical Algebra` w/ any additionally needed methods in class{`Matrix`}',
        'create class `CurrencyMatrix` under module{`Math::Forex`}'
    ]
)

# TODO: double (_Complex double)
@f98.spawn_behaviors(
    [
        'dynamically add `macros` w/ `mkmf` in order to (during pre-processing) include/exclude feature-code to be compiled w/ or w/o',
        'offer (to `Ruuuby`) access to `C` math functions, especially those involving higher precision',
        'simplify import/require statements & setup as much as possible'
    ]
)
