# Import libraries
import sys
import socket
import serial

PORT = "COM4"


def getData():
    try:
        # open serial port
        with serial.Serial(PORT) as ser:
            # read a string
            res = ser.readline().decode("Ascii").strip()
            return res
    except Exception as e:
        print(f'Error in connection: {e}')


def tcpServer(portNum):
    """
    server application to establish a tcp connection with a client
    """

    # initiate server host and port variables. host is set to the
    # loopback interface only allowing processes on the localhost will
    # be able to connect to the server
    serverHost = "127.0.0.1"
    serverPort = int(portNum)

    # initiate end of message and end of transmission signals
    eomSignal = b"\r\n"
    eotSignal = b"/q"

    # with allows us to use socket without calling serverSocket.close()
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as serverSocket:
        serverSocket.bind((serverHost, serverPort))

        # instruct the server to listen for tcp requests
        print(f"Server listening on: {serverHost} on port: {serverPort}")
        serverSocket.listen()

        # accept the tcp request and create a new socket
        connectionSocket, addr = serverSocket.accept()

        # with will automatically close our connection socket after end
        # of transmission signal is received
        with connectionSocket:
            print(f"Connected by {addr}")
            print("Type '/q' to quit")
            print("Waiting for message...")

            # maintain connection to client until end of transmission signal is received
            while True:
                # initialize recvMsg as empty bytes literal each message iteration
                recvMsg = b""

                # loop until full message is received
                while True:
                    # receive the tcp message
                    recvMsg = recvMsg + connectionSocket.recv(1024)

                    # if end of message has been reached, print message
                    if eomSignal in recvMsg:
                        # print only the message without crlf
                        print(recvMsg.decode().replace("\r\n", ""))
                        break

                if recvMsg == eotSignal + eomSignal:
                    break

                # take user input as bytes literal and append end of message signal
                # to the end before sending the entire message
                message = getData().encode() + eomSignal
                print(f"> {message}")
                connectionSocket.sendall(message)

                if message == eotSignal + eomSignal:
                    break


def main():
    if len(sys.argv) != 2:
        print(f"Usage: python3 {sys.argv[0]} port_number")
        return 0

    tcpServer(sys.argv[1])


if __name__ == "__main__":
    main()
