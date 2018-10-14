#! /usr/bin/awk
{
 place= match($2, /[a-z]/)
 alpha=substr($2, place, 4)
}
($1 == 1){
  arr[alpha]=arr[alpha] "" $2
}
($1 == 2){ 
  num= match($2, /[0-9]/)
  arr[alpha]=arr[alpha] "" substr($2, num, 3)
} 
END{
  for(a in arr){
    print arr[a]
  }
};
