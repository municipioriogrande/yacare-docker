# Yacaré Docker Images

Este repo contiene lo necesario para generar las imágenes de Docker para el proyecto [Yacaré](https://github.com/municipioriogrande/yacare).

## ¡Importante!

Existe una carpeta por cada entorno en el que se desea correr Yacaré, con las configuraciones correspondientes al mismo.

Dentro de la carpeta `base/` se encuentra la imagen base con las dependencias compartidas entre todas las imágenes. Todas las demás imágenes se construyen a partir de ésta. La imagen base no está pensada para ser utilizada directamente por ello no con las directivas *ENTRYPOINT* ni con *CMD*.
