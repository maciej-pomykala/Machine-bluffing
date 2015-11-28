x<- c(rep(2:14,4))

#NIE MA ZNACZENIA DO KOGO NALEZA KARTY, WIEC ZAWSZE PRZESZUKUJE JE JAKO JEDEN ZBIÓR

numplayers<- function()
{
  cat("Ilosc graczy:","\n")
  players<-scan("",n=1, quiet=TRUE)
  return(players)
}

check <- function(cards, type, value)
{
  result<-0
  
  if (type==1 & length(which(cards==value))>0) {result=1}
  if (type==2 & length(which(cards==value))>1) {result=1}
  if (type==3 & length(which(cards==value[1]))>1 & length(which(cards==value[2]))>1) {result=1}
  if (type==4 & length(which(cards==value))>2) {result=1}
  if (type==5 & length(which(cards==c(value)))>0 & length(which(cards==c(value+1)))>0 & length(which(cards==c(value+2)))>0 & length(which(cards==c(value+3)))>0 & length(which(cards==c(value+4)))>0 ) {result=1}
  if (type==6 & length(which(cards==value[1]))>2 & length(which(cards==value[2]))>1) {result=1}
  if (type==7 & length(which(cards==value))==4) {result=1}
  
  return(result)
}


ishigher <- function(type, value, last)
{
  ret=0
  correct=1
  if(type<1 || type>7) {correct=0}
  if(min(value)<2 || max(value)>14) {correct=0}
  
  higher=0
  if(type>last[1]) {higher=1}
  if(type==last[1] &type!=6 & max(value)>max(last[2:length(last)])) {higher=1}
  if(type==last[1] &type==6 & value[1]>last[2]) {higher=1}
  if(type==last[1] &type==6 & value[1]==last[2] &  value[2]>last[3]) {higher=1}
  
  if (correct==1 & higher==1) {ret=1} 
  return(ret)
}

gettype <- function()
{
  cat('Typ zakladu:', '\n')
  type<-scan("",n=1, quiet=TRUE)
  return(type)
}

getvalue <- function(type)
{
  cat('Vartosc', '\n')
  if (type==3 || type==6) value<-scan("",n=2, quiet=TRUE)
  else value<-scan("",n=1, quiet=TRUE)
  return(value)
}

  
getbet <- function(last)
{
  repeat
  {
    type<-gettype()
    value<-getvalue(type)
    if(ishigher(type,value,last)==TRUE) {break}
    cat("Zaklad albo nie jest poprawny albo nie jest wiekszy od poprzedniego","\n")
  }
  return(c(type,value))
}

INTELLIGENCE <- function(last)
{
  getbet(last)
  #JAK NA RAZIE INTELIGENCJA NIE DAJE SIE WYKRYC
}