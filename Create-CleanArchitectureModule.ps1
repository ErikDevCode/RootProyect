param (
    [string]$ModuleName = "MyModule"
)

# Ruta base del script (funciona en todas las plataformas)
$solutionPath = Join-Path $PSScriptRoot "src"

# Crear la carpeta src si no existe
if (-Not (Test-Path $solutionPath)) {
    New-Item -Path $solutionPath -ItemType Directory | Out-Null
    Write-Host "Carpeta 'src' creada."
}

Set-Location $solutionPath

# Crear la solución dentro de src/
dotnet new sln -n $ModuleName
Write-Host "Solución $ModuleName.sln creada en src."

# Crear los proyectos dentro de src/
dotnet new classlib -n "$ModuleName.Application"
dotnet new classlib -n "$ModuleName.Domain"
dotnet new classlib -n "$ModuleName.Infrastructure"
dotnet new classlib -n "$ModuleName.Presentation"
dotnet new webapi    -n "$ModuleName.Web"
Write-Host "Proyectos generados."

# Agregar proyectos a la solución
dotnet sln "$ModuleName.sln" add "$ModuleName.Application/$ModuleName.Application.csproj"
dotnet sln "$ModuleName.sln" add "$ModuleName.Domain/$ModuleName.Domain.csproj"
dotnet sln "$ModuleName.sln" add "$ModuleName.Infrastructure/$ModuleName.Infrastructure.csproj"
dotnet sln "$ModuleName.sln" add "$ModuleName.Presentation/$ModuleName.Presentation.csproj"
dotnet sln "$ModuleName.sln" add "$ModuleName.Web/$ModuleName.Web.csproj"
Write-Host "Proyectos añadidos a la solución."

# Agregar referencias entre capas
dotnet add "$ModuleName.Application/$ModuleName.Application.csproj" reference "$ModuleName.Domain/$ModuleName.Domain.csproj"

dotnet add "$ModuleName.Infrastructure/$ModuleName.Infrastructure.csproj" reference `
    "$ModuleName.Application/$ModuleName.Application.csproj" `
    "$ModuleName.Domain/$ModuleName.Domain.csproj"

dotnet add "$ModuleName.Presentation/$ModuleName.Presentation.csproj" reference "$ModuleName.Application/$ModuleName.Application.csproj"

dotnet add "$ModuleName.Web/$ModuleName.Web.csproj" reference `
    "$ModuleName.Presentation/$ModuleName.Presentation.csproj" `
    "$ModuleName.Application/$ModuleName.Application.csproj"

Write-Host ""
Write-Host "Modulo $ModuleName listo en la carpeta src/"