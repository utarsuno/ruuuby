# encoding: UTF-8

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

@f04.spawn_behaviors(
    [
        'Enumerable classes{ex: `Array`, `Set`, `String` have func{`∅?`}',
        "'class' ENV and class{NilClass} have func{`∅?`}",
        'classes: `File` & `Dir` have func{`∅?`}' # TODO: create a way to mark this behavior as hybrid/relating to feature 12
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

@f07.spawn_behaviors(
    [
        'offer a way to check for the existence of functions & aliases'
    ]
)

@f10.spawn_behaviors(
    [
        'for class{`Module`}, alias func{`private`} as `🙈` & func{`protected`} as{`🛡️`}',
        'provide global variables for certain ruby engine components (ex: `$git` instead of `💎.engine.api_locale.api_git`)',
        'part I/II  | for class{`Object`}, alias func{`object_id`} as{`🆔`}, func{`frozen`} as{`❄️`}, func{`frozen?`} as{`❄️?`}',
        'part II/II | for class{`Object`}, alias func{`class`} as{`ⓣ`} & provide utility func{`Ⓣ`} to get self-class as a String',
        '`🏠` to alias `source_location` for `::Method`',
        'part I/III   | for class{`Kernel`}, alias func{`rand`} as{`🎲`} & func{`raise`} as{`🛑`}',
        'part II/III  | for class{`Kernel`}, alias `Math` funcs{`sqrt`, `cbrt`} w/ {`√`, `∛`}',
        'part III/III | for class{`Kernel`}, alias `Math` funcs{`log_e`, `log2`, `log10`} w/ {`logₑ`, `log₂`, `log₁₀`}'
    ]
)

@f11.spawn_behaviors(['create module{SetTheory}', 'create class{Closure}', 'create class{NumberSet}'])

@f12.spawn_behaviors([
                         'offer Class aliases: {`📁` -> `File`}, {`🗄️` -> `Dir`}',
                         "offer a light layer over `Ruby's` loadable `CSV` data parsing",
                         "offer a light layer over `Ruby's` loadable `YAML` data parsing",
                         'offer regular expression checks for valid file & dir paths'
                     ]
)

@f22.spawn_behaviors(
    [
        'offer a light layer over `GC`',
        'offer a light layer over `JIT`',
        'offer a light layer over `OpenCL`',
        'offer a light layer over `OpenGL`',
        'offer a light layer over `GCC`',
        'offer a light layer of utilities to get-set various OS related information and values',
        'offer a light layer for comparing compiled `Ruby` code',
        'offer a light layer for setting preferred `MacOS` configs & settings'
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
        'offer `Refinement` w/ module{ThetaAngle::ContextStr} for parsing `String` objs into `ThetaAngleAngle` objs',
        'implements `Comparable`',
        'offers functionality for `normalization`',
        'offers unary operators',
        'offers math operators',
        'offer `Refinement` w/ module{`ThetaAngle::ContextParamCheck`} for providing `f06` but for context of this feature'
    ]
)

@f28.spawn_behaviors(
    [
        'create float constant{𝚽}, golden-angle',
        'create float constant{RATIO_GOLDEN_SUPER}',
        'alias float constant{℮}',
        'alias float constant{π}, pie',
        'alias float constant{∞}, infinity',
        'create float constant{RATIO_SILVER}',
        'create float constant{RATIO_PLASTIC}',
        'create float constant{Ω}, omega-constant',
        'create float constant{CONST_EULER_MASCHERONI}',
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
        'create create singleton-Class{SymbolicNumbers}, instanced aliased by{𝕊}'
    ]
)

@f31.spawn_behaviors(
    [
        'offers an abstraction over the `Rugged` gem',
        'offers health checks for current local dev state'
    ]
)

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
        'offer categorical abstractions w/ module{`TimeSeries`}'
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
        'offer functionality for `IQR`/`quartile` based calculations, such as one of the many equations utilized to find `outliers`',
        'detect if data consists of only `Integers` which thus allows for various optimizations'
    ]
)

@f37.spawn_behaviors(
    [
        'create class `PseudoGraph`',
        'offer `Graph` classes the ability to transform to/from a `Matrix` representations',
        'offer functionality for tracking various `Graph statistics`, especially those that can help determine which algorithm to use depending on the properties on the data-set'
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

@f40.spawn_behaviors(
    [
        'offers an abstraction over the `docker-api` gem',
        'offers health checks for current local dev state'
    ]
)

@f41.spawn_behaviors(
    [
        'offers functionality wrappers for provided brew commands',
        'offers health checks for current local dev state'
    ]
)

@f92.spawn_behaviors(
    [
        'enable support for SQLite3',
        'enable support for ActiveRecord',
        'enable support for pg for PostgreSQL'
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
