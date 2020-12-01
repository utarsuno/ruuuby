// encoding: UTF-8

#ifndef RUUUBY_OPTIONAL_02
#define RUUUBY_OPTIONAL_02

/*____________________________________________________________________________________________________________________
 __        __        ___
/  `  /\  /  ` |__| |__
\__, /~~\ \__, |  | |___
_____________________________________________________________________________________________________________________ */

static VALUE ⓜstats;
static VALUE ⓜstats_distribution;
static VALUE ⓜstats_distribution_normal;

/*____________________________________________________________________________________________________________________



_____________________________________________________________________________________________________________________ */

static double normal_distribution_area(const double z);
static double normal_distribution_area_above(const double z);
static double normal_distribution_area_below(const double z);
static double normal_distribution_area_between(const double z0, const double z1);
static double normal_distribution_area_outside(const double z0, const double z1);

// @see https://www.me.psu.edu/cimbala/me345/Lectures/Gaussian_or_Normal_PDF.pdf
static double normal_distribution_area(const double z) {
    return ½ * erf(fabs(z) / SQRT𝟚);
}

static double normal_distribution_area_above(const double z) {
    if (z > 0.0) {
        return 0.5 - normal_distribution_area(z);
    } else {
        return 1.0 - (0.5 - normal_distribution_area(z));
    }
}

static double normal_distribution_area_below(const double z) {
    return 1.0 - normal_distribution_area_above(z);
}

static double normal_distribution_area_between(const double z0, const double z1) {
    if (z0 == z1) {
        return 0.0;
    } else if (z0 == 0.0) {
        return normal_distribution_area(z1);
    } else if (z1 == 0.0) {
        return normal_distribution_area(z0);
    } else if ((z0 < 0.0 && z1 < 0.0) || (z0 > 0.0 && z1 > 0.0)) {
        const double area0 = normal_distribution_area(z0);
        const double area1 = normal_distribution_area(z1);
        return area0 > area1 ? area0 - area1 : area1 - area0;
    } else {
        return normal_distribution_area(z0) + normal_distribution_area(z1);
    }
}

static double normal_distribution_area_outside(const double z0, const double z1) {
    return 1.0 - normal_distribution_area_between(z0, z1);
}

static VALUE m_normal_distribution_area_above(const VALUE self, const VALUE them);
static VALUE m_normal_distribution_area_below(const VALUE self, const VALUE them);
static VALUE m_normal_distribution_area_between(const VALUE self, const VALUE param_a, const VALUE param_b);
static VALUE m_normal_distribution_area_outside(const VALUE self, const VALUE param_a, const VALUE param_b);

static VALUE m_normal_distribution_area_above(const VALUE self, const VALUE them) {
    🛑_is_flt("Math::Stats::Distribution::Normal", "above", "z", them);
    return DBL2NUM(normal_distribution_area_above(NUM2DBL(them)));
}

static VALUE m_normal_distribution_area_below(const VALUE self, const VALUE them) {
    🛑_is_flt("Math::Stats::Distribution::Normal", "below", "z", them);
    return DBL2NUM(normal_distribution_area_below(NUM2DBL(them)));
}

static VALUE m_normal_distribution_area_between(const VALUE self, const VALUE param_a, const VALUE param_b) {
    🛑_is_flt("Math::Stats::Distribution::Normal", "between", "z0", param_a);
    🛑_is_flt("Math::Stats::Distribution::Normal", "between", "z1", param_b);
    return DBL2NUM(normal_distribution_area_between(NUM2DBL(param_a), NUM2DBL(param_b)));
}

static VALUE m_normal_distribution_area_outside(const VALUE self, const VALUE param_a, const VALUE param_b) {
    🛑_is_flt("Math::Stats::Distribution::Normal", "outside", "z0", param_a);
    🛑_is_flt("Math::Stats::Distribution::Normal", "outside", "z1", param_b);
    return DBL2NUM(normal_distribution_area_outside(NUM2DBL(param_a), NUM2DBL(param_b)));
}

#endif
