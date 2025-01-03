#!/bin/sh
#
# Generateur de fichier cpp
#

generateHeader() {
    className=$1;
    upperName=`echo $className | tr '[:lower:]' '[:upper:]'`;
    classHeaderFile=`echo "$className.h"`;

    echo $upperName

    touch $classHeaderFile;
    echo -n "#ifndef	__" >> $classHeaderFile;
    echo -n "$upperName" >> $classHeaderFile;
    echo "_H__" >> $classHeaderFile;
    echo -n "#define	__" >> $classHeaderFile;
    echo -n "$upperName" >> $classHeaderFile;
    echo "_H__" >> $classHeaderFile;
    echo "" >> $classHeaderFile;
    echo "class $className {" >> $classHeaderFile;
    echo "public:" >> $classHeaderFile;
    echo "  $className();" >> $classHeaderFile;
    echo "  ~$className();" >> $classHeaderFile;
    echo "private:" >> $classHeaderFile;
    echo "" >> $classHeaderFile;
    echo "};" >> $classHeaderFile;
    echo "" >> $classHeaderFile;
    echo "#endif" >> $classHeaderFile;
}

generateContent() {
    className=$1;
    classContentFile=`echo "$className.cpp"`;

    touch $classContentFile;
    echo "#include \"$className.h\"" >> $classContentFile;
    echo "" >> $classContentFile;
    echo "$className::$className() {" >> $classContentFile;
    echo "}" >> $classContentFile;
    echo "" >> $classContentFile;
    echo "$className::$className() {" >> $classContentFile;
    echo "}" >> $classContentFile;
}

if [ $# -lt 1 ];then
    echo "wclass className" 1>&2;
    exit 1;
fi

className=$1;
upperName=`echo $className | tr '[:lower:]' '[:upper:]'`;

if [ -f "$className.h" ]; then
    echo "Error: File '$className.h' already exist." 1>&2;
    exit 1;
fi

if [ -f "$className.cpp" ]; then
    echo "Error: File '$className.cpp' already exist." 1>&2;
    exit 1;
fi

echo "Generating Header File"
generateHeader "$className"
echo "Generating Content File"
generateContent "$className"
echo "Files '$className.h' and '$className.cpp' Generated"
