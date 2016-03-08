tr -d '\15\32' <$1 >temp.le;rm $1;mv temp.le $1;chmod a+x $1
