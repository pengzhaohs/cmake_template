Assume that your Directory is like this

DummyFolder
	cmake_template



Windows build 32
cd DummyFolder
mkdir build_win32
cd build_win32
cmake ../cmake_template -G "Visual Studio 15 2017" -DZS_QT_ROOT="......"

Windows build 64
cd DummyFolder
mkdir build_x64
cd build_x64
cmake ../cmake_template -G "Visual Studio 15 2017 Win64" -DZS_QT_ROOT="......"

Xcode build
cd DummyFolder
mkdir build
cd build
cmake ../cmake_template -G "Xcode" -DZS_QT_ROOT="......"
xcodebuild -configuration Debug
xcodebuild -configuration Release
xcodebuild -configuration MinSizeRel
xcodebuild -configuration RelWithDebInfo

Linux build
cd DummyFolder
mkdir build_debug
cd build_debug
cmake ../cmake_template -DCMAKE_BUILD_TYPE=Debug -DZS_QT_ROOT="......"
make

cd DummyFolder
mkdir build_release
cd build_release
cmake ../cmake_template -DCMAKE_BUILD_TYPE=Release -DZS_QT_ROOT="......"
make