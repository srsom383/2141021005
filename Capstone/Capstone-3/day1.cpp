#include <iostream>
using namespace std;
#include<sys/sysinfo.h>
void displayMemoryInfo()
{
struct sysinfo info;
if(sysinfo(&info)==0)
{
cout << "Total RAM In MB:" <<info.totalram/(1024*1024) << "MB\n";
cout << "Total RAM In GB:" <<info.totalram/(1024*1024*1024) <<"GB\n";
cout << "Total Unused RAM In MB:" <<info.freeram/(1024*1024) <<"MB\n";
}
}
int main(){
displayMemoryInfo();
return 0;
}

