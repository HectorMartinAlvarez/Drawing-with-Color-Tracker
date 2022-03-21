# CIU - Práctica 6

Autor: Héctor Miguel Martín Álvarez

<h2>¡IMPORTANTE!</h2>
<h3>Este proyecto solo es compatible con la versión de 32 bits de processing.</h3>

[Más información](#dependencias)

## Introducción

Aplicación que identifica el color de un objeto y permite dibujar en la pantalla con el objeto.

## Desarrollo

El proyecto ha sido desarrollado empleando 2 ficheros: 
  - <b>CIU_6</b> </br><p>Fichero principal del proyecto desde el que mediante el uso de la cámara se identifican objetos con el color que se decida y se pueda dibujar con dicho objeto bien sea sobre la imagen captada por la cámara o sobre un lienzo en blanco.</p>
  - <b>Help</b> </br><p>Fichero donde se implementa una ventana adicional para mostrar información sobre la aplicación y sus controles.</p>

## Características

  - Identificación del color (RGB) introducido por el usuario.
  - Información y controles ubicados en su propia ventana, visible al clicar sobre el icono <img src="https://github.com/HectorMartinAlvarez/CIU_6/blob/main/CIU_6/data/help.jpg" alt="Help_Icon" width="25"/>  
  - Visualización de puntero de dibujo al reconocer el color buscado.
  - Visualización del color buscado en todo momento en la esquina inferior derecha
  - Visualización de los valores RGB del color buscado en todo momento en la esquina superior izquierda.
  - Posibilidad de visualizar el contorno del color identificado.
  - Configuración de la cámara al clicar sobre cualquier lugar de la ventana, excepto el icono de ayuda

## Controles

|Tecla|Descripción|
|:---:|:----------:|
|Q|Aumentar tolerancia del color|
|A|Reducir tolerancia del color|
|W|Aumentar valor del color Rojo|
|S|Reducir valor del color Rojo|
|E|Aumentar valor del color Verde|
|D|Reducir valor del color Verde|
|R|Aumentar valor del color Azul|
|F|Reducir valor del color Azul|
|Y|Comenzar/Terminar de dibujar|
|C|Limpiar dibujo de la pantalla|
|H|Mostrar/Ocultar imagen de la cámara|
|B|Mostrar/Ocultar contorno del color identificado|
|ESC|Cerrar la Aplicación|

## Dependencias

Para la correcta ejecución del proyecto son necesarios los siguientes archivos:
  - Librería JMyron para processing. [link](http://webcamxtra.sourceforge.net/download.shtml)
    - Una vez descargada y descomprimido el archivo .ZIP en la carpeta resultante encontrará un HowToInstall.txt con toda la información necesaria para instalar la librería.
  - Archivo DLL msvcr71.dll
  - Archivo DLL msvcp71.dll

Una vez tenga todos los archivos descritos arriba instalados debe ejecutar el proyecto con la versión de **32 bits** de processing. [link](https://processing.org/download)

En caso de tener ambas versiones de processing (32 y 64 bits), se recomienda primero ejecutar processing de 32 bits (processing.exe) y desde processing abrir el proyecto.

## Herramientas
  - Processing 3.5.4 versión x32

## Referencias
  - [Material de la asignatura Creando Interfaces de Usuario](https://github.com/otsedom/otsedom.github.io)
  - [Documentación de Processing](https://processing.org/reference)
  - [JMyron](http://webcamxtra.sourceforge.net/index.shtml)

<p float="left">
  <img src="https://github.com/HectorMartinAlvarez/CIU_6/blob/main/samples/red.png" alt="Red_Pen" width="250"/>
  <img src="https://github.com/HectorMartinAlvarez/CIU_6/blob/main/samples/green.png" alt="Green_Pen" width="250"/>
  <img src="https://github.com/HectorMartinAlvarez/CIU_6/blob/main/samples/blue.png" alt="Blue_Pen" width="250"/>
</p>

![Pen Gif](https://github.com/HectorMartinAlvarez/CIU_6/blob/main/samples/animation.gif)
![Hand Gif](https://github.com/HectorMartinAlvarez/CIU_6/blob/main/samples/animationHand.gif)
