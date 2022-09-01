#include <iostream>
#include "jictcp.h"

#include <stdio.h>
#include <stdlib.h>
#include <WinSock2.h>
#pragma comment(lib, "ws2_32.lib")  //加载 ws2_32.dll

DWORD WINAPI recvMessage(LPVOID param) {
    SOCKET client = (SOCKET)param;
    char buff[1024]{ 0 };
    int recvSize;
    while ((recvSize = recv(client, buff, 1024, 0)) > 0)
    {
        printf("接收到的消息%s\n", buff);
    }
    return 0;
}

int main() {
    //初始化DLL
    WSADATA wsaData;
    int err = WSAStartup(MAKEWORD(2, 2), &wsaData);

    if (err != 0) {
        printf("WSAStartup failed with error: %d\n", err);
        return 1;
    }

    //创建套接字
    SOCKET sock = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP);
    //向服务器发起请求
    struct sockaddr_in sockAddr;
    memset(&sockAddr, 0, sizeof(sockAddr));  //每个字节都用0填充
    sockAddr.sin_family = PF_INET;
    sockAddr.sin_addr.s_addr = inet_addr("127.0.0.1");
    sockAddr.sin_port = htons(1234);
    int rs = connect(sock, (SOCKADDR*)&sockAddr, sizeof(SOCKADDR));
    if (rs != 0) {
        printf("连接失败!\n");
        return 0;
    }

    HANDLE hthread = CreateThread(NULL, NULL, recvMessage, (LPVOID)sock, NULL, NULL);

    char buff[1024]{0};

    while (scanf("%s",buff) && strcmp(buff,"exit"))
    {
        send(sock, buff, strlen(buff) + 1, 0);
    }
    
    closesocket(sock);
    CloseHandle(hthread);
    
    system("pause");
    return 0;
}