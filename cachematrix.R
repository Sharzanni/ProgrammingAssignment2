## Put comments here that give an overall description of what your
## functions do

##The MakeCacheMatrix function creates an object and returns a pointer to it.
## The object contains two values (original matrix value and the solved matrix)
## and 4 methods to access those values:  set* and get*.
## The solved matrix is initially set to NULL. 

## The output of MakeCacheMatrix is an object that will be accessed by the cacheSolve function

## The cacheSolve function first looks for whether the solved matrix is present 
## (i.e. is not NULL). If the value of the solved matrix is NULL, the inverse 
## matrix is calculated and stored into cacheSolve function via setsolve().
## The functions returns the inverse matrix -- either from cache or from calculation.

## Write a short comment describing this function

## makeCacheMatrix takes a matrix that is passed to it (referred to as x)
## solved_matrix is set to NULL
## set function is used to store the matrix that is passed to the function
## get function is used to retrieve the matrix that was input
## setsolve function stores the value of the object passed in (in this case, the
## value comes from cacheSolve function's solve call)
## getsolve function retrieves the stored value 'solved_matrix'
## This function also contains a list of the internal functions that can be
## accessed from the MakeCacheMatrix object

# example use
# my_obj <- makeCacheMatrix(my_matrix)
makeCacheMatrix <- function(x = matrix()) {
  solved_matrix <- NULL
  set <- function(y) { 
    x<<- y
    solved_matrix <<- NULL
  }
  get <- function() { x }
  setsolve <- function(y2) { solved_matrix <<- y2 }
  getsolve <- function () { solved_matrix }
  list (set=set, get=get, setsolve=setsolve, getsolve=getsolve)
}


## Write a short comment describing this function


## cacheSolve takes an object created by MakeCacheMatrix and checks to see if 
## the stored value retrieved by getsolve method is not NULL.
## If it is not NULL, it will return a message "getting cached data" and 
## it will return the cached value of solved_matrix
## If the value is NULL, it will calculate the inverse matrix (using the solve 
## function) of the matrix object from MakeCacheMatrix and return that inverse matrix

# example use
# my_inverse_matrix <- cacheSolve(my_obj)
# or just this
# cacheSolve(my_obj)
cacheSolve <- function(x, ...) {
  getsolve_result <- x$getsolve()
  if(!is.null(getsolve_result)) {
    message("getting cached data")
    return(getsolve_result)
  }
  data <- x$get()
  newsolve_result <- solve(data, ...)
  x$setsolve(newsolve_result)
  return(newsolve_result)
        
}
