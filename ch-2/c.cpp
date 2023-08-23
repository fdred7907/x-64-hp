// generic c driver program

#include <cerrno>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

extern "C"
{
    // namespace to prevent name conflicts

    void asmMain(void);

    char *getTitle(void);

    int readLine (char *dest, int maxLen);
};

int readLine(char *dest, int maxLen){
    char *result = fgets(dest,maxLen,stdin);
    if (result != NULL)
    {
        int len = strlen(result);
        if (len > 0)
        {
            dest[len-1]=0;
        }
        return len;
    }
    return -1; //error if
}

int main(void)
{
    try
    {
        char *title = getTitle();
        printf("Calling %s:\n",title);
        asmMain();
        printf("Out of %s:\n",title);
    }
    catch(...)
    {
        printf("Exception Occurred. Abnormal termination. \n");
    }
}

