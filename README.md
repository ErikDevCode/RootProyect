# RootProyect

Este proyecto proporciona un **script automatizado en PowerShell** que genera una estructura base de proyecto **.NET Core** limpia, organizada y lista para desarrollar módulos siguiendo buenas prácticas de arquitectura.

## 🛠️ Características

- Crea automáticamente:
  - Estructura en carpetas bajo `/src`
  - Solución `.sln`
  - Proyectos base: `Application`, `Domain`, `Infrastructure`, `Presentation`, `Web`
- Vinculación automática entre los proyectos
- Compatible con:
  - **Windows**
  - **macOS** (usando PowerShell Core)

---

## ⚙️ Requisitos

- [.NET SDK 8+](https://dotnet.microsoft.com/en-us/download)
- PowerShell:
  - Windows: PowerShell integrado
  - macOS: [Instalar PowerShell Core](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell)

---

## 🚀 Uso

Ejecuta el siguiente comando desde la terminal **ubicándote dentro de la carpeta raíz del proyecto** (donde está el script):

```powershell
.\Create-CleanArchitectureModule.ps1 -ModuleName "ClientModule"
```

Esto generará lo siguiente dentro de la carpeta `/src/ClientModule`:

```
ClientModule.sln
├── ClientModule.Application
├── ClientModule.Domain
├── ClientModule.Infrastructure
├── ClientModule.Presentation
├── ClientModule.Web
```

Todos los proyectos estarán referenciados y vinculados en la solución.

---

## 🧩 Personalización

El script puede adaptarse para:

- Cambiar nombres de carpetas o convenciones
- Agregar proyectos adicionales como `Tests` o `Shared`
- Configurar `git init`, `.editorconfig`, o `README.md` automáticamente

---

## 💻 Compatibilidad

✅ **Windows**  
✅ **macOS** con PowerShell Core  
⛔ Linux no probado, pero debería funcionar con PowerShell Core instalado

---

## 📄 Licencia

MIT License – Puedes usarlo, modificarlo y adaptarlo libremente.

---

## ✍️ Autor

**Erik Abanto**  
[LinkedIn](https://www.linkedin.com/in/erik-abanto/) · [GitHub](https://github.com/ErikDevCode)
