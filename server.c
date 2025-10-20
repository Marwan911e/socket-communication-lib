#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>

int main() {
    int server_socket, client_socket;
    struct sockaddr_in server_addr, client_addr;
    char buffer[1024];
    int num1, num2, result;
    socklen_t addr_size;

    server_socket = socket(AF_INET, SOCK_STREAM, 0);
    if (server_socket < 0) {
        perror("Socket creation failed");
        return 1;
    }
    printf("Server socket created.\n");

    server_addr.sin_family = AF_INET;
    server_addr.sin_port = htons(8080);
    server_addr.sin_addr.s_addr = INADDR_ANY;

    if (bind(server_socket, (struct sockaddr*)&server_addr, sizeof(server_addr)) < 0) {
        perror("Bind failed");
        close(server_socket);
        return 1;
    }
    printf("Socket bound to port 8080.\n");

    if (listen(server_socket, 3) < 0) {
        perror("Listen failed");
        close(server_socket);
        return 1;
    }
    printf("Server listening for connections...\n");

    addr_size = sizeof(client_addr);
    client_socket = accept(server_socket, (struct sockaddr*)&client_addr, &addr_size);
    printf("Client connected.\n");

    while (1) {
        memset(buffer, 0, sizeof(buffer));
        read(client_socket, buffer, sizeof(buffer));
        printf("Received command: %s\n", buffer);

        if (strncmp(buffer, "EXIT", 4) == 0) {
            printf("Client requested to exit.\n");
            break;
        } else if (sscanf(buffer, "SQUARE %d", &num1) == 1) {
            result = num1 * num1;
            sprintf(buffer, "Result: %d", result);
        } else if (sscanf(buffer, "SUM %d %d", &num1, &num2) == 2) {
            result = num1 + num2;
            sprintf(buffer, "Result: %d", result);
        } else {
            sprintf(buffer, "Invalid command");
        }

        send(client_socket, buffer, strlen(buffer), 0);
    }

    close(client_socket);
    close(server_socket);

    printf("Server shut down.\n");

    return 0;

}