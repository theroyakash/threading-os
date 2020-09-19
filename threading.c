#include <pthread.h>
#include <stdio.h>
#include <unistd.h>

void* runOperationONThread(void * arg){
    while (1) {
        sleep(3);
        printf("First thread function is running every 3 second gap\n");
    }
    
    return NULL;
}

void runOperationONSeparateThread(){
    while (1) {
        sleep(3);
        printf("Another thread function is running every 3 second gap\n");
    }
}

int main(){
    pthread_t newOperationalThread;
    pthread_create(&newOperationalThread, NULL, runOperationONThread, NULL);
    
    runOperationONSeparateThread();
    return 0;
}
