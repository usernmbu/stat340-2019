CV <- function(obj, folds=as.list(1:length(obj$fitted.values))){
  nfolds <- length(folds)
  n <- length(obj$fitted.values)
  pred <- rep(0, n)
  for(i in 1:nfolds){
    mod <- update(obj, subset=-folds[[i]])
    pred[folds[[i]]] <- predict(mod, newdata=obj$mod[folds[[i]],,drop=FALSE])
  }
  res <- list()
  res$pred <- pred
  res$msep <- mean((obj$mod[,1]-pred)^2)
  res$r.squared.pred <- cor(obj$mod[,1],pred)^2
  return(res)
}

Kfold <- function(n, K, random=TRUE){
  ord <- 1:n
  if(random) ord <- sample(n,n,replace=FALSE)
  foldmat <- matrix(ord, nrow=K)
  folds <- list()
  for(i in 1:K){
    folds[[i]] <- foldmat[i,]
  }
  return(folds)
}
