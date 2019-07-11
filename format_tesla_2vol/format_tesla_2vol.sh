# tested and works on OSX Mojave 10.14.5
# check for correct syntax
if [ $# -ne 1 ]
then
 echo "format_tesla_2vol <disk>"
 echo "ex format_tesla_2vol disk3"
 echo "verify disk number by running diskutil list like this:"
 diskutil list
 echo "determine which disk number you need and rerun this command adding the name of the disk."
 echo "So for /dev/disk3, enter just disk3."
 exit 0
fi

diskutil list
echo ""
echo ""
echo ""
echo "OK, ready to partition disk /dev/$1 for Tesla Model 3."
echo -n "Hit enter to continue or control C to exit now if this is not right. "
read hit
echo ""
echo "OK, here we go..."
diskutil partitionDisk /dev/$1 2 GPT MS-DOS TC 50% MS-DOS M R
# set up TeslaCam
mkdir /Volumes/TC/TeslaCam

echo "All set.  You now have 2 volumes, TC for TeslaCam (sentinel folder is already there) and M for music."
echo "Copy your mp3, flac or mp4a files onto the M volume and enjoy."
