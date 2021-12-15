# Made By Vatsal Agrawal
# Karatsuba-multiplication-for-any-base-less-than-10-and-using-Big-Integer
Big Integer library for Addition and Karatsuba multiplication for any base less than 10 with exception raising

**************************HOW TO MAKE EXECUTABLE AND RUN PROGRAMME******************************
1) Run multiplication "564775447865215" "45522789553321555" 10 like function for Multiplication 10 is base passed here
2) Run addition "564778954113512541" "455221555211225" 10 like function for Multiplication 10 is base passed here
3) Run main for prebuilt examples 


Problem Statment 

The goal in this problem is to create a big integer module in Haskell from scratch. Note that
big integer arithmetic is widely used in multi-precision libraries in high-performance computing, as
well as in cryptography (e.g., RSA). Your specific tasks include the implementation of addition and
multiplication of two large integers. While the addition logic is the same as what is taugh in high
school, the multiplication logic is going to be different.
The multiplication of two n−digit numbers by the usual long multiplication algorithm (columnwise) that is taught in schools takes about O(n
2
) single-digit multiplications. According to the
Wikipedia, Karatsuba’s algorithm (discovered by Anatoly Karatsuba in 1960) reduces the complexity
of multiplication of two n−digit numbers to at most n
lg23
single-digit multiplications. Note that
you may have to take special care for overflow.
• Note that you are not allowed to use existing libraries for big integers.
• Also, the input and output numbers to these functions are strings of digits. Therefore, define
auxillary functions fromString: string -> [int] and toString: [int] -> string for
purposes of input and output, respectively.
• Your solution should be parametric in the base B in which the lists of digits have to be
manipulated.
• The Karatsuba multiplication function takes two numbers as input and returns the result
of multiplication. The function to compute Karatsuba multiplication should have signature
karatsuba: [int] -> [int] -> [int]
• If the input string is not a valid number, your program should raise an exception of type
exception string Invalid Input exception.



