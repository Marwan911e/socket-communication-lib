#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>

int main() {
    int client_socket;
    struct sockaddr_in server_addr;
    char buffer[1024];
    char input[1024];

    client_socket = socket(AF_INET, SOCK_STREAM, 0);
    if (client_socket < 0) {
        perror("Socket creation failed");
        return 1;
    }
    printf("Client socket created.\n");

    server_addr.sin_family = AF_INET;
    server_addr.sin_port = htons(8080);
    inet_pton(AF_INET, "127.0.0.1", &server_addr.sin_addr);

    if (connect(client_socket, (struct sockaddr*)&server_addr, sizeof(server_addr)) < 0) {
        perror("Connection failed");
        close(client_socket);
        return 1;
    }
    printf("Connected to server.\n");

    printf("Commands:\n");
    printf("  SQUARE <num>\n");
    printf("  SUM <a> <b>\n");
    printf("  EXIT\n\n");

    while (1) {
        printf("Enter command: ");
        fgets(input, sizeof(input), stdin);
        input[strcspn(input, "\n")] = 0;

        send(client_socket, input, strlen(input), 0);

        if (strncmp(input, "EXIT", 4) == 0) {
            printf("Closing connection...\n");
            break;
        }

        memset(buffer, 0, sizeof(buffer));
        read(client_socket, buffer, sizeof(buffer));
        printf("Server: %s\n", buffer);
    }

    close(client_socket);
    printf("Client disconnected.\n");

    return 0;
}
