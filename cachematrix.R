## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## Below are two functions that are used to create a special object that stores a matrix and cache's its inverse.
##The first function, makeCacheMatrix creates a special "matrix", which is really a list containing a function to

 ##   set the value of the matrix
 ##   get the value of the matrix
 ##   set the value of the inverse
 ##   get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get,setinverse = setinverse,getinverse = getinverse)
}


## Write a short comment describing this function
## The following function calculates the inverse of the special "matrix" created with the above function. 
## However, it first checks to see if the inverse has already been calculated. If so, it gets the inverse from the cache. 
## Otherwise, it calculates the inverse of the data and sets the value of the inverse in the cache via the setinverse function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}
