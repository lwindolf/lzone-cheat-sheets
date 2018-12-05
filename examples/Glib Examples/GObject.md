## GObject Simple C Boilerplate

No interface, just an object...

### Header "my_object.h"

    #ifndef __MY_OBJECT_H
    #define __MY_OBJECT_H
    
    #include <glib.h>

    #define MY_OBJECT_TYPE (my_object_get_type ())
    G_DECLARE_FINAL_TYPE (MyObject, my_object, MY, OBJECT, GObject)

    MyObject * my_object_new (void);

    int my_object_get_number (MyObject *myo);

    #endif
    
### Implementation

    #include "my_object.h"

    struct _MyObject {
         GObject parentInstance;      // mandatory
         
         // your object members
         ...
    }
    
    G_DEFINE_TYPE (MyObject, my_object, G_TYPE_OBJECT)
    
    static void my_object_finalize (GObject *object) {
         // FIXME
    }
    
    static void my_object_class_init (MyObjectClass *klass) {
        GObjectClass *object_class = G_OBJECT_CLASS (klass);

        object_class->finalize = my_object_finalize;
        // maybe also register property setter/getter
    }
    
    static void my_object_init (MyObject *myo) {
        // Setup members...
    }
