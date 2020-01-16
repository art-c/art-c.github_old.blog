echo \"$@\"

if [ $# -ne 0 ];then
    echo everybody
fi

mylist="1 2 3 4 5"
i=1
for item in $mylist;do
    echo $i: $item
    i=`expr $i+1`
done

