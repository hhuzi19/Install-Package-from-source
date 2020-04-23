echo "Install Multiple packages from source"
echo "This will give you an option to install multiple packages from source"
echo "Press 1. to Bulid package from git"
echo "Press 2. to install project from .tar files"
read input
if [ $input -eq 1 ];
then
echo "It will install package from git..."
echo "check essentials tools for the installation..."
if(dpkg -s git >/dev/null 2>&1);
then
echo "Git found..."
else
sudo apt install git
fi
if(dpkg -s clang >/dev/null 2>&1);
then
echo "clang found"
else
sudo apt install clang
fi
if(dpkg -s g++ >/dev/null 2>&1);
then
echo "g++ found"
else
sudo apt install g++
fi
if(dpkg -s cmake >/dev/null 2>&1);
then
echo "cmake found..."
else
sudo apt install cmake
fi
echo "Enter your git clone link: "
read gitclone
git clone $gitclone
cd bin
cmake ..
make -j8
sudo make install
elif [ $input -eq 2 ];
then
echo "we have some tar files for demo in the download directory..."

tar -xvf mpg123-1.12.2.tar
cd mpg123-1.12.2
./configure
make
sudo make install
fi


