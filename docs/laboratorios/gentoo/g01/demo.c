#include "config.h"
#if FEATURE
#include "feature.h"
#endif
unsigned run(unsigned n) {
#if FEATURE
    return transform(n) + STEP;
#else
    return n + STEP;
#endif
}
