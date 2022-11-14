Types of arrays:

0 D --> 5

1 D --> [0,5,2]

2 D --> [[0,5,2]
         [2,1,3]
         [6,5,10]


%%timeit can be used to time your code processing speed


Built-in methods and functions

Methods are called *on* the numpy object, so they begin with the numpy array variable name, which is `a` in this case. 
These are methods: a.sum(), a.mean(), a.min(), a.max(), a.std()

Functions begin with `np.` and the array is one of the function arguments, such as `np.sqrt(a)`. 

Some operations have both a method and a function, such as summing all items in an array. `np.sum(a)` and `a.sum()` do the same thing. 

a method starts with array name
-like a.mean() or a.max()

a function starts with np.
-like np.sum(a) or np.sqrt(a)


.dtype returns the datatypes of the items in the array
type(a) returns the datatype of the array itself 

can use np.where() as a means to filter
Maggie says .where() is one of the most used aspects of numpy for her


