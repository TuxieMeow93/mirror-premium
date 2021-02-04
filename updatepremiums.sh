#!/bin/bash

newline()
{
echo "----------" | tee -a /var/www/html/sortedmirrorpremiums_$today.txt
}


cd /root

dt=$(date +%Y-%m-%d_%H_%M)
today=$(date +%Y-%m-%d)
mkdir -p /var/www/html/mirrorpremiums/$today
cp totallog.txt /root/bak/$dt.txt
python3 /root/premiumcalculator.py | tee /root/log.txt
wait
cat /root/log.txt |tee -a /var/www/html/mirrorpremiums/$today/$today.txt
cd /var/www/html
cp mirrorpremiums/$today/$today.txt mirrorpremiums_$today.txt

##search for individual assets
grep -ie "mQQQ" /var/www/html/mirrorpremiums_$today.txt | tee /var/www/html/mQQQmirrorpremiums_$today.txt | tee -a sortedmirrorpremiums_$today.txt
newline()
grep -ie "mTSLA" /var/www/html/mirrorpremiums_$today.txt | tee /var/www/html/mTSLAmirrorpremiums_$today.txt| tee -a sortedmirrorpremiums_$today.txt
grep -ie "mNFLX" /var/www/html/mirrorpremiums_$today.txt | tee /var/www/html/mNFLXmirrorpremiums_$today.txt| tee -a sortedmirrorpremiums_$today.txt
grep -ie "mIAU" /var/www/html/mirrorpremiums_$today.txt | tee /var/www/html/mIAUmirrorpremiums_$today.txt| tee -a sortedmirrorpremiums_$today.txt
grep -ie "mUSO" /var/www/html/mirrorpremiums_$today.txt | tee /var/www/html/mUSOmirrorpremiums_$today.txt| tee -a sortedmirrorpremiums_$today.txt
grep -ie "mSLV" /var/www/html/mirrorpremiums_$today.txt | tee /var/www/html/mSLVmirrorpremiums_$today.txt| tee -a sortedmirrorpremiums_$today.txt
grep -ie "mTWTR" /var/www/html/mirrorpremiums_$today.txt | tee /var/www/html/mTWTRmirrorpremiums_$today.txt| tee -a sortedmirrorpremiums_$today.txt
grep -ie "mVIXY" /var/www/html/mirrorpremiums_$today.txt | tee /var/www/html/mVIXYmirrorpremiums_$today.txt| tee -a sortedmirrorpremiums_$today.txt
grep -ie "mAMZN" /var/www/html/mirrorpremiums_$today.txt | tee /var/www/html/mAMZNmirrorpremiums_$today.txt| tee -a sortedmirrorpremiums_$today.txt
grep -ie "mGOOG" /var/www/html/mirrorpremiums_$today.txt | tee /var/www/html/mGOOGmirrorpremiums_$today.txt| tee -a sortedmirrorpremiums_$today.txt
grep -ie "mMSFT" /var/www/html/mirrorpremiums_$today.txt | tee /var/www/html/mMSFTmirrorpremiums_$today.txt| tee -a sortedmirrorpremiums_$today.txt
grep -ie "mBABA" /var/www/html/mirrorpremiums_$today.txt | tee /var/www/html/mBABAmirrorpremiums_$today.txt| tee -a sortedmirrorpremiums_$today.txt
grep -ie "mAAPL" /var/www/html/mirrorpremiums_$today.txt | tee /var/www/html/mAAPLmirrorpremiums_$today.txt| tee -a sortedmirrorpremiums_$today.txt
