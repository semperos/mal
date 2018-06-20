READ=:[
EVAL=:[
PRINT=:[
rep=:PRINT@:EVAL@:READ
readln =: [: (1!:01) 1:
readline=: 2!:0 bind 'read line; echo "$line"'

3 : 0''
while. (1=1)
do.
  echo 'user>'
  form=:readline ''
  echo (rep form)
end.
exit''
)