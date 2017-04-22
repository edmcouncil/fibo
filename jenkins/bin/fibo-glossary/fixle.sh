# Removes bad line endings from the input file
# We use this if moving stuff through git has changed the line endings.
# This can cause scripts not to work
# You probably want to do 
# find . -name '*' -exec ./fixle.sh {} \;

if [ -f "$1" ] ; then
tr -d '\15\32' <$1 >temp.le
rm $1
mv temp.le $1
chmod a+x $1
fi
