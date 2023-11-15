## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  
  #j as the inverse matrix
  j <- NULL
  
  #Define the set function for the matrix
  set <- function(y){
    x <<- y
    j <<- NULL
  }
  get <- function()x
  
  #Assign the inverse matrix to the environment using operator "<<-"
  setInverse <- function(inverse) j <<- inverse
  
  #Define the function for the returning inverse matrix
  getInverse <- function() j 
  list(set = set, get = get, 
       setInverse = setInverse, 
       getInverse = getInverse)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  
  j <- x$getInverse()
  if(!is.null(j)){
    
    # Gets the inverse from the cache
    
    message("getting cached data")
    return(j)
  }
  mat <- x$get()
  j <- solve(mat,...)
  
  #Sets the value of the inverse in the cache via set inverse function
  x$setInverse(j)
  j
  
}
