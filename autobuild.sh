#!/bin/bash

#configuration for iOS build setting

CODE_SIGN_IDENTITY="iPhone Distribution: xxxxxxxx Co. Ltd (xxxxxxxxx)" #证书
DISTRIBUTION_PROVISIONING_PROFILE="xxxxxxxxxx-xxxxx-xxxxx-xxxx-xxxxxxxxxxxx" #生产描述文件
CONFIGURATION="Release" #版本配置
SDK="iphoneos" #sdk类型

SOURCEDIR="xxxx/xxxx/xxxx" #工程所在目录
PROJECT="xxx.xcodeproj" #Project名
TARGET="xxxx" #target

WORKSPACE="xxxx.xcworkspace" #cocoapods工程名
SCHEME="" #scheme

IPADIR="xxxx/xxxx/xxxx" #输出ipa文件的存放目录
IPANAME="xxx.ipa" #ipa包名称

# 以上变量自行配置

#clean
xcodebuild clean

#build

if [ $1 -eq 1 ];then

xcodebuild -workspace $SOURCEDIR/$WORKSPACE \
           -scheme $SCHEME \
           -configuration $CONFIGURATION \
           build CODE_SIGN_IDENTITY=$CODE_SIGN_IDENTITY \
           PROVISIONING_PROFILE=DISTRIBUTION_PROVISIONING_PROFILE \

elif [ $1 -eq 2 ];then
xcodebuild -project SOURCEDIR/$PROJECTDIR \
           -target $TARGET \
           -sdk $SDK \
           -configuration $CONFIGURATION \
           build CODE_SIGN_IDENTITY=$CODE_SIGN_IDENTITY \
           PROVISIONING_PROFILE=DISTRIBUTION_PROVISIONING_PROFILE
#-derivedDataPath $IPADIR

else
 echo "输入‘1’选项打包workspace\n输入‘2’选项打包project"
fi



#xcrun
xcrun -sdk $SDK PackageApplication -v $SOURCEDIR/Build/Products/$CONFIGURATION-iphoneos/$SCHEMENAME.app -o $IPADIR/$IPANAME

#log
if [ -e $IPADIR/$IPANAME ];then
    echo "\n=========================\n\n\n\n"
    echo "opt. successful"
    echo "\n=========================\n\n"
#   echo "Log: \n"
#   git log -2
    open $IPADIR
else
    echo "\n=========================\n\n\n\n"
    echo "error:Create an IPA Failed"
    echo "\n=========================\n\n"
fi



#参考资料：
#http://liumh.com/2015/11/25/ios-auto-archive-ipa/
#http://www.jianshu.com/p/97c97c2ec1ca
#http://dywer.blog.51cto.com/678776/241952