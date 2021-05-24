## The following functions return the inverse of a
##square matrix.  

## This function creates a special matrix object that
##can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) inv <<- inverse
  getInverse <- function() inv
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

## This function computes the inverse of the special
## matrix. If the inverse has already been calculated,
## it should be retrieved from the cache instead of 
## being calculated agian

cacheSolve <- function(x, ...) { 
  inv <- x$getInverse()
  if(!is.null(inv)) {
  message("getting cached data")
  return(inv)
}
data <- x$get()
inv <- solve(data)
x$setInverse(inv)
inv
}

