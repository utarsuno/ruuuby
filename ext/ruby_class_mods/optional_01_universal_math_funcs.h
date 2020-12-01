// encoding: UTF-8

#ifndef RUUUBY_OPTIONAL_01
#define RUUUBY_OPTIONAL_01

/*____________________________________________________________________________________________________________________
 __        __        ___
/  `  /\  /  ` |__| |__
\__, /~~\ \__, |  | |___
_____________________________________________________________________________________________________________________ */

static VALUE ⓜuniversal_functions;

/*____________________________________________________________________________________________________________________
                  ___  __   __                        ___          ___            __  ___    __        __
|  | |\ | | \  / |__  |__) /__`  /\  |      |\/|  /\   |  |__|    |__  |  | |\ | /  `  |  | /  \ |\ | /__`
\__/ | \| |  \/  |___ |  \ .__/ /~~\ |___   |  | /~~\  |  |  |    |    \__/ | \| \__,  |  | \__/ | \| .__/
_____________________________________________________________________________________________________________________ */

VALUE m_gamma(const VALUE self, const VALUE them);
//static long double kummer_confluent_hypergeometric(const long double val_z, const long double val_s);
//static long double gamma_incomplete(long double s, long double z);
//VALUE m_gamma_incomplete(const VALUE self, const VALUE s, const VALUE z);
//VALUE m_chi_squared_test(const VALUE self, const VALUE degrees_of_freedom, const VALUE critical_value);

/*
 * this function already exists in base Ruby (`Math.gamma`), added for learning purposes + pending customizations
 */
VALUE m_gamma(const VALUE self, const VALUE them) {
    🛑_is_flt("Math::UniversalFunctions", "gamma", "gamma_arg", them);
    double the_val = NUM2DBL(them);
    if (the_val == -1.0) {re_inf_complex}
    the_val        = tgamma(the_val);
    return DBL2NUM(the_val);
}

#endif
