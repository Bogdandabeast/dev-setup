
---


# El proyecto será migrado y refactorizado en este repositorio
https://github.com/bogdandabeast/fedoracustom


## **Introducción**
Universal Blue es un proyecto impresionante que redefine la experiencia en Linux, proporcionando distribuciones altamente optimizadas. Desde **Bluefin**, ideal para portátiles, hasta **Bazzite**, pensado para gaming, Universal Blue mantiene un enfoque en la calidad y facilidad de uso.

Este proyecto es una adaptación personalizada de **Fedora Atomic**, diseñada para satisfacer mis necesidades específicas, combinando alto rendimiento, herramientas de desarrollo avanzadas y una configuración automatizada y resiliente.

## **¿Qué es un Bootable Container?**
Un **bootable container** encapsula todo el sistema operativo, incluyendo el kernel de Linux, el cargador de arranque y los controladores, dentro de una imagen de contenedor. Esto permite que dicha imagen arranque y opere como un sistema completo.

![Bootable Container](image.png)

📢 También hay una versión con **drivers NVIDIA Open** de **Negativo17**, completamente automatizada y preconfigurada.

---

### 🔹 **Warp VPN y Virtualización avanzada**
Este setup también incorpora:
- 🔒 **Warp VPN** → Acceso rápido y seguro a una VPN con Cloudflare.
- 🖥 **Virt-Manager, Libvirt y KVM** → Soporte completo para la gestión de **máquinas virtuales**, permitiendo ejecutar sistemas completos con alto rendimiento.
- 🏗 **Compatibilidad con Incus** → Soporte para contenedores ligeros tipo LXD.

---

## **¿Cómo funciona el proceso?**
![Proceso](image-1.png)

## **Instalación**
> ⚠️ **Nota:** Esta es una versión personalizada para mí, por lo que no hay ISOs públicas. El sistema se despliega automáticamente en mi ordenador.

Para convertir una instalación **Fedora Atomic** existente a esta versión:
```bash
# Primero cambia a la imagen no firmada para instalar claves y políticas de firma:
rpm-ostree rebase ostree-unverified-registry:ghcr.io/bogdandabeast/hyprland-nvidia-open:latest

# Reinicia el sistema:
systemctl reboot

# Luego cambia a la imagen firmada:
rpm-ostree rebase ostree-image-signed:docker://ghcr.io/bogdandabeast/devsetup-nvidia-open:latest

# Reinicia nuevamente:
systemctl reboot
```
La etiqueta `latest` automáticamente apuntará a la última versión.

---

## **Verificación**
Estas imágenes están firmadas con [Sigstore](https://www.sigstore.dev/) y [cosign](https://github.com/sigstore/cosign). Puedes verificar la firma ejecutando:
```bash
cosign verify --key cosign.pub ghcr.io/bogdandabeast/dev-setup
```

---

## **ISO**
*(Sección pendiente)*

---
