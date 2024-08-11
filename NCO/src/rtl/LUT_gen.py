import math
import matplotlib.pyplot as plt


# Para una resolución de 12 bits, voy a tomar valores de 0 a 4095

sin_lut = []

for i in range(0, 4096):
    # Calculo el seno para cada uno de los puntos en el rango 
    sin_i = math.sin(i*2*math.pi/4096)
    # Normalizo los valores entre 0 y 1 (positivos)
    sin_nor = int((sin_i + 1) * 4095 / 2)
    sin_lut.append(sin_nor)

def main():  
    # Open a file for writing and create it if it doesn't exist
    myfile = open("sin_lut.txt", "w+")     # w write + create if it does not exists

    # # write some lines of data to the file
    for i in range(0, 4096):
       # sin_lut[i] = bin(sin_lut[i])
        myfile.write(f'{i} => "{sin_lut[i]:012b}",\n')
    
    # close the file when done
    myfile.close() 


if __name__ == "__main__":
    main()