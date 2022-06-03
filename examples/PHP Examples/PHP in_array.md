## Usage

    in_array("value", myarray)        # Checks if "value" is in myarray (non-case sensitive!)
    in_array("value", myarray, TRUE)  # Checks if "value" is in myarray (case-sensitive)
    
    in_array(5, myarray)              # Checks wether 5 or "5" is in myarray
    in_array(5, myarray, TRUE)        # Check if number 5 is in myarray

Note how the 3rd parameter ensures type safety/case-sensitivity.

In case of a match TRUE is returned.
