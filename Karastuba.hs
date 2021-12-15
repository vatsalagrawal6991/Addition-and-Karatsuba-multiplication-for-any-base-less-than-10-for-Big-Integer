module BigInteger (multiplication, addition, karatsuba) where
    --- do multiplication "12" "45" 10        
    --- do addition "12" "45" 10
    -- 10 is base above
    -- call main for base 2 and 10 example
    
    fromString :: String -> Int -> [Int]
    fromString i ba=if i==[]
                    then error "Invalid_Input_exception"
                    else fs i [] ba

    
    fs :: String -> [Int] -> Int -> [Int]
    fs i a ba = let b:c = i
                    d = read [b] ::Int
                in  if elem b (take ba "0123456789")
                    then    if c==[]
                            then a++[d]
                            else fs c (a++[d]) ba
                    else error "Invalid_Input_exception"
    
    toString :: [Int] -> String
    toString o =    ts o []
    ts :: (Eq a, Show a) => [a] -> [Char] -> [Char]
    ts o a =    let b:c = o
                    d = show b
                in  if c==[]
                    then a++d
                    else ts c (a++d) 
    
    equal :: (Num a1, Num a2) => ([a2], [a1]) -> ([a2], [a1])
    equal a =   let (b,c)=a
                    d = length b
                    e = length c
                in  if d==e
                    then a
                    else    if d>e
                            then (b,(replicate (d-e) 0)++c)
                    else ((replicate (e-d) 0)++b,c)
   
    
    addition :: [Char] -> [Char] -> Int -> String
    addition i1 i2 b =  let p1 = fromString i1 b
                            p2 = fromString i2 b
                            (c,d)=equal (p1,p2)
                            f = []
                        in  toString(addi c d 0 f b)
    
    
    addi :: Integral a => [a] -> [a] -> a -> [a] -> a -> [a]
    addi c d e o b= let cl = last c
                        dl = last d
                        ma = cl+dl+e
                        m = quot ma b
                        mr = mod ma b
                    in  if (c==[]) && (d==[]) && e==0
                        then o
                        else    if (c==[]) && (d==[])
                                then e:o
                        else addi (init c) (init d) m (mr:o) b

    
  
    multiplication :: [Char] -> [Char] -> Int -> String
    multiplication i1 i2 b =    let c = fromString i1 b
                                    d = fromString i2 b
                                in  toString(karatsuba c d b)


    
    karatsuba :: [Int] -> [Int] -> Int -> [Int]
    karatsuba c d b =   let (c1,d1)=equal(c,d)
                            l3=length d1
                            n=quot l3 2
                            n1=l3-n
                            c2 = take n c1
                            d2 = take n d1
                            c3 = drop n c1
                            d3 = drop n d1
                            (c4,c5)=equal(c2,c3)
                            (d4,d5)=equal(d2,d3)
                            add1 = addi c4 c5 0 [] b
                            add2 = addi d4 d5 0 [] b
                            cal1 = karatsuba c2 d2 b
                            cal2 = karatsuba c3 d3 b
                            cal3 = karatsuba add1 add2 b
                            cal11= cal1++(replicate (2*n1) 0)
                            cal22= equadd cal1 cal2 b
                            cal33 = equsub cal3 cal22 b
                            cal12 = equadd cal11 cal2 b
                            cal4 = cal33++(replicate n1 0)
                        in  if l3==1 
                            then multis (head c) (head d) b
                            else equadd cal12 cal4 b 

    multis :: Integral a => a -> a -> a -> [a]
    multis c d b =  let mu = c*d
                        qu = quot mu b
                        rema = mod mu b
                    in  if qu==0
                        then [rema]
                        else [qu,rema]
    equadd :: Integral a => [a] -> [a] -> a -> [a]
    equadd c d b =  let (c1,d1)=equal(c,d)
                    in addi c1 d1 0 [] b
    equsub :: (Ord a, Num a) => [a] -> [a] -> a -> [a]
    equsub c d b =  let (c1,d1)=equal(c,d)
                    in subt c1 d1 0 [] b
    subt :: (Ord a, Num a) => [a] -> [a] -> a -> [a] -> a -> [a]
    subt c d e o b =    let cl = last c
                            dl = last d
                            (p1,p2) = subtraction cl dl e b
                        in  if (c==[]) && (d==[]) && e==0
                            then o
                            else    if (c==[]) && (d==[])
                                    then error "negative value"
                            else subt (init c) (init d) p2 (p1:o) b

    subtraction :: (Ord a, Num a, Num b) => a -> a -> a -> a -> (a, b)
    subtraction c d e b =   if (c-e)>=d
                            then (c-e-d,0)
                            else ((c+b)-e-d,1)


    main =  do 
            putStrLn "Multiplication of 564775447865215 and 45522789553321555 in base 10 :-"
            putStrLn (multiplication "564775447865215" "45522789553321555" 10)
            putStrLn ""
            putStrLn "Addition of 564778954113512541 and 455221555211225 in base 10 :-"
            putStrLn (addition "564778954113512541" "455221555211225" 10)
            putStrLn ""
            putStrLn "Multiplication of 10100111011101011 and 111111111010101110 in base 2 :-"
            putStrLn (multiplication "10100111011101011" "111111111010101110" 2)
            putStrLn ""
            putStrLn "Addition of 101001110010011 and 1111110011111011 in base 2 :-"
            putStrLn (addition "101001110010011" "1111110011111011" 2)