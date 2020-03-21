
/*____________________________________________________________________________________________________________________________________________________________________
  __   __        __  ___           ___                         ___  __
 /  ` /  \ |\ | /__`  |   /\  |\ |  |     \  /  /\  |    |  | |__  /__`
 \__, \__/ | \| .__/  |  /~~\ | \|  |      \/  /~~\ |___ \__/ |___ .__/
____________________________________________________________________________________________________________________________________________________________________ */
// superscripts: 0-10
#define 𝔠EXPONENTS 10
#define 𝔠ULONG sizeof(unsigned long)
// rb_ary_new: uses a default size of 16
#define 𝔠ARY_DEFAULT 16L

static const VALUE ℤn9 = INT2NUM(-9);
static const VALUE ℤn8 = INT2NUM(-8);
static const VALUE ℤn7 = INT2NUM(-7);
static const VALUE ℤn6 = INT2NUM(-6);
static const VALUE ℤn5 = INT2NUM(-5);
static const VALUE ℤn4 = INT2NUM(-4);
static const VALUE ℤn3 = INT2NUM(-3);
static const VALUE ℤn2 = INT2NUM(-2);
static const VALUE ℤn1 = INT2NUM(-1);
static const VALUE ℤ0  = INT2NUM(0);
static const VALUE ℤ1  = INT2NUM(1);
static const VALUE ℤ2  = INT2NUM(2);
static const VALUE ℤ3  = INT2NUM(3);
static const VALUE ℤ4  = INT2NUM(4);
static const VALUE ℤ5  = INT2NUM(5);
static const VALUE ℤ6  = INT2NUM(6);
static const VALUE ℤ7  = INT2NUM(7);
static const VALUE ℤ8  = INT2NUM(8);
static const VALUE ℤ9  = INT2NUM(9);

/*____________________________________________________________________________________________________________________
  ___            __   __       __   ___  __             __       ___    __        __
 |__  |  | |\ | /  ` /__` .   |  \ |__  /  ` |     /\  |__)  /\   |  | /  \ |\ | /__`
 |    \__/ | \| \__, .__/ .   |__/ |___ \__, |___ /~~\ |  \ /~~\  |  | \__/ | \| .__/
_____________________________________________________________________________________________________________________ */

static inline void assign_exponential_index_position(unsigned long object_id, const int represented_integer);
static int internal_only_compare_func_4_object_id(const void * l , const void * r);


/*
//unsigned long id_7 = NUM2ULONG(rb_obj_id(rb_const_get_at(rb_cNumeric, rb_intern("EXPONENTIAL_ID_7"))));

*/
