#!/usr/bin/env fish

git submodule init
git submodule update

set base (realpath .)

set include_dirs_to_del $base/Includes/*
if count $include_dirs_to_del >/dev/null
    rm -rf $include_dirs_to_del
end

set headers_to_del cd $base/Sources/CXX*/include
if count $headers_to_del >/dev/null
    rm -rf $headers_to_del
end

set cxx_to_del cd $base/Sources/CXX*/*.cpp
if count $cxx_to_del >/dev/null
    rm -rf $cxx_to_del
end

mkdir -p $base/Includes

cd $base/Sources


for lib in CXXAvoid:libavoid CXXCola:libcola CXXDialect:libdialect CXXProject:libproject CXXTopology:libtopology CXXVPSC:libvpsc
    set parts (string split : $lib)
    set module $parts[1]
    set library $parts[2]

    mkdir -p ./$module/include

    cd ./$module
    for cppfile in ../../adaptagrams/cola/$library/*.cpp
        ln -s $cppfile (basename $cppfile)
    end

    cd include
    for hfile in ../../../adaptagrams/cola/$library/*.h
        ln -s $hfile (basename $hfile)
    end

    cd $base/Includes

    ln -s ../Sources/$module/include ./$library

    cd $base/Sources
end

cd $base