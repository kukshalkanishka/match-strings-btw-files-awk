#! /usr/bin/awk
BEGIN{
  FS=" "
  i_alpha=1
  i_words=1
};
($1 == 1){
  place= match($2, /[a-z]/)
  subt= place - 1
  alpha[i_alpha]=alpha[i_alpha] "" substr($2, place, 4)
  numbers[i_alpha]=numbers[i_alpha] "" substr($2, 1, subt)
  i_alpha+=1
}
($1 == 2){
  words[i_words]=words[i_words] "" $2
  i_words+=1
};
END{
  for(matching in alpha){
    expression= alpha[matching]
    for(value in words){
      string=words[value]
      where=match(string, expression)
      if(where !=0){
        break;
      }
    }
    no= numbers[matching] 
    word= words[value]
    no=no""word
    print no 
  }
};


  
  
