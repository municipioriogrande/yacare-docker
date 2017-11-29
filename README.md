# Yacare Docker Images

Este repo contiene lo necesario para generar las imagenes de Docker para el proyecto [Yacare](https://github.com/municipioriogrande/yacare).

## Importante!

Existe una carpeta por cada entorno en el que se desea correr Yacare, con las configuraciones correspondientes al mismo.

Dentro de la carpeta `base/` se encuentra la imagen base con las dependencias compartidas entre todas las imagenes. Todas las demas imagenes se construyen a partir de esta. La imagen base no esta pensada para ser utilizada directamente por ello no con las directivas *ENTRYPOINT* ni con *CMD*.
