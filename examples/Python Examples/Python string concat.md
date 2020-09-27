## String Concatenation

By simplying using the "+" operator.

     "abc" + "def"

## printf style formatting

Often it might be good to just format strings using the '%' operator

     print("1:%s 2:%s" % (s1, s2))

Using '%' with explicit positions

     print("1:%{s1} 2:%{s2}" % (s1, s2))
     
## str.format OOP style

    '1:{} 2:{}'.format(s1, s2)
    
Using 'format' with explicit positions

    '2:{s2} 1:{s1}'.format(s1=s1, s2=s2)
    
## String Interpolation

    a=3
    b=4
    f'{a} * {b} = {a * b}'

Will result in

    '3 * 4 = 12'

## Best Practices

Its best to always use positional formatting. Note how it can be used to pass objects
