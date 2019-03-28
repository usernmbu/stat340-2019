CV.class <- function(obj, data, folds=as.list(1:obj$N)){
  require(MASS)
  require(mixlm)
  nfolds <- length(folds)
  n <- obj$N
  pred <- rep(0, n)
  for(i in 1:nfolds){
    mod <- update(obj, subset=-folds[[i]])
    pred[folds[[i]]] <- predict(mod, newdata=data[folds[[i]],,drop=FALSE])$class
  }
  res <- list()
  attach(data)
  res$true <- eval(attr(formula(obj),"variables"))[[1]]
  pred <- factor(pred, labels=levels(res$true))
  detach(data)
  res$predicted <- pred
  confusion(res$true,res$predicted)
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
