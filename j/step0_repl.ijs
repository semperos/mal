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
NB.   stdout 'user>'
NB.   'user>' (1!:3) 4
  form=:readline ''
  echo (rep form)
end.
exit''
)