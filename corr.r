corr <- function(directory, threshold = 0) {
        all<-complete(directory)
        grtr<-all$id[all$nobs>threshold]
        cr<-numeric(0)         
        for (i in seq_along(grtr)){
                nr2txt<-substr(format(grtr[i]/1000,nsmall = 3),3,5)
                fn<-paste(directory,"/",nr2txt,".csv", sep = "")
                x<-read.csv(fn)
                cr[i]<-cor (x=x$sulfate,y=x$nitrate, use = "pairwise.complete.obs")
        }
        cr
}
