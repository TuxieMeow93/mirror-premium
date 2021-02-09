#!/bin/bash
#Live version: http://mirrorpremiums.com/
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
grep -ie "mQQQ" /var/www/html/mirrorpremiums_$today.txt | tee /var/www/html/mQQQmirrorpremiums_$today.txt
grep -ie "mTSLA" /var/www/html/mirrorpremiums_$today.txt | tee /var/www/html/mTSLAmirrorpremiums_$today.txt
grep -ie "mNFLX" /var/www/html/mirrorpremiums_$today.txt | tee /var/www/html/mNFLXmirrorpremiums_$today.txt
grep -ie "mIAU" /var/www/html/mirrorpremiums_$today.txt | tee /var/www/html/mIAUmirrorpremiums_$today.txt
grep -ie "mUSO" /var/www/html/mirrorpremiums_$today.txt | tee /var/www/html/mUSOmirrorpremiums_$today.txt
grep -ie "mSLV" /var/www/html/mirrorpremiums_$today.txt | tee /var/www/html/mSLVmirrorpremiums_$today.txt
grep -ie "mTWTR" /var/www/html/mirrorpremiums_$today.txt | tee /var/www/html/mTWTRmirrorpremiums_$today.txt
grep -ie "mVIXY" /var/www/html/mirrorpremiums_$today.txt | tee /var/www/html/mVIXYmirrorpremiums_$today.txt
grep -ie "mAMZN" /var/www/html/mirrorpremiums_$today.txt | tee /var/www/html/mAMZNmirrorpremiums_$today.txt
grep -ie "mGOOG" /var/www/html/mirrorpremiums_$today.txt | tee /var/www/html/mGOOGmirrorpremiums_$today.txt
grep -ie "mMSFT" /var/www/html/mirrorpremiums_$today.txt | tee /var/www/html/mMSFTmirrorpremiums_$today.txt
grep -ie "mBABA" /var/www/html/mirrorpremiums_$today.txt | tee /var/www/html/mBABAmirrorpremiums_$today.txt
grep -ie "mAAPL" /var/www/html/mirrorpremiums_$today.txt | tee /var/www/html/mAAPLmirrorpremiums_$today.txt

#new mAssets
#mABNB mBTC mFB mETH mGS
grep -ie "mABNB" /var/www/html/mirrorpremiums_$today.txt | tee /var/www/html/mABNBmirrorpremiums_$today.txt
grep -ie "mBTC" /var/www/html/mirrorpremiums_$today.txt | tee /var/www/html/mAAPLmirrorpremiums_$today.txt
grep -ie "mFB" /var/www/html/mirrorpremiums_$today.txt | tee /var/www/html/mAAPLmirrorpremiums_$today.txt
grep -ie "mETH" /var/www/html/mirrorpremiums_$today.txt | tee /var/www/html/mAAPLmirrorpremiums_$today.txt
grep -ie "mGS" /var/www/html/mirrorpremiums_$today.txt | tee /var/www/html/mAAPLmirrorpremiums_$today.txt

rm -rf sortedmirrorpremiums_$today.txt
touch sortedmirrorpremiums_$today.txt

newline()
{
echo "-------------------------------------------" >> sortedmirrorpremiums_$today.txt
echo "" >> sortedmirrorpremiums_$today.txt
}

cat mAAPLmirrorpremiums_$today.txt | tee -a sortedmirrorpremiums_$today.txt
cat mAAPLmirrorpremiums_$today.txt |awk '{ sum += $1; n++ } END { if (n > 0) print sum / n; }' | tee -a sortedmirrorpremiums_$today.txt
newline

cat mAMZNmirrorpremiums_$today.txt | tee -a sortedmirrorpremiums_$today.txt
cat mAMZNmirrorpremiums_$today.txt |awk '{ sum += $1; n++ } END { if (n > 0) print sum / n; }' | tee -a sortedmirrorpremiums_$today.txt
newline


cat mBABAmirrorpremiums_$today.txt | tee -a sortedmirrorpremiums_$today.txt
cat mBABAmirrorpremiums_$today.txt |awk '{ sum += $1; n++ } END { if (n > 0) print sum / n; }' | tee -a sortedmirrorpremiums_$today.txt
newline

cat mGOOGmirrorpremiums_$today.txt | tee -a sortedmirrorpremiums_$today.txt
cat mGOOGmirrorpremiums_$today.txt |awk '{ sum += $1; n++ } END { if (n > 0) print sum / n; }' | tee -a sortedmirrorpremiums_$today.txt
newline

cat mIAUmirrorpremiums_$today.txt | tee -a sortedmirrorpremiums_$today.txt
cat mIAUmirrorpremiums_$today.txt |awk '{ sum += $1; n++ } END { if (n > 0) print sum / n; }' | tee -a sortedmirrorpremiums_$today.txt
newline

cat mMSFTmirrorpremiums_$today.txt | tee -a sortedmirrorpremiums_$today.txt
cat mMSFTmirrorpremiums_$today.txt |awk '{ sum += $1; n++ } END { if (n > 0) print sum / n; }' | tee -a sortedmirrorpremiums_$today.txt
newline

cat mNFLXmirrorpremiums_$today.txt | tee -a sortedmirrorpremiums_$today.txt
cat mNFLXmirrorpremiums_$today.txt |awk '{ sum += $1; n++ } END { if (n > 0) print sum / n; }' | tee -a sortedmirrorpremiums_$today.txt
newline

cat mQQQmirrorpremiums_$today.txt | tee -a sortedmirrorpremiums_$today.txt
cat mQQQmirrorpremiums_$today.txt |awk '{ sum += $1; n++ } END { if (n > 0) print sum / n; }' | tee -a sortedmirrorpremiums_$today.txt
newline

cat mSLVmirrorpremiums_$today.txt | tee -a sortedmirrorpremiums_$today.txt
cat mSLVmirrorpremiums_$today.txt |awk '{ sum += $1; n++ } END { if (n > 0) print sum / n; }' | tee -a sortedmirrorpremiums_$today.txt
newline

cat mTSLAmirrorpremiums_$today.txt | tee -a sortedmirrorpremiums_$today.txt
cat mTSLAmirrorpremiums_$today.txt |awk '{ sum += $1; n++ } END { if (n > 0) print sum / n; }' | tee -a sortedmirrorpremiums_$today.txt
newline

cat mTWTRmirrorpremiums_$today.txt | tee -a sortedmirrorpremiums_$today.txt
cat mTWTRmirrorpremiums_$today.txt |awk '{ sum += $1; n++ } END { if (n > 0) print sum / n; }' | tee -a sortedmirrorpremiums_$today.txt
newline

cat mUSOmirrorpremiums_$today.txt | tee -a sortedmirrorpremiums_$today.txt
cat mUSOmirrorpremiums_$today.txt |awk '{ sum += $1; n++ } END { if (n > 0) print sum / n; }' | tee -a sortedmirrorpremiums_$today.txt
newline

cat mVIXYmirrorpremiums_$today.txt | tee -a sortedmirrorpremiums_$today.txt
cat mVIXYmirrorpremiums_$today.txt |awk '{ sum += $1; n++ } END { if (n > 0) print sum / n; }' | tee -a sortedmirrorpremiums_$today.txt
newline

#mABNB mBTC mFB mETH mGS

cat mABNBmirrorpremiums_$today.txt | tee -a sortedmirrorpremiums_$today.txt
cat mABNBmirrorpremiums_$today.txt |awk '{ sum += $1; n++ } END { if (n > 0) print sum / n; }' | tee -a sortedmirrorpremiums_$today.txt
newline

cat mBTCmirrorpremiums_$today.txt | tee -a sortedmirrorpremiums_$today.txt
cat mBTCmirrorpremiums_$today.txt |awk '{ sum += $1; n++ } END { if (n > 0) print sum / n; }' | tee -a sortedmirrorpremiums_$today.txt
newline

cat mETHmirrorpremiums_$today.txt | tee -a sortedmirrorpremiums_$today.txt
cat mETHmirrorpremiums_$today.txt |awk '{ sum += $1; n++ } END { if (n > 0) print sum / n; }' | tee -a sortedmirrorpremiums_$today.txt
newline

cat mFBmirrorpremiums_$today.txt | tee -a sortedmirrorpremiums_$today.txt
cat mFBmirrorpremiums_$today.txt |awk '{ sum += $1; n++ } END { if (n > 0) print sum / n; }' | tee -a sortedmirrorpremiums_$today.txt
newline

cat mGSmirrorpremiums_$today.txt | tee -a sortedmirrorpremiums_$today.txt
cat mGSmirrorpremiums_$today.txt |awk '{ sum += $1; n++ } END { if (n > 0) print sum / n; }' | tee -a sortedmirrorpremiums_$today.txt
newline
