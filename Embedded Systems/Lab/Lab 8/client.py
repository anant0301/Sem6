# Import libraries
import sys
import socket
import serial

PORT = "COM3"


def getData():
    try:
        # open serial port
        with serial.Serial(PORT) as ser:
            # read a string
            res = ser.readline().decode("Ascii").strip()
            return res
    except Exception as e:
        print(f'Error in connection: {e}')



def tcpClient(portNum):
    """
    client application to establish a tcp connection with a server
    """

    # initiate server host and port variables. host is set to the
    # loopback interface only allowing processes on the localhost will
    # be able to connect to the server
    serverHost = "6.tcp.ngrok.io"
    serverPort = int(portNum)

    # initiate end of message and end of transmission signals
    eomSignal = b"\r\n"
    eotSignal = b"/q"

    # "with" allows us to use socket() without calling .close()
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as clientSocket:
        # client connects to server host and port
        clientSocket.connect((serverHost, serverPort))
        print(f"Connected to: {serverHost} on port: {serverPort}")
        print("Type '/q' to quit")
        print("Enter message to send...")

        # maintain connection to the server until end of transmission signal is sent
        while True:
            # take user input as bytes literal and append end of message signal
            # to the end before sending the entire message
            message = getData().encode() + eomSignal
            print(f"> {message}")
            clientSocket.sendall(message)

            if message == eotSignal + eomSignal:
                break

            # initialize recvMsg as empty bytes literal each message iteration
            recvMsg = b""

            # loop until full message is received
            while True:
                # receive the tcp message
                recvMsg = recvMsg + clientSocket.recv(1024)

                # if end of message has been reached, print message
                if eomSignal in recvMsg:
                    # print only the message without crlf
                    print(recvMsg.decode().replace("\r\n", ""))
                    break

            if recvMsg == eotSignal + eomSignal:
                break


def main():
    if len(sys.argv) != 2:
        print(f"Usage: python3 {sys.argv[0]} port_number")
        return 0

    tcpClient(sys.argv[1])


if __name__ == "__main__":
    main()
