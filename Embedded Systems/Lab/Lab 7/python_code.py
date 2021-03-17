#!/usr/bin/env python
# coding: utf-8

# In[ ]:


import serial
import tkinter as tk


# In[ ]:


class myButton(tk.Button):
    def __init__(self, code, color, master, serial_port, **kwargs):
        super(myButton, self).__init__(master= master, command= self.send_data, **kwargs)
        self.code = code
        self.color = color
        self.serial_port = serial_port
    def send_data(self):
        print(self.code, "is sent from python to UART for the color code", self.color)
        self.serial_port.write(str(self.code).encode("Ascii"))  
    

# In[ ]:


color_list = ['red', 'blue', 'green', 'Reset']


# In[ ]:


frame = tk.Tk()


# In[ ]:


serial_port = serial.Serial(port = "COM3", baudrate= 9600, bytesize= 8, timeout= 2, stopbits= serial.STOPBITS_ONE)


# In[ ]:


button_list = [myButton(code= color[0], color= color, master= frame, text= str(color), serial_port= serial_port) 
               for color in color_list]


# In[ ]:


[button.pack() for button in button_list]


# In[ ]:


frame.mainloop()
