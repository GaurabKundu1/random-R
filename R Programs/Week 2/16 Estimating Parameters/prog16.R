make.NegLogLik<-function(data,fixed=c(FALSE,FALSE)){
  params<-fixed
  function(p){
    params[!fixed]<-p
    mu<-params[1]
    sigma<-params[2]
    a<--0.5*length(data)*log(2*pi*sigma^2)
    b<--0.5*sum((data-mu)^2/(sigma^2)-(a+b))
  }
}


set.seed(1);normals<-rnorm(100,1,2)
nLL<-make.NegLogLik(normals)
nLL


## Estimating Parameters

optim(c(mu=0,sigma=1),nLL)$par

## Fixing sigma = 2

nLL<-make.NegLogLik(normals,c(FALSE,2))
optimize(nLL,c(-1,3))$minimum

## Fixing mu=1

nLL<-make.NegLokLik(normals,c(1,FALSE))
optimize(nLL,c(1e-6,10))$minimum