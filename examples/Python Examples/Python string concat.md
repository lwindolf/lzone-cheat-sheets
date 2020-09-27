## String Concatenation

By simplying using the "+" operator.

     "abc" + "def"

## printf style formatting

Often it might be good to just format strings using the '%' operator

     print("1:%s 2:%s" % (s1, s2))

Using '%Ä with explicit positions

     print("1:%{s1} 2:%{s2}" % (s1, s2))
     
## str.format OOP style

    '1:{} 2:{}'.format(s1, s2)
    
Using 'format' with explicit positions

    '2:{s2} 1:{s1}'.format(s1, s2)
