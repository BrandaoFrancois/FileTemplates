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
    echo "#include <iostream>" >> $classHeaderFile;
    echo "" >> $classHeaderFile;
    echo "class $className {" >> $classHeaderFile;
    echo "public:" >> $classHeaderFile;
    echo "  $className();" >> $classHeaderFile;
    echo "  ~$className();" >> $classHeaderFile;
    echo "" >> $classHeaderFile;
    echo "  $className &operator = (const $className &);" >> $classHeaderFile;
    echo "  bool operator == (const $className &) const;" >> $classHeaderFile;
    echo "  friend std::ostream &operator << (std::ostream &os, const $className &);"  >> $classHeaderFile;
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
    echo "$className::~$className() {" >> $classContentFile;
    echo "}" >> $classContentFile;
    echo "" >> $classContentFile;
    echo "$className &operator = (const $className &) {" >> $classContentFile;
    echo "  return *this;" >> $classContentFile;
    echo "}" >> $classContentFile;
    echo "" >> $classContentFile;
    echo "bool operator == (const $className &) const {" >> $classContentFile;
    echo "  return false;" >> $classContentFile;
    echo "}" >> $classContentFile;
    echo "" >> $classContentFile;
    echo "std::ostream	&operator << (std::ostream &os, const $className &obj) {" >> $classContentFile;
    echo "  os << \"$className\";" >> $classContentFile;
    echo "  return os;" >> $classContentFile;
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
