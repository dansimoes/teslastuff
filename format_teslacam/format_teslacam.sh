# creates formatted single volume for TeslaCam
# tested and works on OSX Mojave 10.14.5
# check for correct syntax
if [ $# -ne 1 ]
then
 echo "format_tesla_usb <disk>"
 echo "ex format_tesla_usb disk3"
 echo "Let's verify disk number by running diskutil list like this:"
 diskutil list
 echo "determine which disk number you need and rerun this command adding the name of the disk."
 echo "So for /dev/disk3, enter just disk3."
 exit 0
fi

diskutil list
echo ""
echo ""
echo ""
echo "OK, ready to format external disk /dev/$1 for Tesla Model 3."
echo -n "Hit enter to continue or control C to exit now if this is not right. "
read hit
echo ""
echo "OK, here we go..."
diskutil partitionDisk $1 1 GPT MS-DOS TC R
# set up TeslaCam
mkdir /Volumes/TC/TeslaCam

echo "All set.  You now have a formatted volume, TC for TeslaCam (sentinel folder is already there).  Eject the volume and stick it in the center console USB slot."
