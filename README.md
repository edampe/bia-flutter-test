# Proyecto Flutter para Bia Energy

Este proyecto ha sido desarrollado utilizando Flutter y se ha estructurado siguiendo los principios de la arquitectura limpia (Clean Architecture). La arquitectura limpia permite separar las responsabilidades del código en diferentes capas, lo que facilita el mantenimiento, la escalabilidad y la prueba del código.

Las capas de la arquitectura limpia en este proyecto son:

- **Dominio (Domain):** Esta capa contiene la lógica de negocio del proyecto. Incluye entidades, casos de uso y repositorios abstractos.

- **Infraestructura (Infrastructure):** Esta capa se encarga de implementar los repositorios abstractos definidos en la capa de dominio. Aquí se manejan las operaciones de red, la persistencia de datos, etc.

- **Proveedores (Providers):** Los proveedores son responsables de proporcionar datos a la capa de presentación. Utilizan los casos de uso definidos en la capa de dominio para obtener los datos necesarios.

- **Presentación (Presentation):** Esta capa contiene todo el código relacionado con la interfaz de usuario. Utiliza los proveedores para obtener los datos que necesita para mostrar al usuario.

El proyecto cumple con todos los requisitos especificados en la prueba técnica. Se ha implementado una lista de elementos obtenidos de la API pública de Marvel, una función de búsqueda para filtrar el contenido de la lista y una vista de detalles para cada elemento de la lista.

El proyecto ha sido probado y funciona tanto en Android como en iOS. Se ha utilizado Git para el control de versiones y el código fuente está disponible en un repositorio privado.

Además, se ha prestado especial atención a la calidad del código, siguiendo los principios SOLID y utilizando patrones de diseño donde era apropiado. También se han implementado pruebas unitarias para garantizar el correcto funcionamiento del código.

Como puntos adicionales, se ha trabajado en la optimización del rendimiento de la aplicación y se han incluido animaciones para mejorar la experiencia del usuario.

## Pasos para clonar y ejecutar el proyecto

1. Asegúrate de tener instalado Flutter y Dart en tu sistema. Si no es así, puedes seguir las instrucciones de instalación en la [página oficial de Flutter](https://flutter.dev/docs/get-started/install).

2. Clona el repositorio de GitHub utilizando el comando de git: `git clone https://github.com/edampe/bia-flutter-test.git`.

3. Navega al directorio del proyecto: `cd bia-flutter-test`.

4. Ejecuta `flutter pub get` para instalar todas las dependencias del proyecto.

5. Asegúrate de tener un dispositivo emulado o conectado. Puedes verificarlo con el comando `flutter devices`.

6. Ejecuta `flutter run` para iniciar la aplicación.

Si todo se ha configurado correctamente, deberías ver la aplicación ejecutándose en tu dispositivo o emulador.
