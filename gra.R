##GRA

MAIN<-function()
{
  currentplayer=1
  history=list()
  pcards<-rep(1,numplayers())
  
  repeat
{
  betnumber<-1
  last<-c(1,1)
  last<-getbet(last)
  numcard=sum(pcards)
  cards<-as.vector(sample(x,numcard,replace=FALSE))
  
  ##JEDNO ROZDANIE KART
  repeat
  {
    history[betnumber]<-last
    betnumber=betnumber+1
    currentplayer=currentplayer+1
    if (currentplayer==0) {currentplayer=length(pcards)}
    if (currentplayer==length(pcards)+1) {currentplayer=currentplayer-length(pcards)}
    cat('Aktualny gracz: ',currentplayer,'\n')
    
    cat('Czy chcesz sprawdzac?', '\n','1: Tak','\n','2: Nie')
    action<-scan("", n=1, quiet=TRUE)
    
    if (action==1) 
    {
      for(i in 1:length(pcards))
      {
        cat("Karty gracza",i,": ",cards[sum(pcards[1:i-1])+ 1:pcards[i]],"\n")
      }
      pcards[currentplayer]=pcards[currentplayer]+check(cards, last[1],last[2:length(last)])
      if (currentplayer>1) {pcards[currentplayer-1]=pcards[currentplayer-1]+1-check(cards, last[1],last[2:length(last)])}
      if (currentplayer==1) {pcards[length(pcards)]=pcards[length(pcards)]+1-check(cards, last[1],last[2:length(last)])}
      cat('\n',pcards,'\n')
      currentplayer=currentplayer-1+check(cards, last[1],last[2:length(last)])
      break
    }
    if (action==2)
    {
      if (currentplayer==1) {last<-getbet(last)}
      else last<-INTELLIGENCE(last)
    }
    
    cat(pcards)
  }
  if(max(pcards)==4) {break}
}
  cat("Przegral gracz: ",which(pcards==4))
}

##GRA KONCZY SIE KIEDY JEDEN Z GRACZY MA 4 KARTY