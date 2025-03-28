
---

## ¿Qué es un Bootable Container?

Un **bootable container** (contenedor arrancable) encapsula todo el sistema operativo, incluyendo el kernel de Linux, el cargador de arranque y los controladores, dentro de una imagen de contenedor. Esto permite que dicha imagen sea capaz de arrancar y operar como un sistema completo.

![booteable contaner](image.png)

## Ventajas frente a las Distribuciones Linux Tradicionales

### 1. **Inmutabilidad**
   - Las imágenes de contenedores son inmutables, lo que significa que no se pueden alterar en ejecución, reduciendo riesgos de configuraciones inconsistentes.

### 2. **Actualizaciones Transaccionales**
   - Las actualizaciones del sistema se realizan de forma transaccional. Si algo falla, el sistema se revierte automáticamente al estado previo sin interrupciones.

### 3. **Simplicidad en la Distribución**
   - Utiliza herramientas conocidas como Dockerfiles o Containerfiles para construir imágenes, haciendo el proceso de despliegue más eficiente.

### 4. **Integración con Ecosistemas Modernos**
   - Las imágenes pueden almacenarse en registros estándar como Docker Hub, Quay.io o GitHub Container Registry, integrándose fácilmente en entornos existentes.

### 5. **Consistencia**
   - Garantiza que todos los sistemas ejecuten exactamente la misma imagen, eliminando discrepancias entre diferentes instalaciones.

### 6. **Despliegue Rápido**
   - Las imágenes preconstruidas permiten despliegues más rápidos en comparación con instalaciones manuales de distribuciones tradicionales.

### 7. **Gestión Simplificada**
   - Los sistemas pueden gestionarse con herramientas conocidas del ecosistema de contenedores, reduciendo la complejidad administrativa.




## Como funciona el proceso

![como funciona](image-1.png)

## Instalación

> [!ADVERTENCIA]  
> Es una version personaliza para mi por lo tanto no hay isos, el sistema se despliega a mi ordenador automaticamente.

Para cambiar una instalación atómica de Fedora existente a la última versión:

- Primero cambia a la imagen no firmada para instalar las claves y políticas de firma adecuadas:
  ```bash
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/bogdandabeast/devsetup-nvidia-open:latest
  ```
- Reinicia para completar el cambio:
  ```bash
  systemctl reboot
  ```
- Luego cambia a la imagen firmada, de la siguiente manera:
  ```bash
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/bogdandabeast/devsetup-nvidia-open:latest
  ```
- Reinicia nuevamente para completar la instalación:
  ```bash
  systemctl reboot
  ```

La etiqueta `latest` automáticamente apuntará a la última versión.

## ISO

*(Sección pendiente)*

## Verificación

Estas imágenes están firmadas con [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). Puedes verificar la firma descargando el archivo `cosign.pub` de este repositorio y ejecutando el siguiente comando:

```bash
cosign verify --key cosign.pub ghcr.io/bogdandabeast/dev-setup
```
